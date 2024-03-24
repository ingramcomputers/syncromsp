$dir = "C:\IT-Support"
if(!(Test-Path -Path $dir )){
    New-Item -ItemType directory -Path $dir
    Write-Host "IT-Support folder created"
}

Invoke-Webrequest -Uri "https://www.yourdomain.com/files/smartmontools.exe" -OutFile "C:\IT-Support\smartmontools.exe"

$command = "C:\IT-Support\smartmontools.exe"
$Parms = "/S"
$Prms = $Parms.Split( )
& "$command" $Prms

# Folder we are adding to path
$InstallLocation = "C:\Program Files\smartmontools\bin"

# To add folder to PATH
 $persistedPath = [Environment]::GetEnvironmentVariable('Path', [EnvironmentVariableTarget]::Machine) -split ';'
   if ($persistedPath -notcontains $InstallLocation) {
       $persistedPath = $persistedPath + $InstallLocation | where { $_ }
       [Environment]::SetEnvironmentVariable('Path', $persistedPath -join ';', [EnvironmentVariableTarget]::Machine)
     }

#To verify if PATH isn't already added
    $envPaths = $env:Path -split ';'
    if ($envPaths -notcontains $InstallLocation) {
        $envPaths = $envPaths + $InstallLocation | where { $_ }
        $env:Path = $envPaths -join ';'
    }

# Folder we are adding to path
$InstallLocation = "C:\Program Files (x86)\smartmontools\bin"

# To add folder to PATH
 $persistedPath = [Environment]::GetEnvironmentVariable('Path', [EnvironmentVariableTarget]::Machine) -split ';'
   if ($persistedPath -notcontains $InstallLocation) {
       $persistedPath = $persistedPath + $InstallLocation | where { $_ }
       [Environment]::SetEnvironmentVariable('Path', $persistedPath -join ';', [EnvironmentVariableTarget]::Machine)
     }

#To verify if PATH isn't already added
    $envPaths = $env:Path -split ';'
    if ($envPaths -notcontains $InstallLocation) {
        $envPaths = $envPaths + $InstallLocation | where { $_ }
        $env:Path = $envPaths -join ';'
    }
