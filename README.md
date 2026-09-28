# LOG(N) Pacific – Windows 11 STIG Remediation Scripts

PowerShell scripts that remediate Windows 11 DISA STIG findings, written during my SOC Analyst internship in the LOG(N) Pacific Cyber Range, a live Microsoft Azure environment intentionally exposed to real-world attacks.

## Workflow

1. Scan a Windows 11 VM with Tenable to identify failed DISA STIG checks.
2. Research the finding and write a PowerShell script that applies the required setting (usually a registry or policy change).
3. Run the script, then re-scan with Tenable to confirm the finding is resolved.

## Scripts

| STIG ID | What the script does |
|---|---|
| [WN11-AU-000500](stigs/WN11-AU-000500.ps1) | Sets the Application event log size to 32 MB |
| [WN11-AU-000510](stigs/WN11-AU-000510.ps1) | Sets the System event log size |
| [WN11-CC-000040](stigs/WN11-CC-000040.ps1) | Disables insecure guest logons |
| [WN11-CC-000110](stigs/WN11-CC-000110.ps1) | Disables printing over HTTP |
| [WN11-CC-000204](stigs/WN11-CC-000204.ps1) | Configures Windows Analytics (diagnostic data) settings |
| [WN11-CC-000305](stigs/WN11-CC-000305.ps1) | Disables indexing of encrypted files |
| [WN11-CC-000315](stigs/WN11-CC-000315.ps1) | Prevents Windows Installer from always installing with elevated privileges |
| [WN11-CC-000326](stigs/WN11-CC-000326.ps1) | Enables PowerShell script block logging |
| [WN11-EP-000310](stigs/WN11-EP-000310.ps1) | Enables Kernel DMA Protection |
| [WN11-SO-000220](stigs/WN11-SO-000220.ps1) | Enforces NTLMv2 minimum session security |

## Usage

Run each script in an elevated PowerShell session on a Windows 11 test machine, then re-scan to verify compliance. Review each script before running it in any production environment.

## Tools

PowerShell · Tenable · DISA STIG · Microsoft Azure · Windows 11
