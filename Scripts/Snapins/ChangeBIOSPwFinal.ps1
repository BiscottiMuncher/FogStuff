$currentPassword = $args[0].Trim("'").Trim('"')
$newPassword = $args[1].Trim("'").Trim('"')
$date = Get-Date -Format "MM_dd_yyyy_HH-mm"
Start-Transcript -Path "C:\FogInstall\\ChangeBiosPassword-$date.txt"

# Check if HP.ClientManagement module is installed
# If its not installed it errors out, assuming that the modile is installed on all computers
$moduleInstalled = Get-Module -ListAvailable -Name HP.ClientManagement
if (-not $moduleInstalled) {
    Write-Host "HP.ClientManagement module not found. Please install the HP Client Management PowerShell module."
    exit 0
} else {
    Import-Module HP.ClientManagement
    Write-Host "Module Imported Suiccesfully"
}

#Bios Change Arguments
# Takes in two arguments from Argv, 'Original password' and 'New Password
# passes these arguments into Set-HPBIOSSetupPassword which changes them in Bios
Write-Host " >Setting Bios Settings"
Write-Host " >Changing Bios Password"
if (($args[1]).Equals('')){
# New password cannot equal to an empty string
    Write-Host "!!Do not set new password to empty use ClearBiosPassword Script!!" 
    exit 0
}elseif(($args[1]).Length -lt 8){
# New password cannot be less than 8 characters in length
    Write-Host "!!Password Needs to be at least 8 characters!!"
    exit 0
}
Write-Host  " >Current Password:  $currentPassword | New Password: $newPassword" 
# Sets new password in Bios
Set-HPBIOSSetupPassword -NewPassword $newPassword -Password  $currentPassword
Write-Host "Changed Bios Password."

Start-Sleep 3

Stop-Transcript