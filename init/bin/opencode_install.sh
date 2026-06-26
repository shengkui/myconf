#!/usr/bin/env bash
set -euo pipefail

package_name="opencode-linux-x64.tar.gz"
if [ $# -eq 1 ];then
    version_number="$1"
else
    echo "Get the latest version number of opencode..."
    version_number=$(curl -s https://api.github.com/repos/anomalyco/opencode/releases/latest | sed -n 's/.*"tag_name": *"v\([^"]*\)".*/\1/p')

    if [[ $? -ne 0 || -z "$version_number" ]]; then
        echo -e "Failed to fetch version information of opencode."
        exit 1
    fi
fi

# check if the version exist or not.
echo "Check the opencode v${version_number} exist or not ..."
http_status=$(curl -sI -o /dev/null -w "%{http_code}" "https://github.com/anomalyco/opencode/releases/tag/v${version_number}")
if [ "$http_status" = "404" ]; then
    echo "Error: Release v${version_number} not found"
    echo "Available releases: https://github.com/anomalyco/opencode/releases"
    exit 2
fi

# download file.
echo "Download opencode v${version_number} ..."
cd /usr/local/bin/
curl -fsSL "https://v4.gh-proxy.org/https://github.com/anomalyco/opencode/releases/download/v${version_number}/${package_name}" -O
if [ $? -ne 0 ];then
    echo "Failed to download file."
    exit 3
fi

# install it.
echo "Install opencode v${version_number} ..."
rm -f opencode_old
mv opencode opencode_old
tar xvf ${package_name} && rm -f ${package_name}
chmod 755 opencode

echo "done"

