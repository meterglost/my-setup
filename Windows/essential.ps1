#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"

# Add-AppxPackage "https://cdn.winget.microsoft.com/cache/source.msix"
winget update --accept-source-agreements

## Runtimes

winget install --exact --id Microsoft.DotNet.DesktopRuntime.6
winget install --exact --id Microsoft.DotNet.DesktopRuntime.7
winget install --exact --id Microsoft.DotNet.DesktopRuntime.8
winget install --exact --id Microsoft.DotNet.DesktopRuntime.9

winget install --exact --id Microsoft.WindowsAppRuntime.1.3
winget install --exact --id Microsoft.WindowsAppRuntime.1.4
winget install --exact --id Microsoft.WindowsAppRuntime.1.5
winget install --exact --id Microsoft.WindowsAppRuntime.1.6

## Libraries

winget install --scope machine --exact --id Microsoft.VCRedist.2008.x86
winget install --scope machine --exact --id Microsoft.VCRedist.2008.x64

winget install --scope machine --exact --id Microsoft.VCRedist.2010.x86
winget install --scope machine --exact --id Microsoft.VCRedist.2010.x64

winget install --scope machine --exact --id Microsoft.VCRedist.2012.x86
winget install --scope machine --exact --id Microsoft.VCRedist.2012.x64

winget install --scope machine --exact --id Microsoft.VCRedist.2013.x86
winget install --scope machine --exact --id Microsoft.VCRedist.2013.x64

winget install --scope machine --exact --id Microsoft.VCRedist.2015+.x86
winget install --scope machine --exact --id Microsoft.VCRedist.2015+.x64

## Apps

Start-Process "ms-windows-store://pdp/?ProductId=9pmmsr1cgpwg" -Wait
Start-Process "ms-windows-store://pdp/?ProductId=9n4wgh0z6vhq" -Wait

winget install --scope machine --exact --id Microsoft.PCManager
winget install --scope machine --exact --id M2Team.NanaZip
winget install --scope machine --exact --id Cloudflare.Warp

# https://config.office.com/deploymentsettings
$OfficeConfiguration = @"
<Configuration>
  <Add OfficeClientEdition="64" Channel="Current">
    <Product ID="O365ProPlusRetail">
      <Language ID="en-us" />
      <ExcludeApp ID="Access" />
      <ExcludeApp ID="Groove" />
      <ExcludeApp ID="Lync" />
      <ExcludeApp ID="OneDrive" />
      <ExcludeApp ID="OneNote" />
      <ExcludeApp ID="Outlook" />
      <ExcludeApp ID="OutlookForWindows" />
      <ExcludeApp ID="Publisher" />
      <ExcludeApp ID="Teams" />
      <ExcludeApp ID="Bing" />
    </Product>
    <Product ID="ProofingTools">
      <Language ID="vi-vn" />
    </Product>
  </Add>
  <RemoveMSI />
  <Updates Enabled="TRUE" />
  <Display Level="Full" AcceptEULA="TRUE" />
</Configuration>
"@

$OfficeConfiguration | Out-File -FilePath "${env:TEMP}/OfficeConfiguration.xml" -Encoding utf8

winget install --scope machine --exact --id Microsoft.Office --override "/configure ${env:TEMP}/OfficeConfiguration.xml"
