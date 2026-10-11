 <#
.SYNOPSIS
    This script disables the Secondary Logon service to mitigate privilege escalation risks during user sessions, enhancing overall system security.

.NOTES
    Author          : Mark Mooli
    LinkedIn        : linkedin.com/in/markmooli/
    GitHub          : github.com/msmooli
    Date Created    : 2025-08-09
    Last Modified   : 2025-08-10
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000175

.USAGE
    Run from an elevated (Administrator) PowerShell session:
    PS C:\> .\WN10-00-000175.ps1
#>

# Run this as Administrator
# Disable Secondary Logon (seclogon)
[CmdletBinding()]
param()

Write-Host "Disabling the Secondary Logon service (seclogon)..." -ForegroundColor Cyan

try {
    # 1) Stop the service if running
    Stop-Service -Name 'seclogon' -Force -ErrorAction SilentlyContinue

    # 2) Mark it Disabled in Service Control Manager
    Set-Service -Name 'seclogon' -StartupType Disabled

    # 3) Force registry 'Start' = 4 to ensure full compliance
    Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\seclogon' -Name 'Start' -Value 4

    Write-Host "Secondary Logon service disabled and registry updated (Start=4)." -ForegroundColor Green
}
catch {
    Write-Warning "Failed to disable Secondary Logon: $($_.Exception.Message)"
}
