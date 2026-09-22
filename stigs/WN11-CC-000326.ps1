<#
.SYNOPSIS
    This PowerShell script ensures that PowerShell Script Block Logging is enabled to enforce STIG ID WN11-CC-000326.

.NOTES
    Author          : Dileep Kumar Bhukya
    LinkedIn        : https://www.linkedin.com/in/dkbhukya18/
    GitHub          : https://github.com/dkbhukya18
    Date Created    : 2026-09-22
    Last Modified   : 2026-09-22
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000326
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000326/

.TESTED ON
    Date(s) Tested  : 2026-09-22
    Tested By       : Dileep Kumar Bhukya
    Systems Tested  : Windows 11 Pro (VM)
    PowerShell Ver. : 5.1 / 7.x

.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator).

    Example syntax:
    PS C:\> .\WN11-CC-000326.ps1
#>

# Requires administrative privileges to modify HKLM:\SOFTWARE\Policies
#Requires -RunAsAdministrator

# Define key path, value name, and value (1 = Enabled)
$registryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging'
$name         = 'EnableScriptBlockLogging'
$value        = 1

# Step 1: Create the key path if it does not exist
if (-not (Test-Path -Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Step 2: Create or update the 'EnableScriptBlockLogging' DWORD property to 1
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
