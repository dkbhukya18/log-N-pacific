<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows PowerShell event log is configured to at least 32768 KB (32 MB) via Group Policy registry settings on Windows 11 Pro.

.NOTES
    Author          : Dileep Kumar Bhukya
    LinkedIn        : https://www.linkedin.com/in/dkbhukya18/
    GitHub          : https://github.com/dkbhukya18
    Date Created    : 2026-09-23
    Last Modified   : 2026-09-23
    Version         : 1.2
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000585
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000585/

.TESTED ON
    Date(s) Tested  : 2026-09-23
    Tested By       : Dileep Kumar Bhukya
    Systems Tested  : Windows 11 Pro VM (Build 22H2 / 23H2)
    PowerShell Ver. : 5.1 / 7.x

.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator) inside the VM.

    Example syntax:
    PS C:\> .\remediation_WN11-AU-000585.ps1
#>

# Requires administrative privileges to modify HKLM:\SOFTWARE\Policies
#Requires -RunAsAdministrator

# Define the target registry key path, value name, and size (32,768 KB = 32 MB)
$registryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\PowerShell'
$name         = 'MaxSize'
$value        = 32768

# -Force ensures all missing parent keys (including EventLog\PowerShell) are created
if (-not (Test-Path -Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Create or update the MaxSize DWORD value
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
