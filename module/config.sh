# ~/.alchemy/modules/config.sh

CONFIG_FILE="$ALCHEMY_HOME/config/settings.json"

function get_config_value() {
  KEY="$1"
  if command -v jq >/dev/null; then
    jq -r ".$KEY" "$CONFIG_FILE"
  else
    source "$ALCHEMY_HOME/modules/colors.fallback.sh"
    echo -e "${ERROR}✘ Se requiere 'jq' para acceder a la configuración.${RESET}"
  fi
}

function set_config_value() {
  KEY="$1"
  VALUE="$2"

  if command -v jq >/dev/null; then
    TMP=$(mktemp)
    jq ".$KEY = \"$VALUE\"" "$CONFIG_FILE" > "$TMP" && mv "$TMP" "$CONFIG_FILE"
    gum style --foreground 46 "✔ '$KEY' cambiado a '$VALUE'."
  else
    echo -e "${ERROR}✘ Se requiere 'jq' para cambiar la configuración.${RESET}"
  fi
}

function reset_config() {
  DEFAULT_THEME="default"
  cp "$ALCHEMY_HOME/config/themes/$DEFAULT_THEME.json" "$CONFIG_FILE"
  gum style --foreground 46 "✔ Configuración reiniciada al tema por defecto."
}

function export_config() {
  OUTPUT="$ALCHEMY_HOME/config/export-$(date +%Y%m%d).json"
  cp "$CONFIG_FILE" "$OUTPUT"
  gum style --foreground 46 "✔ Configuración exportada a '$OUTPUT'."
}

function import_config() {
  FILE="$1"
  if [ -f "$FILE" ]; then
    cp "$FILE" "$CONFIG_FILE"
    gum style --foreground 46 "✔ Configuración importada desde '$FILE'."
    load_theme "$(get_config_value "theme")"
  else
    gum style --foreground 196 "✘ Archivo no encontrado: $FILE"
  fi
}