  <#
.SYNOPSIS
    This PowerShell script configures the system to block AutoRun commands, preventing programs from automatically running. 

.NOTES
    Author          : Mark Mooli
    LinkedIn        : linkedin.com/in/markmooli/
    GitHub          : github.com/msmooli
    Date Created    : 2025-07-18
    Last Modified   : 2025-07-18
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000185

.USAGE
    Run from an elevated (Administrator) PowerShell session:
    PS C:\> .\WN10-CC-000185.ps1
#>

# Define the target registry path
$regPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer'

# Ensure the key exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Create or update the NoAutorun value to 1 (REG_DWORD)
New-ItemProperty `
  -Path $regPath `
  -Name 'NoAutorun' `
  -PropertyType DWord `
  -Value 1 `
  -Force | Out-Null

Write-Host "NoAutorun set to 1 under $regPath"
 
