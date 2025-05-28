# ~/.alchemy/plugins/example.sh

function run_example_plugin() {
  gum style --border normal --margin "1" --padding "1" "Plugin de ejemplo activado"
  NAME=$(gum input --placeholder "¿Cómo te llamas?")
  gum style --bold "Hola, $NAME. ¡Bienvenido a Alchemy!"
}

function help_example() {
  gum style --border normal --margin "1" --padding "1" "📘 Ayuda del plugin 'example'"
  echo -e "Este plugin saluda al usuario e imprime un mensaje de bienvenida."
  echo -e ""
  echo -e "Uso:"
  echo -e "  example     ➤ Ejecutar plugin"
}