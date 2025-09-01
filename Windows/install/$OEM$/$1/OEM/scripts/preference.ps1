#Requires -RunAsAdministrator
$ErrorActionPreference = "Inquire"

function Set-RegionAndFormat {
    Set-Culture -CultureInfo 'en-001';
}

function Disable-AutoRun {
    $params = @{
        Path = 'Registry::HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer';
    };
    New-Item @params -ErrorAction 'SilentlyContinue';
    Set-ItemProperty @params -Name 'NoDriveAutoRun' -Type 'DWord' -Value 0x3FFFFFF;
    Set-ItemProperty @params -Name 'NoDriveTypeAutoRun' -Type 'DWord' -Value 0xFF;
}

Set-RegionAndFormat
Disable-AutoRun
