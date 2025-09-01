#Requires -RunAsAdministrator
$ErrorActionPreference = "Inquire"

# Add-AppxPackage "https://cdn.winget.microsoft.com/cache/source.msix"
winget import --accept-source-agreements --accept-package-agreements "${PWD}/WingetPackages.json"

# https://config.office.com/deploymentsettings
winget install --scope machine --exact --id Microsoft.Office --override "/configure ${PWD}/OfficeConfiguration.xml"

## Others

Start-Process "ms-windows-store://pdp/?ProductId=9pmmsr1cgpwg" -Wait
Start-Process "ms-windows-store://pdp/?ProductId=9n4wgh0z6vhq" -Wait
