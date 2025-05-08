$currentPassword = $args[0].Trim("'").Trim('"')
$date = Get-Date -Format "MM_dd_yyyy_HH-mm"
Start-Transcript -Path "C:\FogInstall\\ClearBiosPassword-$date.txt"

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
# Takes in one argument from argv, 'Current Password' which is the current Bios password
Write-Host " >Clearing Bios Password"
if (($args[0]).Equals('')){
# Bios Password cannot be equal to nothing
    Write-Host "!!Need to enter a password!!" 
    exit 0
}elseif(($args[0]).Length -lt 8){
# Entered password needs to be atleast 8 characters in length
    Write-Host "!!Password Needs to be at least 8 characters!!"
    exit 0
}
Write-Host  " >Current Password: $($args[0])"
# Clears current password with Clear-HPBIOSSetupPassword and passed argument
Clear-HPBIOSSetupPassword -Password $currentPassword 
Write-Host "Cleared Bios Password."

Start-Sleep 3

Stop-Transcript