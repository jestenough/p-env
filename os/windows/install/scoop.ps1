param ($userDiskLetter)


function Set-ScoopDirectory {
    $env:SCOOP = 'T:\scoop'
    [environment]::setEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
}


function Set-ScoopGlobalDirectory {
    $env:SCOOP_GLOBAL = $diskLetter + ":\apps"
    [Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')
}


function Install-Scoop {
    Invoke-Expression "& {$(Invoke-RestMethod get.scoop.sh)} -RunAsAdmin"
    scoop update
}


function Set-Settings {
    Set-ScoopDirectory
    Set-ScoopGlobalDirectory
}


function Main {
    $ErrorActionPreference = "Stop"
    Set-Settings
    Install-Scoop
}


Main