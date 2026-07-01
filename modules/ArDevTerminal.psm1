function Write-ArDevHeader {
    Clear-Host
    Write-Host ""
    Write-Host "  ArDev Terminal" -ForegroundColor Cyan
    Write-Host "  Modern PowerShell Dev Environment" -ForegroundColor DarkGray
    Write-Host ""
}

function Test-ArDevCommand {
    param(
        [string]$Name,
        [string]$Command
    )

    $exists = Get-Command $Command -ErrorAction SilentlyContinue

    if ($exists) {
        Write-Host "  [OK]   $Name" -ForegroundColor Green
    } else {
        Write-Host "  [MISS] $Name" -ForegroundColor Red
    }
}

function Invoke-ArDevDoctor {
    Write-ArDevHeader
    Write-Host "  Checking tools..." -ForegroundColor Yellow
    Write-Host ""

    Test-ArDevCommand "Git" "git"
    Test-ArDevCommand "Starship" "starship"
    Test-ArDevCommand "eza" "eza"
    Test-ArDevCommand "bat" "bat"
    Test-ArDevCommand "zoxide" "zoxide"
    Test-ArDevCommand "fzf" "fzf"
    Test-ArDevCommand "lazygit" "lazygit"
    Test-ArDevCommand "fastfetch" "fastfetch"
    Test-ArDevCommand "Docker" "docker"
    Test-ArDevCommand "Node.js" "node"
    Test-ArDevCommand "Python" "python"
    Test-ArDevCommand "WSL" "wsl"

    Write-Host ""
}

function Invoke-ArDevMenu {
    Write-ArDevHeader

    Write-Host "  ardev doctor    Check installed tools"
    Write-Host "  ardev about     Show project info"
    Write-Host ""
}

function Invoke-ArDevAbout {
    Write-ArDevHeader
    Write-Host "  ArDev Terminal is a custom developer environment for PowerShell, Windows Terminal and WSL."
    Write-Host ""
}

function ardev {
    param(
        [string]$Command
    )

    switch ($Command) {
        "doctor" { Invoke-ArDevDoctor }
        "about"  { Invoke-ArDevAbout }
        default  { Invoke-ArDevMenu }
    }
}

Export-ModuleMember -Function ardev