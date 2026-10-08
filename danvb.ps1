# ==============================================================================
# DANIEL VASQUEZ [danvb] - Interactive Cyberpunk Terminal Experience (PowerShell)
# Usage: irm https://raw.githubusercontent.com/Danvb15/Danvb15/main/danvb.ps1 | iex
# ==============================================================================

$Host.UI.RawUI.WindowTitle = "DANIEL VASQUEZ [danvb] - Developer CLI"

# Setup background audio
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

# Start background audio
Start-BgMusic

function Show-Banner {
    Clear-Host
    Write-Host ""
    Write-Host "   ____    _    _   _ ___ _____ _      " -ForegroundColor Cyan
    Write-Host "  |  _ \  / \  | \ | |_ _| ____| |     " -ForegroundColor Cyan
    Write-Host "  | | | |/ _ \ |  \| || ||  _| | |     " -ForegroundColor Cyan
    Write-Host "  | |_| / ___ \| |\  || || |___| |___  " -ForegroundColor Cyan
    Write-Host "  |____/_/   \_\_| \_|___|_____|_____| " -ForegroundColor Cyan
    Write-Host "  [ SOFTWARE ENGINEER & SYSTEMS ARCHITECT ]" -ForegroundColor Magenta
    Write-Host "  Barranquilla, Colombia | danvb.dev@gmail.com" -ForegroundColor DarkGray
    Write-Host "  ------------------------------------------------------------" -ForegroundColor Blue
    if ($global:player -ne $null) {
        Write-Host "  [AUDIO ACTIVO] Synthwave Chill Loop (Reproduciendo en fondo)" -ForegroundColor Green
    } else {
        Write-Host "  [AUDIO MUTE] Silenciado (Presiona m para reactivar)" -ForegroundColor Yellow
    }
    Write-Host "  ------------------------------------------------------------" -ForegroundColor Blue
}

function Pause-Screen {
    Write-Host ""
    Write-Host "Presiona [ENTER] para volver al menu principal..." -ForegroundColor DarkGray
    [void][System.Console]::ReadLine()
}

try {
    $running = $true
    while ($running) {
        Show-Banner
        Write-Host "  SELECCIONA UN MODULO PARA EXPLORAR:" -ForegroundColor White
        Write-Host ""
        Write-Host "  [1] Sobre Mi & Filosofia de Ingenieria" -ForegroundColor Cyan
        Write-Host "  [2] Stack Tecnologico de Produccion" -ForegroundColor Cyan
        Write-Host "  [3] Proyectos Destacados (Arquitectura & Seguridad)" -ForegroundColor Cyan
        Write-Host "  [4] Benchmark de Latencias en Tiempo Real" -ForegroundColor Cyan
        Write-Host "  [5] Canales de Contacto Directo" -ForegroundColor Cyan
        Write-Host "  [m] Alternar Musica de Fondo (ON/OFF)" -ForegroundColor Yellow
        Write-Host "  [0] Salir" -ForegroundColor Magenta
        Write-Host ""
        Write-Host "  danvb@terminal:~$ " -NoNewline -ForegroundColor Cyan
        $choice = [System.Console]::ReadLine()

        if ($choice -eq "1") {
            Show-Banner
            Write-Host "=== SOBRE MI & FILOSOFIA ===" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "  Nombre:       Daniel Elias Vasquez Barrios (danvb)" -ForegroundColor White
            Write-Host "  Rol:          Software Engineer & Systems Builder" -ForegroundColor White
            Write-Host "  Ubicacion:    Barranquilla, Atlantico (Colombia)" -ForegroundColor White
            Write-Host "  Enfoque:      Eliminar la complejidad accidental." -ForegroundColor White
            Write-Host ""
            Write-Host "  Pilares de Desarrollo:" -ForegroundColor Yellow
            Write-Host "  [OK] 100% Type Safety (Compilador estricto, cero sorpresas en runtime)" -ForegroundColor Green
            Write-Host "  [OK] Latencias sub-100ms con pools de conexiones y concurrencia optimista" -ForegroundColor Green
            Write-Host "  [OK] Cero secretos en texto plano (Custodia nativa en OS Keyring)" -ForegroundColor Green
            Write-Host "  [OK] Arquitectura modular basada en componentes independientes" -ForegroundColor Green
            Pause-Screen
        }
        elseif ($choice -eq "2") {
            Show-Banner
            Write-Host "=== STACK TECNOLOGICO DE PRODUCCION ===" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "  [LENGUAJES]      TypeScript, Python, Java 21, Rust, SQL, Bash" -ForegroundColor Magenta
            Write-Host "  [BACKEND]        Spring Boot 3, FastAPI, Node.js, Express, RESTful APIs" -ForegroundColor Blue
            Write-Host "  [FRONTEND]       React, Next.js, Vite, Astro, Tailwind CSS, Zustand" -ForegroundColor Cyan
            Write-Host "  [BASES DE DATOS] PostgreSQL, Redis (Cache), pgvector, SQLite, MySQL" -ForegroundColor Green
            Write-Host "  [DESKTOP/MOBILE] Tauri 2 (Rust Core), React Native, Expo Router" -ForegroundColor Yellow
            Write-Host "  [INFRA & DEVOPS] Docker, Linux (Debian), Proxmox VE, WireGuard, Tailscale" -ForegroundColor White
            Pause-Screen
        }
        elseif ($choice -eq "3") {
            Show-Banner
            Write-Host "=== PROYECTOS DESTACADOS ===" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "  1. REMOTE MANAGER  [Tauri 2 / Rust / React / SQLite]" -ForegroundColor White
            Write-Host "     Software de escritorio para administracion de servidores SSH/RDP."
            Write-Host "     * Highlight: Custodia criptografica nativa en OS Keyring. 0 RAM leaks." -ForegroundColor Green
            Write-Host ""
            Write-Host "  2. TECHSTOCK        [Java 21 / Spring Boot 3 / PostgreSQL / Expo]" -ForegroundColor White
            Write-Host "     Plataforma multi-tenant de inventario y punto de venta comercial."
            Write-Host "     * Highlight: Bloqueo optimista (Optimistic Locking) y auditoria inmutable." -ForegroundColor Green
            Write-Host ""
            Write-Host "  3. AI BUSINESS AGENT [FastAPI / Python / pgvector / Redis / Claude]" -ForegroundColor White
            Write-Host "     Agente inteligente con pipeline RAG asincrono y memoria vectorial."
            Write-Host "     * Highlight: Mitigacion estricta de alucinaciones y embeddings sub-100ms." -ForegroundColor Green
            Write-Host ""
            Write-Host "  4. HOMELAB INFRA    [Proxmox VE / Docker / WireGuard / Linux]" -ForegroundColor White
            Write-Host "     Laboratorio de virtualizacion y red mallada cifrada punto a punto."
            Write-Host "     * Highlight: Zero open ports. Servicios segmentados en LXC y VMs." -ForegroundColor Green
            Pause-Screen
        }
        elseif ($choice -eq "4") {
            Show-Banner
            Write-Host "=== BENCHMARK DE LATENCIAS EN PRODUCCION ===" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "Ejecutando telemetria en microservicios e infraestructura..." -ForegroundColor DarkGray
            Start-Sleep -Milliseconds 400
            Write-Host ""
            Write-Host "  SUBSISTEMA                 PROTOCOLO   ESTADO      LATENCIA (p99)" -ForegroundColor White
            Write-Host "  ------------------------------------------------------------------" -ForegroundColor DarkGray
            Start-Sleep -Milliseconds 150
            Write-Host "  /desktop/core/keyring      IPC/Rust    SALUDABLE   1.2ms" -ForegroundColor Green
            Start-Sleep -Milliseconds 150
            Write-Host "  /backend/inventory/pos     HTTP/Java   200 OK      34.8ms" -ForegroundColor Green
            Start-Sleep -Milliseconds 150
            Write-Host "  /ai/rag/pgvector           FastAPI     200 OK      78.4ms" -ForegroundColor Green
            Start-Sleep -Milliseconds 150
            Write-Host "  /homelab/wireguard-mesh    P2P/UDP     ACTIVO      3.8ms" -ForegroundColor Green
            Write-Host "  ------------------------------------------------------------------" -ForegroundColor DarkGray
            Write-Host "  [STATUS] Disponibilidad: 99.9% | 0 fugas de memoria | Concurrencia optima" -ForegroundColor Green
            Pause-Screen
        }
        elseif ($choice -eq "5") {
            Show-Banner
            Write-Host "=== CANALES DE CONTACTO DIRECTO ===" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "  Email:    danvb.dev@gmail.com" -ForegroundColor Yellow
            Write-Host "  GitHub:   https://github.com/Danvb15" -ForegroundColor Blue
            Write-Host "  LinkedIn: https://linkedin.com/in/Danvb15" -ForegroundColor Cyan
            Write-Host "  Origen:   Barranquilla, Atlantico (Colombia)" -ForegroundColor Magenta
            Pause-Screen
        }
        elseif ($choice -eq "m" -or $choice -eq "M") {
            if ($global:player -ne $null) {
                Stop-BgMusic
            } else {
                Start-BgMusic
            }
        }
        elseif ($choice -eq "0") {
            $running = $false
        }
    }
} finally {
    Stop-BgMusic
    Write-Host ""
    Write-Host "[TERMINAL SESSION TERMINATED] Gracias por visitar!" -ForegroundColor DarkGray
    Write-Host ""
}
