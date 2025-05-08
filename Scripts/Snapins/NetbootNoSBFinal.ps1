#Check to see if there are any args to Trim
if($($args[0]).Length -gt 0){ 
    $currentPassword = $args[0].Trim("'").Trim('"')
}else{
    $currentPassword = ''
}

$date = Get-Date -Format "MM_dd_yyyy_HH-mm"
Start-Transcript -Path "C:\FogInstall\\NetbootNoSB-$date.txt"

# Check if HP.ClientManagement module is installed
# If its not installed it errors out, assuming that the modile is installed on all SCE computers
$moduleInstalled = Get-Module -ListAvailable -Name HP.ClientManagement
if (-not $moduleInstalled) {
    Write-Host "HP.ClientManagement module not found. Please install the HP Client Management PowerShell module."
    exit 0
} else {
    Import-Module HP.ClientManagement
    Write-Host "Module Imported Suiccesfully"
}

#Bios Change Arguments
# Enables PXE Boot if not already enables
# Disables SecureBoot
# Changes Boot order to IPv4(0) M.2(1)
if($($args[0]).Length -gt 0){ 
#Checks if there is a password entered in argv, if there is pass it in
# Password is only needed if there is a Bios admin password specified
# ClearBiosPassword script can be used to clear the password

    Write-Host " >Password Entered"
    Set-HPBIOSSettingValue -Name "Network (PXE) Boot" -Value "Enable" -Password $currentPassword
    Set-HPBIOSSettingValue -Name "Secure Boot" -Value "Disable" -Password $currentPassword
    Set-HPBIOSSettingValue -Name "Wake On LAN" -Value 'Boot to Network' -Password $currentPassword
    Set-HPBIOSSettingValue -Name "UEFI Boot Order" -Value 'NETWORK IPV4:EMBEDDED:1, HDD:M.2:1, HDD:USB:1' -Password $currentPassword
}
else{
#If there is no password passed through
    Set-HPBIOSSettingValue -Name "Network (PXE) Boot" -Value "Enable"
    Set-HPBIOSSettingValue -Name "Secure Boot" -Value "Disable"
    Set-HPBIOSSettingValue -Name "Wake On LAN" -Value 'Boot to Network'
    Set-HPBIOSSettingValue -Name "UEFI Boot Order" -Value 'NETWORK IPV4:EMBEDDED:1, HDD:M.2:1, HDD:USB:1'
}


Start-Sleep 3

Stop-Transcript