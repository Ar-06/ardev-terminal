# ArDev Terminal - Aliases

function ll {
    eza -la --icons @Args
}

function la {
    eza -a --icons @Args
}

function cat {
    bat @Args
}

function gs {
    git status
}

function ga {
    git add .
}

function gc {
    git commit -m @Args
}

function gp {
    git push
}

function gpl {
    git pull
}

function lg {
    lazygit
}

function dc {
    docker compose @Args
}

function dcu {
    docker compose up @Args
}

function dcd {
    docker compose down @Args
}

function pyv {
    .\.venv\Scripts\Activate.ps1
}