<#
.SYNOPSIS
    This PowerShell script ensures that the "Always install with elevated privileges" feature is disabled for Windows Installer to enforce STIG ID WN11-CC-000315.

.NOTES
    Author          : Dileep Kumar Bhukya
    LinkedIn        : https://www.linkedin.com/in/dkbhukya18/
    GitHub          : https://github.com/dkbhukya18
    Date Created    : 2026-09-21
    Last Modified   : 2026-09-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000315/

.TESTED ON
    Date(s) Tested  : 2026-09-21
    Tested By       : Dileep Kumar Bhukya
    Systems Tested  : Windows 11 Pro (VM)
    PowerShell Ver. : 5.1 / 7.x

.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator).

    Example syntax:
    PS C:\> .\WN11-CC-000315.ps1
#>

# Requires administrative privileges to modify HKLM:\SOFTWARE\Policies
#Requires -RunAsAdministrator

# Define key path, value name, and value (0 = Disabled)
$registryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer'
$name         = 'AlwaysInstallElevated'
$value        = 0

# Step 1: Create the 'Installer' registry key path if it does not exist
if (-not (Test-Path -Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Step 2: Create or update the 'AlwaysInstallElevated' DWORD property to 0
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
