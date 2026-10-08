# ==============================================================================
# DANIEL VASQUEZ [danvb] - Infinite Cyberdeck Stream & Observability Monitor
# Usage: irm https://raw.githubusercontent.com/Danvb15/Danvb15/main/danvb.ps1 | iex
# ==============================================================================

$Host.UI.RawUI.WindowTitle = "DANIEL VASQUEZ [danvb] - Telemetry Stream Monitor"

$audioUrl = "https://raw.githubusercontent.com/Danvb15/Danvb15/main/theme.wav"
$tempAudio = Join-Path $env:TEMP "danvb_theme.wav"
$global:player = $null

function Start-BgMusic {
    try {
        if (-not (Test-Path $tempAudio)) {
            Invoke-WebRequest -Uri $audioUrl -OutFile $tempAudio -UseBasicParsing -ErrorAction SilentlyContinue
        }
        if (Test-Path $tempAudio) {
            $global:player = New-Object System.Media.SoundPlayer($tempAudio)
            $global:player.PlayLooping()
        }
    } catch {
        # Audio fallback
    }
}

function Stop-BgMusic {
    if ($global:player -ne $null) {
        $global:player.Stop()
        $global:player.Dispose()
        $global:player = $null
    }
}

# Start music
Start-BgMusic

function Stream-Line {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Text,
        [ConsoleColor]$Color = [ConsoleColor]::White,
        [int]$DelayMs = 120
    )
    Write-Host $Text -ForegroundColor $Color
    Start-Sleep -Milliseconds $DelayMs
}

Clear-Host
Write-Host ""
Stream-Line -Text "   ____    _    _   _ ___ _____ _      " -Color Cyan -DelayMs 40
Stream-Line -Text "  |  _ \  / \  | \ | |_ _| ____| |     " -Color Cyan -DelayMs 40
Stream-Line -Text "  | | | |/ _ \ |  \| || ||  _| | |     " -Color Cyan -DelayMs 40
Stream-Line -Text "  | |_| / ___ \| |\  || || |___| |___  " -Color Cyan -DelayMs 40
Stream-Line -Text "  |____/_/   \_\_| \_|___|_____|_____| " -Color Cyan -DelayMs 40
Stream-Line -Text "  [ DANVB // INFINITE TELEMETRY & OBSERVABILITY STREAM ]" -Color Magenta -DelayMs 80
Stream-Line -Text "  Operador: Daniel Vasquez | Barranquilla, Colombia | danvb.dev@gmail.com" -Color DarkGray -DelayMs 80
Stream-Line -Text "  ------------------------------------------------------------------------" -Color Blue -DelayMs 80
Stream-Line -Text "  Audio de Fondo: Synthwave Ambient Stream [Activo] | Salir: [Ctrl+C]" -Color Green -DelayMs 200
Stream-Line -Text "  ------------------------------------------------------------------------" -Color Blue -DelayMs 200
Write-Host ""

$cycle = 1

try {
    while ($true) {
        $ts = (Get-Date).ToString("HH:mm:ss")
        Stream-Line -Text ("▶ [CICLO TELEMETRIA #" + $cycle + " // LIVE MONITOR] ---------------------------") -Color Magenta -DelayMs 140
        Stream-Line -Text ("  [" + $ts + "] Kernel: Linux Debian Core & Proxmox VE (x86_64)") -Color Green -DelayMs 90
        Stream-Line -Text ("  [" + $ts + "] Security Vault: OS Keyring initialized - 0 plaintext secrets") -Color Green -DelayMs 90
        Stream-Line -Text ("  [" + $ts + "] Fuel State: Cafe Colombiano de Especialidad [100% OVERCLOCK]") -Color Green -DelayMs 130
        Write-Host ""

        Stream-Line -Text "--- [ SUB-SISTEMAS & TELEMETRIA DE RED EN VIVO ] ---------------------" -Color Cyan -DelayMs 130
        Stream-Line -Text "  GET  /desktop/core/keyring      --> IPC/Rust    [  1.2ms ]  CIPHER: AES-256" -Color White -DelayMs 160
        Stream-Line -Text "  POST /api/inventory/pos/tx      --> Java/ACID   [ 34.8ms ]  TENANT: ISOLATED" -Color White -DelayMs 160
        Stream-Line -Text "  GET  /ai/vector/rag/semantic    --> FastAPI     [ 78.4ms ]  COSINE: 0.9412" -Color White -DelayMs 160
        Stream-Line -Text "  UDP  /mesh/wireguard/peer-hq    --> WireGuard   [  3.8ms ]  ZERO OPEN PORTS" -Color White -DelayMs 220
        Write-Host ""

        Stream-Line -Text "--- [ PILARES DE ARQUITECTURA & FILOSOFIA ] -------------------------" -Color Blue -DelayMs 130
        Stream-Line -Text "  * Filosofia    : Eliminar la complejidad accidental. Codigo limpio y modular." -Color Yellow -DelayMs 100
        Stream-Line -Text "  * Type Safety  : 100% Estricto (Rust, TypeScript, Java 21) - 0 runtime errors." -Color Yellow -DelayMs 100
        Stream-Line -Text "  * Concurrencia : Bloqueo optimista, sin carreras criticas ni contencion." -Color Yellow -DelayMs 100
        Stream-Line -Text "  * Rendimiento  : Sub-35MB RAM en escritorio - Latencias de API sub-100ms." -Color Yellow -DelayMs 180
        Write-Host ""

        Stream-Line -Text "--- [ ARSENAL EN PRODUCCION & PROYECTOS DESTACADOS ] ----------------" -Color Green -DelayMs 130
        Stream-Line -Text "  1. REMOTE MANAGER  [Rust / Tauri 2 / React / SQLite / OS Keyring]" -Color White -DelayMs 100
        Stream-Line -Text "     Custodia nativa de credenciales SSH/RDP. Destruccion de secretos en RAM." -Color DarkGray -DelayMs 80
        Stream-Line -Text "  2. TECHSTOCK        [Java 21 / Spring Boot 3 / PostgreSQL / Expo Native]" -Color White -DelayMs 100
        Stream-Line -Text "     SaaS multi-tenant para retail con auditoria contable inmutable." -Color DarkGray -DelayMs 80
        Stream-Line -Text "  3. AI BUSINESS AGENT [FastAPI / Python / pgvector / Redis / Claude]" -Color White -DelayMs 100
        Stream-Line -Text "     Pipeline RAG semantico asincrono con control riguroso de alucinaciones." -Color DarkGray -DelayMs 80
        Stream-Line -Text "  4. HOMELAB INFRA    [Proxmox VE / Docker Compose / WireGuard / Linux]" -Color White -DelayMs 100
        Stream-Line -Text "     Virtualizacion segmentada, nubes privadas y redes malladas seguras." -Color DarkGray -DelayMs 220
        Write-Host ""

        Stream-Line -Text "--- [ OBSERVABILIDAD & ESTADO DE SALUD DEL NODO ] -------------------" -Color Yellow -DelayMs 130
        Stream-Line -Text "  Desktop Memory Footprint : [####----------------] 28.4 MB (Tauri 2 / Rust Core)" -Color Cyan -DelayMs 100
        Stream-Line -Text "  Pool Connection Health   : [####################] 100% ACID Integrity (No Leaks)" -Color Green -DelayMs 100
        Stream-Line -Text "  Uptime de Disponibilidad : [####################] 99.9% Production Ready" -Color Green -DelayMs 100
        Stream-Line -Text "  Canal de Comunicacion    : danvb.dev@gmail.com | https://linkedin.com/in/Danvb15" -Color White -DelayMs 250
        Write-Host ""

        # Progress bar to next cycle
        Write-Host "  Sincronizando siguiente bloque de telemetria: " -NoNewline -ForegroundColor DarkGray
        for ($i = 0; $i -lt 20; $i++) {
            Write-Host "#" -NoNewline -ForegroundColor Cyan
            Start-Sleep -Milliseconds 60
        }
        Write-Host " 100% OK" -ForegroundColor Green
        Write-Host ""
        Start-Sleep -Milliseconds 500

        $cycle++
    }
} finally {
    Stop-BgMusic
    Write-Host ""
    Write-Host "[STREAM DISCONNECTED] Sesion finalizada. Gracias por visitar!" -ForegroundColor DarkGray
    Write-Host ""
}
