
$ErrorActionPreference = 'Stop'

Write-Host "Checking the latest version of Podman"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$tag = (Invoke-WebRequest "https://api.github.com/repos/containers/podman/releases/latest" | ConvertFrom-Json)[0].tag_name

$destination="$env:HOMEDRIVE\podman"
Write-Host "Creating folder on $destination"
mkdir -force $destination | Out-Null

Write-Host "Downloading podman to $destination"
Invoke-WebRequest "https://github.com/containers/podman/releases/download/$tag/podman-$tag.msi" -UseBasicParsing -OutFile $destination\podman-$tag.msi

Write-Host "Installing podman"

