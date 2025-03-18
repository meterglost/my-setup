#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"

$UsefulCaps = @(
    "App.WirelessDisplay.Connect"
)

$UselessCaps = @(
    "App.StepsRecorder"
    "Browser.InternetExplorer"
    "MathRecognizer"
    "Microsoft.Windows.WordPad"
    "Microsoft.Windows.PowerShell.ISE"
)

$WindowsCaps = Get-WindowsCapability -Online
$WindowsCaps | ForEach-Object { $_.Name = ($_.Name -split("~~~~"))[0] }

$NotPresentUsefulCaps = $WindowsCaps | Where-Object { $_.State -Eq "NotPresent" -And $_.Name -In $UsefulCaps }
$InstalledUselessCaps = $WindowsCaps | Where-Object { $_.State -Eq "Installed" -And $_.Name -In $UselessCaps }


Write-Host "- Installing useful capabilities"
$NotPresentUsefulCaps | Add-WindowsCapability -Online -Name { $_.Name }
Write-Host "- Removing useless capabilities"
$InstalledUselessCaps | Remove-WindowsCapability -Online -Name { $_.Name }
