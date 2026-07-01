# ArDev Terminal - PowerShell Profile

$ArDevConfigPath = "$HOME\.config\powershell"

. "$ArDevConfigPath\aliases.ps1"
. "$ArDevConfigPath\functions.ps1"

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })