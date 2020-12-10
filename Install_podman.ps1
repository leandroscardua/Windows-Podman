
$source="https://github.com/containers/podman/releases/latest/download/podman-remote-release-windows.zip"
$destination="$env:HOMEDRIVE\podman"

Write-Host "Creating folder on $destination"
mkdir -force $destination | Out-Null

Write-Host "Downloading podman to $destination"
curl.exe --silent $source -L -o "$destination\podman.zip"

Write-Host "Expand podman file to $destination"
Expand-Archive -LiteralPath "$destination\podman.zip" -DestinationPath $destination -Force

Write-Host "Setting $destination to System Environment Variable"
$env:Path += ";$destination" 
[Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::Machine)


Write-Host "Cleaning after the installation"
Remove-Item -LiteralPath "$destination\podman.zip"
