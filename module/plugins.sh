# ~/.alchemy/modules/plugins.sh

function list_plugins() {
  gum style --border normal --margin "1" --padding "1" "🔌 Plugins instalados:"
  for plugin in "$ALCHEMY_HOME/plugins"/*.sh; do
    PLUGIN_NAME=$(basename "$plugin" .sh)
    echo -e " • $PLUGIN_NAME"
  done
}

function install_plugin() {
  PLUGIN_NAME="$1"
  PLUGIN_URL="https://raw.githubusercontent.com/tuusuario/alchemy-plugins/main/ $PLUGIN_NAME.sh"

  curl -fsSL "$PLUGIN_URL" -o "$ALCHEMY_HOME/plugins/$PLUGIN_NAME.sh"
  if [ $? -eq 0 ]; then
    gum style --foreground 46 "✔ Plugin '$PLUGIN_NAME' instalado."
  else
    gum style --foreground 196 "✘ Plugin no encontrado: $PLUGIN_NAME"
  fi
}

function uninstall_plugin() {
  PLUGIN_NAME="$1"
  PLUGIN_PATH="$ALCHEMY_HOME/plugins/$PLUGIN_NAME.sh"

  if [ -f "$PLUGIN_PATH" ]; then
    rm "$PLUGIN_PATH"
    gum style --foreground 46 "✔ Plugin '$PLUGIN_NAME' eliminado."
  else
    gum style --foreground 196 "✘ Plugin no existe: $PLUGIN_NAME"
  fi
}

function show_plugin_menu() {
  PLUGINS=("example" "history")
  SELECTED=$(printf '%s\n' "${PLUGINS[@]}" | gum choose)

  case "$SELECTED" in
    example)
      run_example_plugin
      ;;
    history)
      run_history_plugin
      ;;
  esac
}

function show_plugin_help() {
  PLUGIN_NAME="$2"

  if [ -z "$PLUGIN_NAME" ]; then
    gum style --foreground 3 "Uso: alchemy plugin help <nombre>"
    return
  fi

  PLUGIN_HELP_FUNC="help_$PLUGIN_NAME"

  if declare -f "$PLUGIN_HELP_FUNC" >/dev/null 2>&1; then
    eval "$PLUGIN_HELP_FUNC"
  else
    gum style --foreground 3 "No hay ayuda disponible para el plugin '$PLUGIN_NAME'"
  fi
}