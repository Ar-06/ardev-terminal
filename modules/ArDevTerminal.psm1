function Write-ArDevHeader {
    Clear-Host
    Write-Host ""
    Write-Host "  ArDev Terminal" -ForegroundColor Cyan
    Write-Host "  Modern PowerShell Dev Environment" -ForegroundColor DarkGray
    Write-Host ""
}

function Get-ArDevCommandVersion {
    param([string]$Command)

    try {
        switch ($Command) {
            "git"       { return (git --version) }
            "starship"  { return ((starship --version | Select-Object -First 1) -join "") }
            "eza"       { return ((eza --version | Select-Object -First 1) -replace " -.*", "") }
            "bat"       { return (bat --version) }
            "zoxide"    { return (zoxide --version) }
            "fzf"       { return (fzf --version) }
            "lazygit"   {
    		$output = lazygit --version
    		if ($output -match "version=([^,]+)") { return "lazygit $($Matches[1])" }
	    	return "lazygit"
	     }
            "fastfetch" { return (fastfetch --version) }
            "docker"    { return (docker --version) }
            "node"      { return (node --version) }
            "python"    {
                $result = python --version 2>&1
                if ($result -match "Python was not found") { return "" }
                return $result
            }
            "wsl"       { return ((wsl --version | Select-Object -First 1) -join "") }
            default     { return "" }
        }
    }
    catch {
        return ""
    }
}

function Test-ArDevCommand {
    param(
        [string]$Name,
        [string]$Command
    )

    $exists = Get-Command $Command -ErrorAction SilentlyContinue
    $version = ""

    if ($exists) {
        $version = Get-ArDevCommandVersion -Command $Command
    }

    if ($exists -and $version) {
        Write-Host ("  [ OK ]  {0,-12} {1}" -f $Name, $version) -ForegroundColor Green
    }
    else {
        Write-Host ("  [MISS]  {0,-12}" -f $Name) -ForegroundColor Red
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