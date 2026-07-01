function ardev {
    param(
        [string]$Command
    )

    switch ($Command) {
        "doctor"  { Invoke-ArDevDoctor }
        "about"   { Invoke-ArDevAbout }
        "version" { Invoke-ArDevVersion }
        default   {
            Write-ArDevHeader
            Write-Host "  ardev doctor     Check installed tools"
            Write-Host "  ardev about      Show project info"
            Write-Host "  ardev version    Show version"
            Write-Host ""
        }
    }
}