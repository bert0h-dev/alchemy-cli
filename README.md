# 🔮 Alchemy CLI – El Arte de lo Mágico en tu Terminal

Un **framework CLI modular personalizado**, hecho para transformar tu productividad diaria en algo mágico.  
Diseñado para funcionar tanto en **Bash** como en **Zsh**, ideal para automatizar tareas, manejar múltiples repositorios, y crear flujos de trabajo únicos.

## ✨ Características principales

- Modular y fácil de expandir
- Alias inteligentes para Git, Python, Node.js, etc.
- Menú interactivo con colores
- Comandos rápidos y amigables
- UI visual en terminal

## 🛠️ Módulos actuales

| Módulo | Función |
|-------|--------|
| `git`   | Alias y funciones de Git |
| `python` | Herramientas de desarrollo en Python |
| `node`  | Scripts de Node.js/NPM |
| `utils` | Comandos útiles generales |
| `menu`  | Menú interativo para navegar por Alchemy |

## 📦 Instalación

Solo asegúrate de tener este directorio en `~/.alchemy`, y agrega esto a tu `.zshrc` o `.bashrc`:

```bash
export ALCHEMY_HOME="$HOME/.alchemy"
source "$ALCHEMY_HOME/init.sh"
```

## 🧙‍♂️ Bonus: función `transmute` (ejemplo simbólico)

```bash
# ~/.alchemy/modules/utils.sh

function transmute() {
  echo -e "${PURPLE}⚛ Transformando...${NC}"
  sleep 1
  echo -e "${GREEN}✔ Listo. Oro listo para usar.${NC}"
}
```

## Creado por Bert0h