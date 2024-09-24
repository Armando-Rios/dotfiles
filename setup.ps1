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

function Show-SelectionMenu {
    param (
        [string[]]$optionList,
        [string]$prompt
    )

    $selectedOptions = @()
    $index = 0
    $maxIndex = $optionList.Length - 1

    Write-Host " RUNNING CONFIGURATION SCRIPT IRA " -ForegroundColor $textBlack -Background $primary
    Write-Host " "
    Write-Host $prompt -ForegroundColor Blue
    Write-Host " Use the up and down arrow keys to navigate. Press [Space] to select/deselect, and [Enter] to continue. " -ForegroundColor $textBlack -Background $secondary

    while ($true) { 
        Clear-Host
        Write-Host " RUNNING CONFIGURATION SCRIPT IRA " -ForegroundColor $textBlack -Background $primary
        Write-Host " "
        Write-Host " Use the up and down arrow keys to navigate. Press [Space] to select/deselect, and [Enter] to continue. " -ForegroundColor $textBlack -Background $secondary

        for ($i = 0; $i -lt $optionList.Length; $i++) {
            if ($i -eq $index) {
                Write-Host "> " -NoNewline -ForegroundColor Yellow
            } else {
                Write-Host "  " -NoNewline
            }

            if ($selectedOptions -contains $optionList[$i]) {
                Write-Host "[X] $($optionList[$i])" -Foreground Green
            } else {
                Write-Host "[ ] $($optionList[$i])"
            }
        }

        $key = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown").VirtualKeyCode

        switch ($key) {
            38 { # Flecha arriba
                $index = if ($index -gt 0) { $index - 1 } else { $maxIndex }
            }
            40 { # Flecha abajo
                $index = if ($index -lt $maxIndex) { $index + 1} else { 0 }
            }
            32 { # Espacio 
                if ($selectedOptions -contains $optionList[$index]) {
                    $selectedOptions = $selectedOptions -ne $optionList[$index]
                } else {
                    $selectedOptions += $optionList[$index]
                }
            }
            13 { # Enter
                return $selectedOptions
            }
        }
    }
}

if (-not (Is-GitInstalled)) {
    Install-Git
    Write-Host " Git se ha instalado correctamente. " -ForegroundColor $textBlack -Background $success
}

# Primera seccion: Seleccion de tareas
$tareas = @(
    "Instalacion completa",
    "Instalar programas",
    "Configurar e instalar terminal"
)

$selectedTareas = Show-SelectionMenu -optionList $tareas -prompt "Seleccionar las tareas que deseas realizar:"
