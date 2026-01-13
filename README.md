# 🎯 BanditBreaker

<div align="center">

```
 ▄▄▄▄    ▄▄▄       ███▄    █ ▓█████▄  ██▓▄▄▄█████▓ ▄▄▄▄    ██▀███  ▓█████ ▄▄▄       ██ ▄█▀▓█████  ██▀███  
▓█████▄ ▒████▄     ██ ▀█   █ ▒██▀ ██▌▓██▒▓  ██▒ ▓▒▓█████▄ ▓██ ▒ ██▒▓█   ▀▒████▄     ██▄█▒ ▓█   ▀ ▓██ ▒ ██▒
▒██▒ ▄██▒██  ▀█▄  ▓██  ▀█ ██▒░██   █▌▒██▒▒ ▓██░ ▒░▒██▒ ▄██▓██ ░▄█ ▒▒███  ▒██  ▀█▄  ▓███▄░ ▒███   ▓██ ░▄█ ▒
▒██░█▀  ░██▄▄▄▄██ ▓██▒  ▐▌██▒░▓█▄   ▌░██░░ ▓██▓ ░ ▒██░█▀  ▒██▀▀█▄  ▒▓█  ▄░██▄▄▄▄██ ▓██ █▄ ▒▓█  ▄ ▒██▀▀█▄  
░▓█  ▀█▓ ▓█   ▓██▒▒██░   ▓██░░▒████▓ ░██░  ▒██▒ ░ ░▓█  ▀█▓░██▓ ▒██▒░▒████▒▓█   ▓██▒▒██▒ █▄░▒████▒░██▓ ▒██▒
░▒▓███▀▒ ▒▒   ▓▒█░░ ▒░   ▒ ▒  ▒▒▓  ▒ ░▓    ▒ ░░   ░▒▓███▀▒░ ▒▓ ░▒▓░░░ ▒░ ░▒▒   ▓▒█░▒ ▒▒ ▓▒░░ ▒░ ░░ ▒▓ ░▒▓░
▒░▒   ░   ▒   ▒▒ ░░ ░░   ░ ▒░ ░ ▒  ▒  ▒ ░    ░    ▒░▒   ░   ░▒ ░ ▒░ ░ ░  ░ ▒   ▒▒ ░░ ░▒ ▒░ ░ ░  ░  ░▒ ░ ▒░
 ░    ░   ░   ▒      ░   ░ ░  ░ ░  ░  ▒ ░  ░       ░    ░   ░░   ░    ░    ░   ▒   ░ ░░ ░    ░     ░░   ░ 
 ░            ░  ░         ░    ░     ░            ░         ░        ░  ░     ░  ░░  ░      ░  ░   ░     
      ░                       ░                         ░                                                 
```

**Herramienta automatizada para resolver OverTheWire Bandit**

[![Version](https://img.shields.io/badge/version-0.7--Beta-purple)](https://github.com/Shadow0011/BanditBreaker)
[![License](https://img.shields.io/badge/license-MIT-cyan.svg)](LICENSE)
[![Bash](https://img.shields.io/badge/bash-5.0+-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/platform-Linux-blue.svg)](https://www.linux.org/)

[Características](#-características) • [Instalación](#-instalación) • [Uso](#-uso) • [Capturas](#-capturas) • [Contribuir](#-contribuir)

</div>

---

## 📋 Descripción

**BanditBreaker** es una herramienta interactiva en Bash diseñada para facilitar el aprendizaje y resolución de los retos [OverTheWire Bandit](https://overthewire.org/wargames/bandit/). Automatiza la gestión de contraseñas, conexiones SSH y proporciona writeups paso a paso para cada nivel.

Perfecto para:
- 🎓 Estudiantes aprendiendo seguridad informática
- 🔐 Practicantes de CTF
- 💻 Desarrolladores mejorando sus habilidades en Linux

---

## ✨ Características

### 🎨 Interfaz Moderna
- Interfaz TUI con colores cyberpunk (morado/cyan/verde neón)
- Navegación intuitiva entre niveles
- Marcos y diseño estilo "hacker terminal"

### 🔑 Gestión de Contraseñas
- Almacenamiento local de contraseñas para cada nivel
- Actualización manual de contraseñas
- Limpieza automática de códigos ANSI

### 🚀 Conexión Automática
- Conexión SSH automática con `sshpass`
- No necesitas recordar IPs, puertos ni contraseñas
- Retorno automático al menú al desconectar

### 📚 Writeups Integrados
- Guías paso a paso para resolver cada nivel
- Se abren con `less` para fácil navegación
- *[En desarrollo]* - Mejores Writeups proximamente...

### 📦 Instalación Automática
- Verifica e instala dependencias automáticamente
- Descarga información directamente de OverTheWire
- Configuración en un solo comando

---

## 🛠️ Instalación

### Requisitos Previos

- **Sistema Operativo**: Linux (Debian/Ubuntu/Kali recomendados)
- **Bash**: v5.0 o superior
- **Permisos**: `sudo` para instalar dependencias

### Dependencias

El script instalará automáticamente:
- `sshpass` - Para automatizar conexiones SSH
- `ssh` - Cliente SSH
- `fzf` - Buscador fuzzy (futuras funcionalidades)
- `curl` - Descargar información web
- `wget` - Descargas adicionales
- `pup` - Parser HTML

### Instalación Rápida

```bash
# Clonar el repositorio
git clone https://github.com/Shadow0011/BanditBreaker.git

# Entrar al directorio
cd BanditBreaker

# Dar permisos de ejecución
chmod +x banditbreaker.sh

# Ejecutar
./banditbreaker.sh
```

La primera vez que ejecutes el script:
1. ✅ Verificará e instalará dependencias faltantes
2. 📥 Descargará información de los 35 niveles de Bandit
3. 📝 Creará writeups locales
4. ⚡ ¡Listo para usar!

---

## 🎮 Uso

### Menú Principal

![Menú Principal](https://github.com/S0ulx3/BanditBreaker/blob/main/BanditBreaker-Menu.png)

### Comandos

| Tecla | Acción |
|-------|--------|
| `c` | Conectarse al nivel actual con SSH |
| `r` | Ver writeup/guía del nivel |
| `p` | Establecer/actualizar contraseña del nivel |
| `0-34` | Saltar directamente a ese nivel |
| `a` | Nivel anterior |
| `s` | Siguiente nivel |
| `e` | Salir del script |
| `Ctrl+C` | Salida de emergencia |

### Workflow Típico

1. **Primera vez en un nivel**:
   ```
   → Selecciona nivel → Opción 'r' (ver writeup) → Opción 'p' (guardar contraseña) → Opción 'c' (conectar)
   ```

2. **Niveles posteriores**:
   ```
   → Navega con 's' → Opción 'p' (guardar nueva contraseña) → Opción 'c' (conectar)
   ```

---

## 📸 Capturas

### Vista de Nivel

![f](https://github.com/S0ulx3/BanditBreaker/blob/main/BanditBreaker-Level.png)

---

## 📂 Estructura del Proyecto

```
BanditBreaker/
│
├── banditbreaker.sh          # Script principal
├── passwords.txt             # Contraseñas almacenadas (auto-generado)
├── Writeups/                 # Carpeta de writeups (auto-generada)
│   ├── bandit0.txt
│   ├── bandit1.txt
│   └── ...
├── README.md                 # Este archivo
└── LICENSE                   # Licencia MIT
```

---

## 🔐 Seguridad

⚠️ **Importante**: Este script almacena contraseñas en texto plano en `passwords.txt`.

- ✅ **Uso apropiado**: Entorno de aprendizaje personal
- ❌ **NO usar para**: Contraseñas reales o entornos de producción

---

## 🐛 Solución de Problemas

### El script no encuentra contraseñas

**Problema**: Código de colores ANSI interfiere con la lectura.

**Solución**: La función `connect_to_level` limpia automáticamente estos códigos.

### Error "Permission denied" en SSH

**Problema**: Contraseña incorrecta o vacía.

**Solución**:
1. Verifica que guardaste la contraseña con opción `p`
2. Comprueba que no tiene espacios extra
3. Conéctate manualmente para verificar:
   ```bash
   ssh bandit0@bandit.labs.overthewire.org -p 2220
   ```

### Dependencias no se instalan

**Problema**: No tienes permisos de `sudo`.

**Solución**: Instala manualmente:
```bash
sudo apt update
sudo apt install sshpass ssh fzf curl wget
pip3 install pup
```

---

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! 🎉

### Cómo Contribuir

1. Fork el proyecto
2. Crea tu rama (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add: nueva característica'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

### Ideas para Contribuir

- 📝 Completar writeups faltantes (niveles 13-34)
- 🎨 Mejorar la interfaz visual
- 🔧 Añadir más funcionalidades (historial, estadísticas, etc.)
- 🐛 Reportar bugs
- 📚 Mejorar documentación

---

## 📝 Roadmap

- [x] Completar todos los writeups (0-34)
- [ ] Estadísticas de progreso
- [ ] Exportar/importar contraseñas
- [ ] Integración con otros wargames de OverTheWire
- [ ] Tema de colores personalizable

---

## 👤 Autor

**Shadow0011**

- GitHub: [@Shadow0011](https://github.com/Shadow0011)
- Versión: 0.6

---

## 📜 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

---

## ⭐ Agradecimientos

- [OverTheWire](https://overthewire.org/) - Por crear estos excelentes retos
- [Alexandre CHERON](https://axcheron.github.io/writeups/otw/bandit/) - Por crear los Writeups
- Comunidad de seguridad informática
- Todos los que contribuyan al proyecto


---

## 💡 Disclaimer

Esta herramienta es **solo con fines educativos**. Está diseñada para ayudar en el aprendizaje de conceptos de seguridad a través de los retos legítimos de OverTheWire Bandit.

**No uses esta herramienta para**:
- Acceder sistemas sin autorización
- Compartir contraseñas de niveles públicamente
- Hacer trampa en retos de forma deshonesta

El aprendizaje viene de **entender** las soluciones, no solo de copiarlas.

---

<div align="center">

**¿Te gusta el proyecto? ¡Dale una ⭐ en GitHub!**

[⬆ Volver arriba](#-banditbreaker)

</div>
