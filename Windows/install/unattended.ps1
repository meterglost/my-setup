#Requires -RunAsAdministrator
$ErrorActionPreference = "Inquire"

$scripts = @(
    "$env:SystemDrive/OEM/scripts/prefernce.ps1"
    "$env:SystemDrive/OEM/scripts/network.ps1"
    "$env:SystemDrive/OEM/scripts/apps.ps1"
) | Where-Object { Test-Path $_ }

for ($script in $scripts) {
    try {
        Write-Host "Running script: $script"
        Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -WindowStyle Normal -NoProfile -File `"$($script)`"" -Wait
    } catch {
        Write-Host "Error running script: $script"
        Write-Host "Error message: $($script.Exception.Message)"
    }
}
