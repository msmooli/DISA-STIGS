 <#
.SYNOPSIS
    The script disables the camera on the Windows lock screen by setting the NoLockScreenCamera policy to prevent unauthorized access. 

.NOTES
    Author          : Mark Mooli
    LinkedIn        : linkedin.com/in/markmooli/
    GitHub          : github.com/msmooli
    Date Created    : 2025-08-06
    Last Modified   : 2025-08-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000005

.USAGE
    Run from an elevated (Administrator) PowerShell session:
    PS C:\> .\WN10-CC-000005.ps1
#>

# Run this as Administrator
# Define the registry path
$regPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization'

# Create the key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the NoLockScreenCamera DWORD to 1
New-ItemProperty `
    -Path $regPath `
    -Name 'NoLockScreenCamera' `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null
 
