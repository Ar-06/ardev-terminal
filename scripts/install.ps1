$ErrorActionPreference = "Stop"

$ProjectRoot = Split-Path -Parent $PSScriptRoot

. (Join-Path $ProjectRoot "src\Logger.ps1")
. (Join-Path $ProjectRoot "src\Installer.ps1")

Install-ArDevTerminal -ProjectRoot $ProjectRoot