Import-Module $env:SyncroModule

function Import-WLAN {
[CmdletBinding()]
param (
[parameter(Mandatory=$true)]
[string]$XmlDirectory
)

#Import all WLAN Xml-files from specified directory
Get-ChildItem $XmlDirectory | Where-Object {$_.extension -eq ".xml"} | ForEach-Object {netsh wlan add profile filename=($XmlDirectory+"\"+$_.name)}
}

Import-WLAN -XmlDirectory "C:\Users\Public\Desktop\wifi"
