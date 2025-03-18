#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"

# Add-AppxPackage "https://cdn.winget.microsoft.com/cache/source.msix"
winget update --accept-source-agreements

## Tools

winget install --exact --id Microsoft.PowerShell
winget install --exact --id Microsoft.WindowsTerminal

winget install --exact --id Git.Git
winget install --exact --id Docker.DockerDesktop
winget install --exact --id Microsoft.VisualStudioCode --override '/SILENT /mergetasks="!runcode,desktopicon,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath"'

## Windows Subsystem for Linux

wsl --update
wsl --install Debian
