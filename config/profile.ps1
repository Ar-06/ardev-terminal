# ArDev Terminal - PowerShell Profile

$ArDevConfigPath = "$HOME\.config\powershell"

. "$ArDevConfigPath\aliases.ps1"
. "$ArDevConfigPath\functions.ps1"

Import-Module "$HOME\Projects\ardev-terminal\modules\ArDevTerminal.psm1" -Force

if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
    fastfetch
}

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })