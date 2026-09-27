<#
.SYNOPSIS
    This PowerShell script ensures that insecure guest logons are disabled via Group Policy registry settings.

.NOTES
    Author          : Dileep Kumar Bhukya
    LinkedIn        : https://www.linkedin.com/in/dkbhukya18/
    GitHub          : https://github.com/dkbhukya18
    Date Created    : 2026-09-26
    Last Modified   : 2026-09-26
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000040
    Documentation   : https://stigaview.com/products/win11/v2r9/WN11-CC-000040/

.TESTED ON
    Date(s) Tested  : 2026-09-26
    Tested By       : Dileep Kumar Bhukya
    Systems Tested  : Windows 11 Enterprise (Build 22H2 / 23H2)
    PowerShell Ver. : 5.1 / 7.x

.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator).

    Example syntax:
    PS C:\> .\remediation_WN11-CC-000040.ps1
#>

# Requires administrative privileges to modify HKLM:\SOFTWARE\Policies
#Requires -RunAsAdministrator

# Define the registry key path, value name, and target setting (0 = Disabled insecure guest logons)
$registryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation'
$name         = 'AllowInsecureGuestAuth'
$value        = 0

# Create the key structure if it does not exist
if (-not (Test-Path -Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set or update the DWORD value for AllowInsecureGuestAuth
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
