# DISA STIG Remediation Scripts (Windows 10)

PowerShell scripts that remediate Windows 10 DISA STIG findings identified by authenticated Tenable Nessus compliance scans. Each script targets one STIG ID, applies the required setting (registry, local security policy, or service configuration), and is safe to re-run.

## Workflow

1. Run an authenticated Nessus scan with the DISA Windows 10 STIG audit.
2. Pick a failed check and run the matching script below.
3. Re-scan to confirm the check now passes.

## Usage

Run each script from an elevated (Administrator) PowerShell session:

```powershell
PS C:\> .\STIGS\WN10-AC-000005.ps1
```

Some changes (for example DEP) take effect only after a reboot.

## Scripts

| STIG ID | What it remediates |
|---|---|
| [WN10-AC-000005](STIGS/WN10-AC-000005.ps1) | Account lockout duration set to 15 minutes (slows brute-force attacks) |
| [WN10-AC-000035](STIGS/WN10-AC-000035.ps1) | Minimum password length set to 14 characters |
| [WN10-AC-000040](STIGS/WN10-AC-000040.ps1) | Password complexity requirements enabled |
| [WN10-00-000090](STIGS/WN10-00-000090.ps1) | Enabled local accounts no longer set to "password never expires" |
| [WN10-00-000145](STIGS/WN10-00-000145.ps1) | Data Execution Prevention (DEP) set to OptOut |
| [WN10-00-000165](STIGS/WN10-00-000165.ps1) | SMBv1 server protocol disabled |
| [WN10-00-000175](STIGS/WN10-00-000175.ps1) | Secondary Logon service disabled |
| [WN10-AU-000500](STIGS/WN10-AU-000500.ps1) | Application event log maximum size set to 32,768 KB |
| [WN10-CC-000005](STIGS/WN10-CC-000005.ps1) | Camera access from the lock screen disabled |
| [WN10-CC-000035](STIGS/WN10-CC-000035.ps1) | System ignores NetBIOS name release requests (except from WINS servers) |
| [WN10-CC-000038](STIGS/WN10-CC-000038.ps1) | WDigest authentication disabled, so plaintext credentials are not kept in memory |
| [WN10-CC-000145](STIGS/WN10-CC-000145.ps1) | Password required when the device wakes from sleep (on battery) |
| [WN10-CC-000180](STIGS/WN10-CC-000180.ps1) | Autoplay disabled for non-volume devices |
| [WN10-CC-000185](STIGS/WN10-CC-000185.ps1) | Autorun commands disabled |
| [WN10-CC-000285](STIGS/WN10-CC-000285.ps1) | Remote Desktop requires secure RPC communication |
| [WN10-CC-000355](STIGS/WN10-CC-000355.ps1) | WinRM service blocked from storing RunAs credentials |
| [WN10-SO-000255](STIGS/WN10-SO-000255.ps1) | UAC automatically denies elevation requests from standard users |

## Tools

- Tenable Nessus (DISA STIG compliance audits)
- PowerShell
- Windows 10 virtual machines in Microsoft Azure
