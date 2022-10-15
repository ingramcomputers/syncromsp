Import-Module $env:SyncroModule

$file = "C:\IT-Support\PhishAlertButtonSetup.exe"
$argu = '/q /ComponentArgs "KnowBe4 Phish Alert Button":"$lic"""'

Start-Process -NoNewWindow -FilePath $file -ArgumentList $argu