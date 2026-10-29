# build.ps1 - produce EnchantEnhanced.zip from the repo source tree.
# Usage: powershell -ExecutionPolicy Bypass -File build.ps1
$ErrorActionPreference = "Stop"

$root = $PSScriptRoot
$out  = Join-Path $root "EnchantEnhanced.zip"

if (Test-Path $out) { Remove-Item $out -Force }

# Anchored member list -> no "./" entries, stable layout.
Push-Location $root
try {
    tar -a -cf $out pack.mcmeta pack.png assets
    if ($LASTEXITCODE -ne 0) { throw "tar failed with exit code $LASTEXITCODE" }
} finally {
    Pop-Location
}

Write-Host "Built $out"

$resourcePacks = 'Y:\Games\NRC Instances\profiles\Leben_s NVIDIA Pack\resourcepacks'
if (Test-Path -LiteralPath $resourcePacks -PathType Container) {
    $installed = Join-Path $resourcePacks 'EnchantEnhanced.zip'
    Copy-Item -LiteralPath $out -Destination $installed -Force
    Write-Host "Installed $installed"
} else {
    Write-Warning "Resource pack directory not found: $resourcePacks"
}