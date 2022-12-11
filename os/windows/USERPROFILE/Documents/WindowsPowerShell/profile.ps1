#                       Functions
# ---------------------------------------------------------

function Get-Audio ([string]$url, [string]$format = "mp3") {
    Write-Output "Downloading audio ($format) from $url..."
    youtube-dl --no-check-certificate --extract-audio --audio-format $format $url ; Write-Output "Done"
}

function Get-Video ([string] $url) {
    Write-Output "Downloading video from ${url}..."
    youtube-dl --no-check-certificate -f bestvideo+bestaudio $url ; Write-Output "Done"
}

function New-File() {
    foreach ($fileName in $args) {
        if (-not(Test-Path $fileName)) {
            New-Item -ItemType File -Name $fileName
        }
        else {
            (Get-ChildItem $fileName).LastWriteTime = Get-Date
        }
    }
}

function Get-ProgramLocationPath {
    foreach ($program in $args) {
        if (Get-Command $program -ErrorAction SilentlyContinue) {
            Write-Output (Get-Command $program).Path
        }
        else {
            Write-Host "Program '$program' not found" -ForegroundColor Red
        }
    }
}


#                  Docker + Django func
# ---------------------------------------------------------

function New-DockerDjangoMigrations {
    docker-compose run web python3 manage.py makemigrations
}

function New-DockerDjangoMigrate {
    docker-compose run web python3 manage.py migrate
}

function New-DockerDjangoTest {
    docker-compose run web pytest
}

function New-DockerDjangoShellPlus {
    docker-compose run web python manage.py shell_plus
}


#                       Aliases
# ---------------------------------------------------------
Set-Alias -Name c -Value clear
Set-Alias -Name Touch New-File
Set-Alias -Name Which Get-ProgramLocationPath

Set-Alias -Name dj-migrations New-DockerDjangoMigrations
Set-Alias -Name dj-migrate New-DockerDjangoMigrate
Set-Alias -Name dj-test New-DockerDjangoTest
Set-Alias -Name dj-shell New-DockerDjangoShellPlus


#                       Keybindings
# ---------------------------------------------------------
Set-PSReadLineKeyHandler -Key "ctrl+a" -ScriptBlock { [Microsoft.PowerShell.PSConsoleReadLine]::BeginningOfLine() }
Set-PSReadLineKeyHandler -Key "ctrl+e" -ScriptBlock { [Microsoft.PowerShell.PSConsoleReadLine]::EndOfLine() }
Set-PSReadLineKeyHandler -Key "ctrl+y" -ScriptBlock { [Microsoft.PowerShell.PSConsoleReadLine]::Yank() }
Set-PSReadLineKeyHandler -Key "ctrl+u" -ScriptBlock { [Microsoft.PowerShell.PSConsoleReadLine]::Undo() }
