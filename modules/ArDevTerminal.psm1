$ProjectRoot = Split-Path -Parent $PSScriptRoot

. (Join-Path $ProjectRoot "src\Utils\Logger.ps1")
. (Join-Path $ProjectRoot "src\Commands\Doctor.ps1")
. (Join-Path $ProjectRoot "src\Commands\About.ps1")
. (Join-Path $ProjectRoot "src\Commands\Version.ps1")
. (Join-Path $ProjectRoot "src\Core\Router.ps1")

Export-ModuleMember -Function ardev