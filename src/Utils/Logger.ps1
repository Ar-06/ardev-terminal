function Write-ArDevHeader {
    Clear-Host
    Write-Host ""
    Write-Host "  ArDev Terminal" -ForegroundColor Cyan
    Write-Host "  Modern PowerShell Dev Environment" -ForegroundColor DarkGray
    Write-Host ""
}

function Write-ArDevInfo {
    param([string]$Message)
    Write-Host "[INFO] $Message" -ForegroundColor Cyan
}

function Write-ArDevOk {
    param([string]$Message)
    Write-Host "[ OK ] $Message" -ForegroundColor Green
}

function Write-ArDevWarn {
    param([string]$Message)
    Write-Host "[WARN] $Message" -ForegroundColor Yellow
}

function Write-ArDevFail {
    param([string]$Message)
    Write-Host "[FAIL] $Message" -ForegroundColor Red
}