function Install-PythonPackages {
    python -m pip install --upgrade pip

    python -m pip install pipenv
    python -m pip install pylint
    python -m pip install pytest
    python -m pip install requests
    python -m pip install notebook
}

function Main {
    $ErrorActionPreference = "Stop"
    Install-PythonPackages
}

Main