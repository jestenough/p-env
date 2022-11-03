function Install-Apps {
    # Utils
    scoop install gpg4win -g
    scoop install curl -g
    scoop install ffmpeg -g
    scoop install youtube-dl -g
    scoop install grep -g
    scoop install 7zip -g
    scoop install gource
    scoop install openssh

    # Programming languages
    scoop install python
    scoop install openjdk

    # etc.
    scoop install transmission
    scoop install obs-studio
    scoop install openvpn -g
    scoop install steam
    scoop install vlc
    scoop install anki
    scoop install spotify

    # Typing
    scoop install vim
    scoop install latex

    # Programming
    scoop install git -g
    scoop install vscode
    scoop install draw.io
    scoop install zeal
    scoop install docker
    scoop install heroku-cli
    scoop install postman

    # Books
    scoop install jabref
    scoop install libgen-desktop
    # TODO: STDUViewer...

    # Communication
    scoop install firefox
    scoop install telegram
    scoop install discord
    scoop install thunderbird
    scoop install tor-browser

    # Fonts
    scoop install JetBrains-Mono
}


function Add-Buckets {
    scoop bucket add main
    scoop bucket add extras
    scoop bucket add java
    scoop bucket add versions
    scoop bucket add nerd-fonts
    scoop update
}


function Main {
    $ErrorActionPreference = "Stop"
    Add-Buckets
    Install-Apps
}


Main