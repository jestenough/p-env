function Download-Audio ([string]$url, [string]$format="mp3") {
    echo "Downloading audio ($format) from $url..."
    youtube-dl --no-check-certificate --extract-audio --embed-thumbnail --audio-format $format $url ; echo "Done"
}


function Download-Video ([string] $url) {
    echo "Downloading video from ${url}..."
    youtube-dl --no-check-certificate -f bestvideo+bestaudio $url ; echo "Done"
}
