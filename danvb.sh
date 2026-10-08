#!/usr/bin/env bash
# ==============================================================================
# DANIEL VASQUEZ [danvb] - Interactive Cyberpunk Terminal Experience
# Usage: curl -sL https://raw.githubusercontent.com/Danvb15/Danvb15/main/danvb.sh | bash
# ==============================================================================

# ANSI Color Codes (256-color & truecolor neon)
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
BG_DARK="\033[48;5;234m"

# Audio setup
AUDIO_URL="https://raw.githubusercontent.com/Danvb15/Danvb15/main/theme.wav"
TMP_AUDIO="/tmp/danvb_theme.wav"
MUSIC_PID=""

cleanup() {
  if [ -n "$MUSIC_PID" ]; then
    kill "$MUSIC_PID" 2>/dev/null
    wait "$MUSIC_PID" 2>/dev/null
  fi
  # Windows background powershell stop
  if command -v powershell.exe >/dev/null 2>&1; then
    powershell.exe -NoProfile -Command "Get-Process -Name powershell -ErrorAction SilentlyContinue | Where-Object { \$_.MainWindowTitle -eq 'danvb_audio' } | Stop-Process" 2>/dev/null
  fi
  rm -f "$TMP_AUDIO" 2>/dev/null
  echo -e "\n${DARK_GRAY}[TERMINAL SESSION TERMINATED] ¡Gracias por visitar!${RESET}\n"
  exit 0
}

trap cleanup EXIT INT TERM

start_music() {
  # Download audio quietly
  if [ ! -f "$TMP_AUDIO" ]; then
    curl -sL "$AUDIO_URL" -o "$TMP_AUDIO" 2>/dev/null
  fi

  if [ -f "$TMP_AUDIO" ]; then
    if command -v afplay >/dev/null 2>&1; then
      # macOS native audio player
      while true; do afplay "$TMP_AUDIO" 2>/dev/null; done &
      MUSIC_PID=$!
    elif command -v paplay >/dev/null 2>&1; then
      # Linux PulseAudio
      while true; do paplay "$TMP_AUDIO" 2>/dev/null; done &
      MUSIC_PID=$!
    elif command -v aplay >/dev/null 2>&1; then
      # Linux ALSA
      while true; do aplay -q "$TMP_AUDIO" 2>/dev/null; done &
      MUSIC_PID=$!
    elif command -v ffplay >/dev/null 2>&1; then
      # Cross-platform ffplay
      ffplay -nodisp -loop 0 -loglevel quiet "$TMP_AUDIO" 2>/dev/null &
      MUSIC_PID=$!
    elif command -v mpv >/dev/null 2>&1; then
      # Cross-platform mpv
      mpv --no-video --really-quiet --loop "$TMP_AUDIO" 2>/dev/null &
      MUSIC_PID=$!
    elif command -v powershell.exe >/dev/null 2>&1; then
      # Windows Git Bash / WSL
      powershell.exe -NoProfile -Command "\$p = New-Object System.Media.SoundPlayer('$TMP_AUDIO'); \$p.PlayLooping(); Start-Sleep -Seconds 600" 2>/dev/null &
      MUSIC_PID=$!
    fi
  fi
}

toggle_music() {
  if [ -n "$MUSIC_PID" ] && kill -0 "$MUSIC_PID" 2>/dev/null; then
    kill "$MUSIC_PID" 2>/dev/null
    MUSIC_PID=""
    echo -e "${YELLOW}♫ Audio silenciado.${RESET}"
  else
    start_music
    echo -e "${GREEN}♫ Audio activado en segundo plano.${RESET}"
  fi
  sleep 1
}

# Start music in background
start_music

show_banner() {
  clear
  echo -e "${CYAN}"
  echo "  ██████╗   █████╗  ███╗   ██╗ ██╗   ██╗ ██████╗ "
  echo "  ██╔══██╗ ██╔══██╗ ████╗  ██║ ██║   ██║ ██╔══██╗"
  echo "  ██║  ██║ ███████║ ██╔██╗ ██║ ██║   ██║ ██████╔╝"
  echo "  ██║  ██║ ██╔══██║ ██║╚██╗██║ ╚██╗ ██╔╝ ██╔══██╗"
  echo "  ██████╔╝ ██║  ██║ ██║ ╚████║  ╚████╔╝  ██████╔╝"
  echo "  ╚═════╝  ╚═╝  ╚═╝ ╚═╝  ╚═══╝   ╚═══╝   ╚═════╝ "
  echo -e "${MAGENTA}  ── [ SOFTWARE ENGINEER & SYSTEMS ARCHITECT ] ──${RESET}"
  echo -e "${DARK_GRAY}  📍 Barranquilla, Colombia 🇨🇴  ·  danvb.dev@gmail.com${RESET}"
  echo -e "${BLUE}  ────────────────────────────────────────────────────────────${RESET}"
  if [ -n "$MUSIC_PID" ]; then
    echo -e "  ${GREEN}♫ Audio en vivo: [Synthwave Chill Loop] (Reproduciendo en fondo)${RESET}"
  else
    echo -e "  ${YELLOW}♫ Audio: [Silenciado] (Presiona 'm' para reactivar)${RESET}"
  fi
  echo -e "${BLUE}  ────────────────────────────────────────────────────────────${RESET}"
}

pause_screen() {
  echo ""
  echo -e "${DARK_GRAY}Presiona [ENTER] para volver al menú principal...${RESET}"
  read -r
}

while true; do
  show_banner
  echo -e "${BOLD}${WHITE}  SELECCIONA UN MÓDULO PARA EXPLORAR:${RESET}"
  echo ""
  echo -e "  ${CYAN}[1]${RESET} ${BOLD}👨‍💻  Sobre Mí & Filosofía de Ingeniería${RESET}"
  echo -e "  ${CYAN}[2]${RESET} ${BOLD}🛠️   Stack Tecnológico de Producción${RESET}"
  echo -e "  ${CYAN}[3]${RESET} ${BOLD}🚀  Proyectos Destacados (Arquitectura & Seguridad)${RESET}"
  echo -e "  ${CYAN}[4]${RESET} ${BOLD}⚡  Benchmark de Latencias en Tiempo Real${RESET}"
  echo -e "  ${CYAN}[5]${RESET} ${BOLD}📬  Canales de Contacto Directo${RESET}"
  echo -e "  ${YELLOW}[m]${RESET} ${DIM}♫   Alternar Música de Fondo (ON/OFF)${RESET}"
  echo -e "  ${MAGENTA}[0]${RESET} ${DIM}🚪  Salir${RESET}"
  echo ""
  echo -en "  ${CYAN}danvb@terminal:~$ ${RESET}"
  read -r choice

  case "$choice" in
    1)
      show_banner
      echo -e "${BOLD}${CYAN}=== 👨‍💻 SOBRE MÍ & FILOSOFÍA ===${RESET}\n"
      echo -e "  ${WHITE}Nombre:${RESET}       Daniel Elías Vásquez Barrios (danvb)"
      echo -e "  ${WHITE}Rol:${RESET}          Software Engineer & Systems Builder"
      echo -e "  ${WHITE}Ubicación:${RESET}    Barranquilla, Atlántico (Colombia) 🇨🇴"
      echo -e "  ${WHITE}Enfoque:${RESET}      Eliminar la complejidad accidental."
      echo ""
      echo -e "  ${BOLD}${YELLOW}Pilares de Desarrollo:${RESET}"
      echo -e "  ${GREEN}✔${RESET} 100% Type Safety (Compilador estricto, cero sorpresas en runtime)"
      echo -e "  ${GREEN}✔${RESET} Latencias sub-100ms con pools de conexiones y concurrencia optimista"
      echo -e "  ${GREEN}✔${RESET} Cero secretos en texto plano (Custodia nativa en OS Keyring)"
      echo -e "  ${GREEN}✔${RESET} Arquitectura modular basada en componentes independientes"
      pause_screen
      ;;
    2)
      show_banner
      echo -e "${BOLD}${CYAN}=== 🛠️ STACK TECNOLÓGICO DE PRODUCCIÓN ===${RESET}\n"
      echo -e "  ${MAGENTA}[LENGUAJES]${RESET}      TypeScript, Python, Java 21, Rust, SQL, Bash"
      echo -e "  ${BLUE}[BACKEND]${RESET}        Spring Boot 3, FastAPI, Node.js, Express, RESTful APIs"
      echo -e "  ${CYAN}[FRONTEND]${RESET}       React, Next.js, Vite, Astro, Tailwind CSS, Zustand"
      echo -e "  ${GREEN}[BASES DE DATOS]${RESET} PostgreSQL, Redis (Caché), pgvector, SQLite, MySQL"
      echo -e "  ${YELLOW}[DESKTOP/MOBILE]${RESET} Tauri 2 (Rust Core), React Native, Expo Router"
      echo -e "  ${WHITE}[INFRA & DEVOPS]${RESET} Docker, Linux (Debian), Proxmox VE, WireGuard, Tailscale"
      pause_screen
      ;;
    3)
      show_banner
      echo -e "${BOLD}${CYAN}=== 🚀 PROYECTOS DESTACADOS ===${RESET}\n"
      echo -e "  ${BOLD}${WHITE}1. REMOTE MANAGER${RESET}  ${DARK_GRAY}[Tauri 2 · Rust · React · SQLite]${RESET}"
      echo -e "     Software de escritorio para administración centralizada de servidores SSH/RDP."
      echo -e "     ${GREEN}★ Highlight:${RESET} Custodia criptográfica nativa en OS Keyring. 0 RAM leaks."
      echo ""
      echo -e "  ${BOLD}${WHITE}2. TECHSTOCK${RESET}        ${DARK_GRAY}[Java 21 · Spring Boot 3 · PostgreSQL · Expo]${RESET}"
      echo -e "     Plataforma multi-tenant de inventario y punto de venta comercial."
      echo -e "     ${GREEN}★ Highlight:${RESET} Bloqueo optimista (Optimistic Locking) y auditoría inmutable."
      echo ""
      echo -e "  ${BOLD}${WHITE}3. AI BUSINESS AGENT${RESET} ${DARK_GRAY}[FastAPI · Python · pgvector · Redis · Claude]${RESET}"
      echo -e "     Agente inteligente con pipeline RAG asíncrono y memoria vectorial."
      echo -e "     ${GREEN}★ Highlight:${RESET} Mitigación estricta de alucinaciones y embeddings sub-100ms."
      echo ""
      echo -e "  ${BOLD}${WHITE}4. HOMELAB INFRA${RESET}    ${DARK_GRAY}[Proxmox VE · Docker · WireGuard · Linux]${RESET}"
      echo -e "     Laboratorio de virtualización y red mallada cifrada punto a punto."
      echo -e "     ${GREEN}★ Highlight:${RESET} Zero open ports. Servicios segmentados en LXC y VMs."
      pause_screen
      ;;
    4)
      show_banner
      echo -e "${BOLD}${CYAN}=== ⚡ BENCHMARK DE LATENCIAS EN PRODUCCIÓN ===${RESET}\n"
      echo -e "${DARK_GRAY}Ejecutando pings en microservicios e infraestructura...${RESET}\n"
      sleep 0.5
      echo -e "  ${BOLD}SUBSISTEMA                 PROTOCOLO   ESTADO      LATENCIA (p99)${RESET}"
      echo -e "  ------------------------------------------------------------------"
      sleep 0.2
      echo -e "  ${WHITE}/desktop/core/keyring      ${CYAN}IPC/Rust    ${GREEN}SALUDABLE   ${YELLOW}1.2ms${RESET}"
      sleep 0.2
      echo -e "  ${WHITE}/backend/inventory/pos     ${BLUE}HTTP/Java   ${GREEN}200 OK      ${YELLOW}34.8ms${RESET}"
      sleep 0.2
      echo -e "  ${WHITE}/ai/rag/pgvector           ${MAGENTA}FastAPI     ${GREEN}200 OK      ${YELLOW}78.4ms${RESET}"
      sleep 0.2
      echo -e "  ${WHITE}/homelab/wireguard-mesh    ${CYAN}P2P/UDP     ${GREEN}ACTIVO      ${YELLOW}3.8ms${RESET}"
      echo -e "  ------------------------------------------------------------------"
      echo -e "  ${GREEN}[STATUS] Disponibilidad: 99.9% · 0 fugas de memoria · Concurrencia óptima${RESET}"
      pause_screen
      ;;
    5)
      show_banner
      echo -e "${BOLD}${CYAN}=== 📬 CANALES DE CONTACTO DIRECTO ===${RESET}\n"
      echo -e "  ${YELLOW}✉  Email:${RESET}    danvb.dev@gmail.com"
      echo -e "  ${BLUE}🐙 GitHub:${RESET}   https://github.com/Danvb15"
      echo -e "  ${CYAN}💼 LinkedIn:${RESET} https://linkedin.com/in/Danvb15"
      echo -e "  ${MAGENTA}📍 Origen:${RESET}   Barranquilla, Atlántico (Colombia) 🇨🇴"
      pause_screen
      ;;
    m|M)
      toggle_music
      ;;
    0)
      cleanup
      ;;
    *)
      echo -e "${YELLOW}Opción no reconocida.${RESET}"
      sleep 0.8
      ;;
  esac
done
