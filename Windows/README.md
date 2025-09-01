# Windows

Detailed instructions on how to setup a ready-to-use Windows OS

## Windows Version

-   Windows 11 - tested
-   Windows 10 - not tested, but should work

## Download ISO

-   Official
    -   https://www.microsoft.com/software-download/windows11
-   Lite
    -   https://ntdev.blog/
    -   https://windowsxlite.com/
-   Optimized
    -   https://atlasos.net/
    -   https://www.revi.cc/

## Create WinPE USB

> [!WARNING]
> This is recommended so that you have a small packed suite to repair and recovery the system when errors happened.

Prepacked:
-   https://www.hirensbootcd.org/
-   https://nhvboot.com/
-   https://anhdvboot.com/

Build your own:
-   https://github.com/ChrisRfr/Win10XPE

## Create Windows Installation USB

> [!NOTE]
> Recommend using Rufus to create bootable USB and then using partition tools to create additional data partition

-   Partition scheme: MBR (for better compatibility)
-   Partition layout:
    -   Boot partition: FAT32, 8GB as recommended
    -   Data partition: NTFS, remaining


## Config Automated Install

> [!NOTE]
> Unattended install configuration is generated using https://schneegans.de/windows/unattend-generator/

Copy `autounattend.xml` file and `$OEM$` folder to the root of boot partition (e.g. `X:/`)

## Install

> [!IMPORTANT]
> - If boot in UEFI mode, Windows partition scheme must be GPT
> - If boot in BIOS mode, Windows partition scheme must be MBR

> [!NOTE]
> - If Windows partition is not showing up and disk storage is set to RAID mode, you may need to load the [IRST](https://www.intel.com/content/www/us/en/support/products/55005/technologies/intel-rapid-storage-technology-intel-rst.html) driver

## Activate

https://github.com/massgravel/Microsoft-Activation-Scripts
