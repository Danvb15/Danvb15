#!/usr/bin/env bash
# ==============================================================================
# DANIEL VASQUEZ [danvb] - Infinite Cyberdeck Stream & Observability Monitor
# Usage: curl -sL https://raw.githubusercontent.com/Danvb15/Danvb15/main/danvb.sh | bash
# ==============================================================================

# ANSI Colors
RESET="\033[0m"
BOLD="\033[1m"
DIM="\033[2m"
CYAN="\033[38;5;51m"
MAGENTA="\033[38;5;201m"
BLUE="\033[38;5;39m"
GREEN="\033[38;5;82m"
YELLOW="\033[38;5;226m"
WHITE="\033[38;5;255m"
DARK_GRAY="\033[38;5;240m"

AUDIO_URL="https://raw.githubusercontent.com/Danvb15/Danvb15/main/theme.wav"
TMP_AUDIO="/tmp/danvb_mr_robot_theme.wav"
MUSIC_PID=""

cleanup() {
  if [ -n "$MUSIC_PID" ]; then
    kill "$MUSIC_PID" 2>/dev/null
    wait "$MUSIC_PID" 2>/dev/null
  fi
  if command -v powershell.exe >/dev/null 2>&1; then
    powershell.exe -NoProfile -Command "Get-Process -Name powershell -ErrorAction SilentlyContinue | Where-Object { \$_.MainWindowTitle -eq 'danvb_audio' } | Stop-Process" 2>/dev/null
  fi
  rm -f "$TMP_AUDIO" 2>/dev/null
  echo -e "\n${DARK_GRAY}[STREAM DISCONNECTED] Sesión finalizada con éxito. ¡Gracias por visitar!${RESET}\n"
  exit 0
}

trap cleanup EXIT INT TERM

# Start audio in background
curl -sL "$AUDIO_URL" -o "$TMP_AUDIO" 2>/dev/null

if [ -f "$TMP_AUDIO" ]; then
  if command -v afplay >/dev/null 2>&1; then
    while true; do afplay "$TMP_AUDIO" 2>/dev/null; done &
    MUSIC_PID=$!
  elif command -v paplay >/dev/null 2>&1; then
    while true; do paplay "$TMP_AUDIO" 2>/dev/null; done &
    MUSIC_PID=$!
  elif command -v aplay >/dev/null 2>&1; then
    while true; do aplay -q "$TMP_AUDIO" 2>/dev/null; done &
    MUSIC_PID=$!
  elif command -v ffplay >/dev/null 2>&1; then
    ffplay -nodisp -loop 0 -loglevel quiet "$TMP_AUDIO" 2>/dev/null &
    MUSIC_PID=$!
  elif command -v mpv >/dev/null 2>&1; then
    mpv --no-video --really-quiet --loop "$TMP_AUDIO" 2>/dev/null &
    MUSIC_PID=$!
  elif command -v powershell.exe >/dev/null 2>&1; then
    powershell.exe -NoProfile -Command "\$p = New-Object System.Media.SoundPlayer('$TMP_AUDIO'); \$p.PlayLooping(); Start-Sleep -Seconds 3600" 2>/dev/null &
    MUSIC_PID=$!
  fi
fi

stream_line() {
  local text="$1"
  local delay="${2:-0.6}"
  echo -e "$text"
  sleep "$delay"
}

get_timestamp() {
  date +"%H:%M:%S"
}

clear
stream_line "${CYAN}  ██████╗   █████╗  ███╗   ██╗ ██╗   ██╗ ██████╗ ${RESET}" 0.15
stream_line "${CYAN}  ██╔══██╗ ██╔══██╗ ████╗  ██║ ██║   ██║ ██╔══██╗${RESET}" 0.15
stream_line "${CYAN}  ██║  ██║ ███████║ ██╔██╗ ██║ ██║   ██║ ██████╔╝${RESET}" 0.15
stream_line "${CYAN}  ██║  ██║ ██╔══██║ ██║╚██╗██║ ╚██╗ ██╔╝ ██╔══██╗${RESET}" 0.15
stream_line "${CYAN}  ██████╔╝ ██║  ██║ ██║ ╚████║  ╚████╔╝  ██████╔╝${RESET}" 0.15
stream_line "${CYAN}  ╚═════╝  ╚═╝  ╚═╝ ╚═╝  ╚═══╝   ╚═══╝   ╚═════╝ ${RESET}" 0.2
stream_line "${MAGENTA}  ── [ DANVB // INFINITE TELEMETRY & OBSERVABILITY STREAM ] ──${RESET}" 0.4
stream_line "${DARK_GRAY}  Operador: Daniel Vásquez  ·  Barranquilla, Colombia 🇨🇴  ·  danvb.dev@gmail.com${RESET}" 0.4
stream_line "${BLUE}  ────────────────────────────────────────────────────────────────────────${RESET}" 0.3
stream_line "${GREEN}  ♫ Audio: Mac Quayle - 1.0_8-whatsyourask.m4p (Mr. Robot OST)  ·  [Ctrl+C] Salir${RESET}" 0.8
stream_line "${BLUE}  ────────────────────────────────────────────────────────────────────────${RESET}\n" 0.8

CYCLE=1

while true; do
  TS=$(get_timestamp)
  stream_line "${BOLD}${MAGENTA}▶ [CICLO TELEMETRÍA #${CYCLE} // LIVE MONITOR] ───────────────────────────${RESET}" 0.7
  stream_line "  ${DARK_GRAY}[$TS]${RESET} ${GREEN}✔${RESET} Kernel: Linux Debian Core & Proxmox VE (x86_64)" 0.6
  stream_line "  ${DARK_GRAY}[$TS]${RESET} ${GREEN}✔${RESET} Security Vault: OS Keyring initialized · 0 plaintext secrets" 0.6
  stream_line "  ${DARK_GRAY}[$TS]${RESET} ${GREEN}✔${RESET} Fuel State: Café Colombiano de Especialidad [100% OVERCLOCK]" 0.8
  echo ""

  stream_line "${BOLD}${CYAN}--- [ SUB-SISTEMAS & TELEMETRÍA DE RED EN VIVO ] ---------------------${RESET}" 0.8
  stream_line "  ${WHITE}GET  /desktop/core/keyring${RESET}      --> ${CYAN}IPC/Rust${RESET}    ${GREEN}[  1.2ms ]${RESET}  ${DARK_GRAY}AUTH CIPHER: AES-256${RESET}" 0.7
  stream_line "  ${WHITE}POST /api/inventory/pos/tx${RESET}      --> ${BLUE}Java/ACID${RESET}   ${GREEN}[ 34.8ms ]${RESET}  ${DARK_GRAY}TENANT: ISOLATED (OK)${RESET}" 0.7
  stream_line "  ${WHITE}GET  /ai/vector/rag/semantic${RESET}    --> ${MAGENTA}FastAPI${RESET}     ${GREEN}[ 78.4ms ]${RESET}  ${DARK_GRAY}COSINE SIM: 0.9412${RESET}" 0.7
  stream_line "  ${WHITE}UDP  /mesh/wireguard/peer-hq${RESET}    --> ${YELLOW}WireGuard${RESET}   ${GREEN}[  3.8ms ]${RESET}  ${DARK_GRAY}ZERO OPEN PORTS (P2P)${RESET}" 0.9
  echo ""

  stream_line "${BOLD}${BLUE}--- [ PILARES DE ARQUITECTURA & FILOSOFÍA ] -------------------------${RESET}" 0.8
  stream_line "  ${YELLOW}• Filosofía${RESET}    : Eliminar la complejidad accidental. Código mantenible y limpio." 0.7
  stream_line "  ${YELLOW}• Type Safety${RESET}  : 100% Estricto (Rust, TypeScript, Java 21) · 0 runtime surprises." 0.7
  stream_line "  ${YELLOW}• Concurrencia${RESET} : Bloqueo optimista, sin carreras críticas ni contención de pool." 0.7
  stream_line "  ${YELLOW}• Rendimiento${RESET}  : Sub-35MB RAM en escritorio · Latencias de API sub-100ms." 0.9
  echo ""

  stream_line "${BOLD}${GREEN}--- [ ARSENAL EN PRODUCCIÓN & PROYECTOS DESTACADOS ] ----------------${RESET}" 0.8
  stream_line "  ${BOLD}${WHITE}1. REMOTE MANAGER${RESET}  ${DARK_GRAY}[Rust · Tauri 2 · React · SQLite · OS Keyring]${RESET}" 0.6
  stream_line "     Custodia nativa de credenciales SSH/RDP. Destrucción de secretos en RAM." 0.8
  stream_line "  ${BOLD}${WHITE}2. TECHSTOCK${RESET}        ${DARK_GRAY}[Java 21 · Spring Boot 3 · PostgreSQL · Expo Native]${RESET}" 0.6
  stream_line "     SaaS multi-tenant para retail con auditoría contable inmutable." 0.8
  stream_line "  ${BOLD}${WHITE}3. AI BUSINESS AGENT${RESET} ${DARK_GRAY}[FastAPI · Python · pgvector · Redis · Claude]${RESET}" 0.6
  stream_line "     Pipeline RAG semántico asíncrono con control riguroso de alucinaciones." 0.8
  stream_line "  ${BOLD}${WHITE}4. HOMELAB INFRA${RESET}    ${DARK_GRAY}[Proxmox VE · Docker Compose · WireGuard · Linux]${RESET}" 0.6
  stream_line "     Virtualización segmentada, nubes privadas y redes malladas seguras." 1.0
  echo ""

  stream_line "${BOLD}${YELLOW}--- [ OBSERVABILIDAD & ESTADO DE SALUD DEL NODO ] -------------------${RESET}" 0.8
  stream_line "  Desktop Memory Footprint : ${CYAN}[████░░░░░░░░░░░░░░░░]${RESET} 28.4 MB (Tauri 2 / Rust Core)" 0.6
  stream_line "  Pool Connection Health   : ${GREEN}[████████████████████]${RESET} 100% ACID Integrity (No Leaks)" 0.6
  stream_line "  Uptime de Disponibilidad : ${GREEN}[████████████████████]${RESET} 99.9% Production Ready" 0.6
  stream_line "  Canal de Comunicación    : ${WHITE}danvb.dev@gmail.com  ·  https://linkedin.com/in/Danvb15${RESET}" 1.0
  echo ""

  # Progress bar to next cycle
  echo -en "  ${DARK_GRAY}Sincronizando siguiente bloque de telemetría: ${RESET}"
  for i in {1..20}; do
    echo -en "${CYAN}█${RESET}"
    sleep 0.12
  done
  echo -e " ${GREEN}100% OK${RESET}\n"
  sleep 1.5

  CYCLE=$((CYCLE + 1))
done
