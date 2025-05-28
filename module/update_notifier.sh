# ~/.alchemy/modules/update_notifier.sh

check_for_update() {
  CURRENT_VERSION=$(jq -r '.version' "$ALCHEMY_HOME/config/version.json")
  REMOTE_VERSION_FILE="https://github.com/tuusuario/alchemy-cli/raw/main/LATEST_VERSION "
  REMOTE_VERSION=$(curl -fsSL "$REMOTE_VERSION_FILE")

  if [ $? -ne 0 ]; then
    return
  fi

  # Comparar versiones (solo números)
  if [[ "$(printf '%s\n' "$CURRENT_VERSION" "$REMOTE_VERSION" | sort -V | head -n1)" != "$REMOTE_VERSION" ]]; then
    gum style \
      --border normal \
      --margin "1" \
      --padding "1" \
      --align center \
      --width 40 \
      --foreground 33 \
      "🔮 Nueva versión disponible!" \
      "Versión actual: $CURRENT_VERSION" \
      "Nueva versión: $REMOTE_VERSION" \
      "" \
      "Ejecuta:" \
      "alchemy update"
  fi
}