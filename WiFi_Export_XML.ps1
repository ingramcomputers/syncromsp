Import-Module $env:SyncroModule

# --- Create a WiFi folder on the public desktop ---
$dir = "C:\Users\Public\Desktop\wifi"
if(!(Test-Path -Path $dir )){
    New-Item -ItemType directory -Path $dir
    Write-Host "New folder created"
} else {   Write-Host "Wifi Folder already exists" }

$command = "netsh wlan export profile key=clear folder=C:\Users\Public\Desktop\wifi"
iex $command
