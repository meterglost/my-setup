#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"

Get-BitLockerVolume | Where-Object { $_.ProtectionStatus -Eq "On" } | Disable-BitLocker -MountPoint { $_.MountPoint }
