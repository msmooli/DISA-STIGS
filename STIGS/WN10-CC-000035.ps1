 <#
.SYNOPSIS
    The script configures a registry setting to disable NetBIOS name release on demand, enhancing network security.

.NOTES
    Author          : Mark Mooli
    LinkedIn        : linkedin.com/in/markmooli/
    GitHub          : github.com/msmooli
    Date Created    : 2025-08-10
    Last Modified   : 2025-08-10
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000035

.USAGE
    Run from an elevated (Administrator) PowerShell session:
    PS C:\> .\WN10-CC-000035.ps1
#>

# Run this as Administrator
# Define registry path and value
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters"
$valueName = "NoNameReleaseOnDemand"
$valueData = 1

# Create the registry value (or update if it exists)
New-ItemProperty -Path $regPath -Name $valueName -Value $valueData -PropertyType DWord -Force

# Confirm the change
Get-ItemProperty -Path $regPath -Name $valueName
 
