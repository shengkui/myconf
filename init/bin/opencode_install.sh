#!/usr/bin/env bash
set -euo pipefail

install_dir=${INSTALL_DIR:-/usr/local/bin}
repo="anomalyco/opencode"
mirror_prefix="https://gh-proxy.org/https://github.com/${repo}"

for cmd in curl tar mktemp install; do
    command -v "$cmd" >/dev/null 2>&1 || {
        echo "Error: required command '${cmd}' is not available." >&2
        exit 1
    }
done

# Architecture detection
case "$(uname -m)" in
    x86_64)        package_name="opencode-linux-x64.tar.gz" ;;
    aarch64|arm64) package_name="opencode-linux-arm64.tar.gz" ;;
    *)
        echo "Error: unsupported architecture '$(uname -m)'." >&2
        exit 2
        ;;
esac

# Resolve version
if [ "$#" -gt 1 ]; then
    echo "Usage: $0 [version]" >&2
    exit 3
fi
if [ "$#" -eq 1 ]; then
    version_number="$1"
    [[ "$version_number" =~ ^v?[0-9]+\.[0-9]+\.[0-9]+ ]] || {
        echo "Error: invalid version '${version_number}' (expected e.g. 0.1.0)." >&2
        exit 3
    }
    version_number=${version_number#v}
else
    echo "Getting the latest version number of opencode..."
    version_number=$(curl -fsSL "https://api.github.com/repos/${repo}/releases/latest" | sed -n 's/.*"tag_name": *"v\([^"]*\)".*/\1/p') || {
        echo "Error: failed to fetch version information of opencode." >&2
        exit 4
    }
    [ -n "$version_number" ] || {
        echo "Error: failed to fetch version information of opencode." >&2
        exit 4
    }
fi

# Check release existence.
echo "Checking whether opencode v${version_number} exists ..."
http_status=$(curl -sIL -o /dev/null -w "%{http_code}" "https://github.com/${repo}/releases/tag/v${version_number}") || {
    echo "Error: failed to reach GitHub." >&2
    exit 5
}
if [ "$http_status" = "404" ]; then
    echo "Error: release v${version_number} not found." >&2
    echo "Available releases: https://github.com/${repo}/releases" >&2
    exit 5
fi

# Check Install dir.
[ -d "$install_dir" ] || {
    echo "Error: ${install_dir} is not a directory." >&2
    exit 6
}

# Temporary workspace with auto-cleanup
tmp_dir=$(mktemp -d)
trap 'rm -rf "$tmp_dir"' EXIT

# Download
echo "Downloading opencode v${version_number} ..."
curl -fsSL "${mirror_prefix}/releases/download/v${version_number}/${package_name}" \
    -o "${tmp_dir}/${package_name}" || {
    echo "Error: failed to download file." >&2
    exit 7
}

# Fetch release metadata (for checksum).
echo "Fetching release metadata of opencode v${version_number} ..."
release_json=$(curl -fsSL "https://api.github.com/repos/${repo}/releases/tags/v${version_number}") || {
    echo "Error: failed to fetch release metadata of opencode." >&2
    exit 8
}

# Extract expected digest ("sha256:<hex>" or "sha512:<hex>").
if command -v jq >/dev/null 2>&1; then
    expected_digest=$(printf '%s' "$release_json" |
        jq -r --arg name "$package_name" '.assets[] | select(.name == $name) | .digest')
else
    expected_digest=$(printf '%s' "$release_json" | awk -v pkg="${package_name}" '
        /"name":/ { asset_name = $0 }
        /"digest":/ {
            if (index(asset_name, "\"name\": \"" pkg "\"") > 0) {
                line = $0
                sub(/^.*"digest": *"/, "", line)
                sub(/".*$/, "", line)
                print line
            }
            asset_name = ""
        }
    ')
fi
[ -n "$expected_digest" ] || {
    echo "Error: failed to find digest of ${package_name} in release metadata." >&2
    exit 9
}
echo "Expected digest of ${package_name}: ${expected_digest}"

# Verify checksum
digest_algo=${expected_digest%%:*}
expected_hash=${expected_digest#*:}
case "$digest_algo" in
    sha256|sha512) ;;
    *)
        echo "Error: unsupported digest algorithm '${digest_algo}'." >&2
        exit 10
        ;;
esac

checksum_cmd="${digest_algo}sum"
command -v "$checksum_cmd" >/dev/null 2>&1 || {
    echo "Error: '${checksum_cmd}' is not available on this system." >&2
    exit 11
}

echo "Verifying ${digest_algo} checksum of ${package_name} ..."
actual_hash=$("$checksum_cmd" "${tmp_dir}/${package_name}" | awk '{print $1}')
if [ "$actual_hash" != "$expected_hash" ]; then
    echo "Checksum verification FAILED:" >&2
    echo "  expected: ${expected_hash}" >&2
    echo "  actual:   ${actual_hash}" >&2
    echo "The downloaded file may be corrupted." >&2
    exit 12
fi
echo "Checksum verification passed."

# Install.
echo "Installing opencode v${version_number} ..."
mkdir "${tmp_dir}/extract"
tar xf "${tmp_dir}/${package_name}" -C "${tmp_dir}/extract"
[ -f "${tmp_dir}/extract/opencode" ] || {
    echo "Error: ${package_name} does not contain an 'opencode' binary." >&2
    exit 13
}

if [ -e "${install_dir}/opencode" ]; then
    rm -f "${install_dir}/opencode_old"
    mv "${install_dir}/opencode" "${install_dir}/opencode_old"
fi
install -m 755 "${tmp_dir}/extract/opencode" "${install_dir}/opencode"

# Post-install verification.
if ! "${install_dir}/opencode" --version >/dev/null 2>&1; then
    echo "Error: installed binary failed to run." >&2
    if [ -e "${install_dir}/opencode_old" ]; then
        mv "${install_dir}/opencode_old" "${install_dir}/opencode"
        echo "Restored previous version." >&2
    fi
    exit 14
fi

echo "done: opencode v${version_number} installed to ${install_dir}"
