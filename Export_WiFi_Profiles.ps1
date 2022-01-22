Import-Module $env:SyncroModule

$abp = "C:\PATH\TO\AutoBackup7Pro\AutoBackup7Pro.exe"
$path = "\\SERVER\SAVE\FOLDER"
$date = Get-Date -Format "yyyyMMdd"

$destination = $path + $date + " " + $customer + "\" +$asset
Write-Host $destination

$parms = "/BACKUP /LANGUAGE=""English"" /SOURCEDRIVE=$Source /TO=""$destination"" /SUBFOLDER=#DATE#\#COMPUTERNAME# /SOURCEUSERSPROFILESNAMES=""ALL"" /ALWAYSOVERWRITE /ALL"
$Prms = $Parms.Split( )
& "$abp" $Prms
