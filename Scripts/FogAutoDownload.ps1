#Written by Evan Metzinger 2025

##Base Variables to be set
$serverIP = "xxx.yyy.zzz.xyz"     #FOG Server IP address
$installDir = "C:\FogInstall"  #FOG install directory

##Create Hidden Directory at installDir
 function CreateFogDir{
    mkdir $installDir | Out-Null
    Set-ItemProperty -Path $installDir -Name Attributes -Value Hidden
}

##Download Installer into $installDir then run it
function InstallFog{
    Write-Host " Current Server Address: $serverIP"
    Write-Host " Current Install Location: $installDir"
    Write-Host " >Installing Fog..."
    # Main Download and install requests
    Invoke-WebRequest -URI "http://$serverIp/fog/client/download.php?smartinstaller" -UseBasicParsing -OutFile "$installDir\smartinstaller.exe"
    Set-Location $installDir ; .\smartinstaller.exe -server="$serverIP"
    Write-Host " >Install Complete!"
    Write-Host " >Restarting Machine in 3 Seconds"
    Start-Sleep -Seconds 3
    Restart-Computer -Force #Machine needs to be restarted so that the FOG client can fully register with server properly
}

##Check Install Folder
if (Test-Path -Path $installDir -PathType Container) {
    Write-Host " >Fog Install Dir Exists"
    InstallFog
}
else{
    CreateFogDir
    InstallFog
}

