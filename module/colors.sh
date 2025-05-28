# ~/.alchemy/modules/colors.sh

# Cargar configuración
ALCHEMY_HOME="${ALCHEMY_HOME:=$HOME/.alchemy}"
CONFIG_FILE="$ALCHEMY_HOME/config/settings.json"

# Verificar que exista jq (instalado?)
if command -v jq >/dev/null 2>&1; then
  # Cargar colores con jq
  export PRIMARY=$(jq -r '.colors.primary' "$CONFIG_FILE")
  export SECONDARY=$(jq -r '.colors.secondary' "$CONFIG_FILE")
  export SUCCESS=$(jq -r '.colors.success' "$CONFIG_FILE")
  export ERROR=$(jq -r '.colors.error' "$CONFIG_FILE")
  export INFO=$(jq -r '.colors.info' "$CONFIG_FILE")
  export RESET=$(jq -r '.colors.reset' "$CONFIG_FILE")
  export BOLD=$(jq -r '.style.bold' "$CONFIG_FILE")
  export UNDERLINE=$(jq -r '.style.underline' "$CONFIG_FILE")
else
  # Fallback sin jq
  source "$ALCHEMY_HOME/modules/colors.fallback.sh"
fi

# Banner ASCII opcional
function alchemy_ascii() {
  echo -e "${PURPLE}"
  echo "   ▄▄▄▄    ██▀███   ██▓ ███▄    █ ▓█████ "
  echo "  ▓█████▄ ▓██ ▒ ██▒▓██▒ ██ ▀█   █ ▓█   ▀ "
  echo "  ▒██▒ ▄██▓██ ░▄█ ▒▒██▒▓██  ▀█ ██▒▒███   "
  echo "  ▒██░█▀  ▒██▀▀█▄  ░██░▓██▒  ▐▌██▒▒▓█  ▄ "
  echo "  ░▓█  ▀█▓░██▓ ▒██▒░██░▒██░   ▓██░░▒████▒"
  echo "  ░▒▓███▀▒░ ▒▓ ░▒▓░░▓  ░ ▒░   ▒ ▒ ░░ ▒░ ░"
  echo -e "${NC}"
}