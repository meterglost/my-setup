#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"

Get-AppxPackage -AllUsers -Name "Microsoft.MicrosoftStickyNotes" | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers -Name "Microsoft.PowerAutomateDesktop" | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers -Name "Microsoft.6365217CE6EB4" | Remove-AppxPackage -AllUsers # Microsoft Defender
