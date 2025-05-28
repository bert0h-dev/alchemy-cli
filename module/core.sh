# ~/.alchemy/modules/core.sh

function load_theme() {
  THEME_NAME="${1:-default}"
  THEME_FILE="$ALCHEMY_HOME/config/themes/$THEME_NAME.json"

  if [ ! -f "$THEME_FILE" ]; then
    echo "Tema no encontrado: $THEME_NAME"
    return 1
  fi

  # Guardar tema actual en settings.json
  if command -v jq >/dev/null; then
    jq --arg theme "$THEME_NAME" '.theme = $theme' "$THEME_FILE" > "$ALCHEMY_HOME/config/settings.json"
  else
    cp "$THEME_FILE" "$ALCHEMY_HOME/config/settings.json"
  fi

  # Recargar colores
  source "$ALCHEMY_HOME/modules/colors.sh"
}

function log_info() {
  echo -e "${INFO}[i] $1${RESET}"
}

function log_success() {
  echo -e "${SUCCESS}✔ $1${RESET}"
}

function log_error() {
  echo -e "${ERROR}✘ $1${RESET}"
}

function log_title() {
  echo -e "${BOLD}${PRIMARY}$1${RESET}"
}

function log_banner() {
  log_title "┌──────────────────────────────┐"
  log_title "│        🔮 ALCHEMY CLI        │"
  log_title "│     El arte de lo mágico     │"
  log_title "└──────────────────────────────┘"
}