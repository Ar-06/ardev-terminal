function Copy-ArDevFile {
    param(
        [string]$Source,
        [string]$Destination,
        [string]$Label
    )

    if (!(Test-Path $Source)) {
        throw "Missing file: $Source"
    }

    Copy-Item $Source -Destination $Destination -Force
    Write-ArDevOk "$Label"
}

function Install-ArDevTerminal {
    param(
        [string]$ProjectRoot
    )

    $PowerShellConfigPath = Join-Path $HOME ".config\powershell"
    $StarshipConfigPath = Join-Path $HOME ".config"
    $BackupPath = Join-Path $ProjectRoot "backups"
    $FastfetchConfigPath = Join-Path $HOME ".config\fastfetch"

    Clear-Host
    Write-Host ""
    Write-Host "==========================================" -ForegroundColor DarkGray
    Write-Host "        ArDev Terminal Installer" -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor DarkGray
    Write-Host ""

    Write-ArDevInfo "Creating configuration folders..."

    New-Item -ItemType Directory -Force $PowerShellConfigPath | Out-Null
    New-Item -ItemType Directory -Force $StarshipConfigPath | Out-Null
    New-Item -ItemType Directory -Force $BackupPath | Out-Null
    New-Item -ItemType Directory -Force $FastfetchConfigPath | Out-Null

    Write-ArDevOk "Folders ready"

    if (Test-Path $PROFILE) {
        $Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
        $BackupFile = Join-Path $BackupPath "Microsoft.PowerShell_profile.$Timestamp.ps1"
        Copy-Item $PROFILE $BackupFile -Force
        Write-ArDevWarn "PowerShell profile backed up"
    }

    Write-Host ""
    Write-ArDevInfo "Installing configuration..."

    Copy-ArDevFile -Source (Join-Path $ProjectRoot "config\aliases.ps1") -Destination (Join-Path $PowerShellConfigPath "aliases.ps1") -Label "aliases.ps1"
    Copy-ArDevFile -Source (Join-Path $ProjectRoot "config\functions.ps1") -Destination (Join-Path $PowerShellConfigPath "functions.ps1") -Label "functions.ps1"
    Copy-ArDevFile -Source (Join-Path $ProjectRoot "themes\ardev.toml") -Destination (Join-Path $StarshipConfigPath "starship.toml") -Label "ArDev Starship Theme"
    Copy-ArDevFile -Source (Join-Path $ProjectRoot "config\fastfetch\config.jsonc") -Destination (Join-Path $FastfetchConfigPath "config.jsonc") -Label "Fastfetch config"
    Copy-ArDevFile -Source (Join-Path $ProjectRoot "config\fastfetch\ardev.txt") -Destination (Join-Path $FastfetchConfigPath "ardev.txt") -Label "Fastfetch logo"
    Copy-ArDevFile -Source (Join-Path $ProjectRoot "config\profile.ps1") -Destination $PROFILE -Label "PowerShell profile"

    Write-Host ""
    Write-Host "Installation completed successfully." -ForegroundColor Green
    Write-Host ""
    Write-Host "Run:"
    Write-Host '    . $PROFILE' -ForegroundColor White
    Write-Host ""
}