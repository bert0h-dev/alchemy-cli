# ~/.alchemy/plugins/history.sh

HISTORY_FILE="$ALCHEMY_HOME/.history.log"

function run_history_plugin() {
  if [ ! -f "$HISTORY_FILE" ]; then
    gum style --foreground 3 "No hay historial aún."
    return
  fi

  gum style --border normal --margin "1" --padding "1" "📜 Historial de comandos:"
  cat "$HISTORY_FILE" | gum pager
}

function clear_history() {
  > "$HISTORY_FILE"
  gum style --foreground 46 "✔ Historial borrado."
}

function help_history() {
  gum style --border normal --margin "1" --padding "1" "📘 Ayuda del plugin 'history'"
  echo -e "Este plugin muestra los comandos ejecutados anteriormente."
  echo -e ""
  echo -e "Uso:"
  echo -e "  history       ➤ Mostrar historial"
  echo -e "  clear-history ➤ Borrar historial"
}