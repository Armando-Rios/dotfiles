$primary = "DarkMagenta"
$secondary = "DarkCyan"
$textWhite = "White"
$textBlack = "Black"
$success = "Green"
$warning = "Yellow"

Clear-Host
# Primer conjunto de mensajes
Write-Host " STARTING ARMANDO-RIOS SETUP SCRIPT... " -ForegroundColor $textBlack -Background $primary

# Esperar 3 segundos
Start-Sleep -Seconds 3

Clear-Host

# Ruta al ejecutable de Git
$gitPath = "C:\Program Files\Git\cmd\git.exe"
$clone = "clone"
$repo = "https://github.com/armando-rios/dotfiles"
$ruteClone = "$env:USERPROFILE\.dotfiles"

function Is-GitInstalled {
    try {
        git --version > $null 2>&1
        return $true
    } catch {
        return $false
    }
}

function Install-Git {
    Write-Host " Git no esta instalado. Iniciando instalacion! " -Foreground $textBlack -Background $warning
    winget install --id Git.Git -e
    Write-Host " Git se ha instalado correctamente. " -ForegroundColor $textBlack -Background $success
}

if (-not (Is-GitInstalled)) {
    Install-Git
    Write-Host " Git se ha instalado correctamente. " -ForegroundColor $textBlack -Background $success
}

Write-Host " Tareas completadas cierra esta terminal e inicia otra. " -ForegroundColor $textBlack -Background $warning
