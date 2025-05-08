# Snapins

--- 
### ChangeBiosPW
Script to change HP Bios Password

Takes in two arguments 'Current PW' 'New PW' Must Use Single Quotes ''
Example: ./ChangeBIOSPwFinal.ps1 'password' 'new_pass'

Requirements:
- HP.ClientManagement be installed
- New password cannot be blank or ''
- New password Must be more than 8 characters

FOG Setup
- Snapin Arguments needs to be provided with the args
- Example: Snapin Arguments[ 'password' 'new_pass' ]

Logging and Errors
- Program logs are stored at "C:\FogInstall\ChangeBiosPassword.txt

--- 
### ClearBiosPassword
Script to Clear HP Bios Password

Takes in one argument 'Current PW' Must Use Single Quotes ''
Example: ./ClearBiosPasswordFinall.ps1 'password'

Requirements:
- HP.ClientManagement be installed
- Current password cannot be blank or ''
- Current password Must be more than 8 characters

FOG Setup
- Snapin Arguments needs to be provided with the arg
- Example: Snapin Arguments[ 'password' ]

Logging and Errors
- Program logs are stored at "C:\FogInstall\ClearBiosPassword.txt

--- 
### NetbootNoSB
Script to set Netboot and Turn OFF SecureBoot

Takes in one argument IF there is a BIOS password Set: 'Current PW' Must Use Single Quotes ''
Example: ./NetbootNoSBFinal.ps1 'password' (If there is a password)
~ or ~
Example: ./NetbootNoSBFinal.ps1 (If there isnt a password)

Requirements:
- HP.ClientManagement be installed
- Bios password if one is set

FOG Setup
- Snapin Arguments needs to be provided with the arg
- Example: Snapin Arguments[ 'password' ] IF needed

Logging and Errors
- Program logs are stored at "C:\FogInstall\NetbootNoSB.txt

--- 
### SSDwithSB
Script to set internal M.2 and Turn ON SecureBoot

Takes in one argument IF there is a BIOS password Set: 'Current PW' Must Use Single Quotes ''
Example: ./SSDwithSBFinal.ps1 'password' (If there is a password)
~ or ~
Example: ./SSDwithSBFinal.ps1 (If there isnt a password)

Requirements:
- HP.ClientManagement be installed
- Bios password if one is set

FOG Setup
- Snapin Arguments needs to be provided with the arg
- Example: Snapin Arguments[ 'password' ] IF needed

Logging and Errors
- Program logs are stored at "C:\FogInstall\SSDwithSB.txt"


