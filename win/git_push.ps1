#
# Push to all remote server
#

$REMOTE_SERVER = git remote
if ($LASTEXITCODE -ne 0) {
    Write-Host "Git command return error"
    exit 1
}

foreach ($url in $REMOTE_SERVER) {
    Write-Host ""
    Write-Host "---------------------------"
    Write-Host "  Push to ${url} ..."
    Write-Host "---------------------------"
    Write-Host ""
    git push -v $url
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "[OK]"
    } else {
        Write-Host ""
        Write-Host "[Error]"
    }
}
