$source="https://github.com/containers/podman/releases/latest/download/podman-remote-release-windows.zip"
$destination="$env:HOMEDRIVE\podman"

mkdir -force $destination

curl.exe $source -L -o "$destination\podman.zip"

Expand-Archive -LiteralPath "$destination\podman.zip" -DestinationPath $destination -Force

Remove-Item -LiteralPath "$destination\podman.zip"
