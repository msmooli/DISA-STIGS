 <#
.SYNOPSIS
    The script turns off AutoPlay for devices that don’t have storage by adding a setting to the Windows registry.

.NOTES
    Author          : Mark Mooli
    LinkedIn        : linkedin.com/in/markmooli/
    GitHub          : github.com/msmooli
    Date Created    : 2025-08-07
    Last Modified   : 2025-08-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000180

.USAGE
    Run from an elevated (Administrator) PowerShell session:
    PS C:\> .\WN10-CC-000180.ps1
#>

# Run this as Administrator
# Variables
$regPath  = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer'
$valueName = 'NoAutoplayfornonVolume'
$valueData = 1

# Create the key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -Name 'Explorer' -Force | Out-Null
}

# Create or update the DWORD value
New-ItemProperty -Path $regPath `
                -Name $valueName `
                -PropertyType DWORD `
                -Value $valueData `
                -Force | Out-Null

Write-Host "Registry value '$valueName' set to $valueData under $regPath"
 
