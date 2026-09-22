<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is configured to at least 32768 KB (32 MB) via Group Policy registry settings.

.NOTES
    Author          : Dileep Kumar Bhukya
    LinkedIn        : https://www.linkedin.com/in/dkbhukya18/
    GitHub          : https://github.com/dkbhukya18
    Date Created    : 2026-09-21
    Last Modified   : 2026-09-21
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000500/

.TESTED ON
    Date(s) Tested  : 2026-09-21
    Tested By       : Dileep Kumar Bhukya
    Systems Tested  : Windows 11 Enterprise (Build 22H2 / 23H2)
    PowerShell Ver. : 5.1 / 7.x

.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator).

    Example syntax:
    PS C:\> .\remediation_WN11-AU-000500.ps1
#>

# Requires administrative privileges to modify HKLM:\SOFTWARE\Policies
#Requires -RunAsAdministrator

# Define the registry key path, value name, and target size (32,768 KB = 32 MB)
$registryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application'
$name         = 'MaxSize'
$value        = 32768

# Create the key structure if it does not exist
if (-not (Test-Path -Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set or update the DWORD value for MaxSize
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
