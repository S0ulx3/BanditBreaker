#!/bin/bash

## BanditBreaker ## By Shadow0011 ## V0.7.4-beta


# Funcion ctrl+c
function ctrl_c(){

clear; tput civis
echo -e "\n\n${red}┏━━─────━━══[ ${pur}BanditBreaker${red} ]══━━─────━━┓"
echo -e "┃       ¡Saliendo del script...!        ┃"
echo -e "┗━━═══════════════════════════════════━━┛${end}\n"; tput cnorm; exit 0

}

# Trap de SIGINT
trap ctrl_c INT



# Variables globales #
PSWD_FILE='./passwords.txt'
WTPS_DIR='./Writeups'
init_level=0 # Nivel de preview por defecto


# Colores ( De momento sin uso )
#red='\e[31m'
#gre='\e[32m'
yel_caja='\e[33m'
#blu='\e[34m'
pur_caja='\e[35m'
#cia='\e[36m'
end='\e[0m'


# Paleta híbrida optimizada
pur='\e[38;5;135m'   # Morado vibrante (títulos, marcos)
cia='\e[38;5;51m'    # Cyan neón (info importante)
gre='\e[38;5;46m'    # Verde Matrix (éxito, confirmaciones)
yel='\e[38;5;226m'   # Amarillo brillante (advertencias)
red='\e[38;5;196m'   # Rojo intenso (errores)
blu='\e[38;5;39m'    # Azul neón (secundario)


# Función que muestra el logo del script
function logo(){

tput civis
echo -e "\n${pur}"
echo -e " ▄▄▄▄    ▄▄▄       ███▄    █ ▓█████▄  ██▓▄▄▄█████▓ ▄▄▄▄    ██▀███  ▓█████ ▄▄▄       ██ ▄█▀▓█████  ██▀███  ";
echo -e "▓█████▄ ▒████▄     ██ ▀█   █ ▒██▀ ██▌▓██▒▓  ██▒ ▓▒▓█████▄ ▓██ ▒ ██▒▓█   ▀▒████▄     ██▄█▒ ▓█   ▀ ▓██ ▒ ██▒";
echo -e "▒██▒ ▄██▒██  ▀█▄  ▓██  ▀█ ██▒░██   █▌▒██▒▒ ▓██░ ▒░▒██▒ ▄██▓██ ░▄█ ▒▒███  ▒██  ▀█▄  ▓███▄░ ▒███   ▓██ ░▄█ ▒";
echo -e "▒██░█▀  ░██▄▄▄▄██ ▓██▒  ▐▌██▒░▓█▄   ▌░██░░ ▓██▓ ░ ▒██░█▀  ▒██▀▀█▄  ▒▓█  ▄░██▄▄▄▄██ ▓██ █▄ ▒▓█  ▄ ▒██▀▀█▄  ";
echo -e "░▓█  ▀█▓ ▓█   ▓██▒▒██░   ▓██░░▒████▓ ░██░  ▒██▒ ░ ░▓█  ▀█▓░██▓ ▒██▒░▒████▒▓█   ▓██▒▒██▒ █▄░▒████▒░██▓ ▒██▒";
echo -e "░▒▓███▀▒ ▒▒   ▓▒█░░ ▒░   ▒ ▒  ▒▒▓  ▒ ░▓    ▒ ░░   ░▒▓███▀▒░ ▒▓ ░▒▓░░░ ▒░ ░▒▒   ▓▒█░▒ ▒▒ ▓▒░░ ▒░ ░░ ▒▓ ░▒▓░";
echo -e "▒░▒   ░   ▒   ▒▒ ░░ ░░   ░ ▒░ ░ ▒  ▒  ▒ ░    ░    ▒░▒   ░   ░▒ ░ ▒░ ░ ░  ░ ▒   ▒▒ ░░ ░▒ ▒░ ░ ░  ░  ░▒ ░ ▒░";
echo -e " ░    ░   ░   ▒      ░   ░ ░  ░ ░  ░  ▒ ░  ░       ░    ░   ░░   ░    ░    ░   ▒   ░ ░░ ░    ░     ░░   ░ ";
echo -e " ░            ░  ░         ░    ░     ░            ░         ░        ░  ░     ░  ░░  ░      ░  ░   ░     ";
echo -e "      ░                       ░                         ░                                                 ";
echo -e "\n${end}"; sleep 1.5; tput cnorm

}



# Funcion que se encarga de instalar los programas necesarios
function verify(){

    # Programas necesarios
    for requirements in sshpass ssh fzf curl wget pup; do

        if $(! which $requirements &>/dev/null)
        then

            # Instalación automática de PUP
            if [ $requirements == "pup" ]; then
            pip3 install python3-pipx || pip3 install pipx --break-system-packages; pipx install pup
            fi

            # Instalación de los demás comandos
            echo -e "\t${pur}┏━━━━━━══[${cia} BanditBreaker ${pur}]══━━─────────────────━━┓\n"
            echo -e "\t${red}    [!] ${cia}Comando ${red}$requirements ${cia}no instalado. ${red}[!]  \n"
            echo -e "\t${yel}    [!] ${cia}Instalando comando ${red}$requirements${cia} ... [!]\n"
            echo -e "\t${pur}┗━━════════════════════════════════════════════━━┛${end}"
            sleep 1.2; tput cnorm
            sudo apt install "$requirements"

        else
            :
        fi

    done


    # Verifica y crea la carpeta de writeups junto a los writeups
    if [ ! -d "$WTPS_DIR" ]; then

    mkdir "$WTPS_DIR"

	clear; tput civis
    echo -e "${pur}┏━━══[${cia} BanditBreaker ${pur}]══━━────────────────────────────────━━┓"
    echo -e "${pur}┃   ${red}[!] ${cia}Se van a crear los Writeups de los niveles...      ${pur} ┃"
    echo -e "${pur}┃   ${yel}[!] ${cia}Creando carpeta con los writeups...  ${yel}(./Writeups)  ${pur} ┃"
    echo -e "${pur}┗━━═══════════════════════════════════════════════════════━━┛${end}"
    echo -e "${pur}    ╰─>${cia} Extrayendo desde: ${yel}https://axcheron.github.io/writeups/otw/bandit/${end}\n"

	make_writeups 		# Crear writeups

	clear
    echo -e "\n${pur}┏━━══[${cia} BanditBreaker ${pur}]══━━────────────────────────━━┓"
    echo -e "┃   ${gre}[!] ${cia}Archivo de Writeups correctamente creado.${pur}   ┃"
    echo -e "┗━━═══════════════════════════════════════════════━━┛${end}\n"; sleep 3; tput cnorm;

    fi



    # Archivo de contraseñas

    if [ ! -f "$PSWD_FILE" ]; then

    clear; tput civis
    echo -e "${pur}┏━━══[${cia} BanditBreaker ${pur}]══━━────────────────────────────────━━┓"
    echo -e "${pur}┃   ${red}[!] ${cia}No se encontró el archivo de niveles, creando...${pur}    ┃"
    echo -e "${pur}┃   ${red}[!] ${cia}Puede tardar un poco, dependiendo de tu conexión.${pur}   ┃"
    echo -e "${pur}┃   ${yel}[!] ${cia}Se introduciran los datos en: ${red}./passwords.txt${pur}       ┃"
    echo -e "${pur}┗━━═══════════════════════════════════════════════════════━━┛${end}"
	echo -e "${pur}    ╰─>${cia} Extrayendo desde: ${yel}https://overthewire.org/wargames/bandit/${end}\n"

    for levels in {1..33}; do

        make_files "$levels"    # Crear automaticamente las fichas de los niveles

    done

	# Poner la contraseña del nivel 0 automáticamente. Es con la que se empieza
	sed -i "/IN-0=/,/IN-0==/ { /Contraseña de acceso.*:/ s|: .*|: bandit0| }" "$PSWD_FILE"

    clear
    echo -e "\n${pur}┏━━══[${cia} BanditBreaker ${pur}]══━━───────────────────────────━━┓"
    echo -e "┃   ${gre}[!] ${cia}Archivo de contraseñas correctamente creado.${pur}   ┃"
    echo -e "┗━━══════════════════════════════════════════════════━━┛${end}\n"; sleep 3; tput cnorm;

    fi

levels

}


# Función para crear los writeups -- ( Segunda versión automática - medio provisional -)
function make_writeups(){

# Variables locales
local LEVEL
local content

	# Bucle que crea los archivos
    for LEVEL in {0..32}; do

# Variable que establece el nombre del archivo según la vuelta
WTPS_FILE="$WTPS_DIR/bandit$LEVEL.txt"
NEXT_LEVEL=$(printf "%02d" $((LEVEL + 1)) | xargs)

    sleep 0.25 # Mini Delay para que no se sobrecargue de peticiones la página


case $LEVEL in			# Realizar scrapeo especifico  según el nivel

[0-9])			# Accion especifica para niveles menores de 10
content="$(curl -s "https://axcheron.github.io/writeups/otw/bandit/" | grep -A10000 "id=\"bandit-0$LEVEL-solution" | grep -B10000 "id=\"bandit-$NEXT_LEVEL-solution" | sed 's/<[^>]*>//g' | grep -v "Bandit $NEXT_LEVEL Solution" | grep -v "Bandit 0$LEVEL Solution")"
echo "$content" > $WTPS_FILE
;;
16)
	content="$(curl -s "https://axcheron.github.io/writeups/otw/bandit/" | grep -A10000 "id=\"bandit-$LEVEL-solution" | grep -B10000 "id=\"bandit-$NEXT_LEVEL-solution" | sed 's/<[^>]*>//g' | grep -v "Bandit $NEXT_LEVEL Solution" | grep -v "Bandit $LEVEL Solution" | sed 's|&gt;|>|g' | sed "s|&amp;|\&|g")"
	echo "$content" > $WTPS_FILE
;;
18)
content="$(curl -s "https://axcheron.github.io/writeups/otw/bandit/" | grep -A10000 "id=\"bandit-$LEVEL-solution" | grep -B10000 "id=\"bandit-$NEXT_LEVEL-solution" | sed 's/<[^>]*>//g' | grep -v "Bandit $NEXT_LEVEL Solution" | grep -v "Bandit $LEVEL Solution" | sed 's|&lt|<|g' | sed 's|&gt|>|g')"
echo "$content" > $WTPS_FILE
;;
24)
cat << 'EOF' > $WTPS_FILE
================================================================================
   BANDIT LEVEL 24 -> 25 | BRUTEFORCING PIN SERVICE (Port 30002)
================================================================================

[ DESCRIPTION ]
The goal is to retrieve the password for Level 25. A service is listening
on port 30002 and will give the password if provided with:
<Current Password> <4-digit PIN>

Since there are 10,000 possible PINs (0000-9999), we must automate the
delivery using a Bash loop and Netcat.

[ INTEL ]
- Current User: bandit24
- Current Pass: VAf7RxSNCZ94FuyvS9S7S66FbaAsIjlT
- Target Port:  30002 (localhost)

--------------------------------------------------------------------------------
[ STEP 1: Setup Workspace ]
--------------------------------------------------------------------------------
# Create a temporary directory since /home is read-only
mkdir -p /tmp/brute_24 && cd /tmp/brute_24

--------------------------------------------------------------------------------
[ STEP 2: The Attack (Command Sequence) ]
--------------------------------------------------------------------------------
# 1. Store the password in a variable for cleaner code
PASS="VAf7RxSNCZ94FuyvS9S7S66FbaAsIjlT"

# 2. Generate the wordlist and pipe it to the service
# {0000..9999} handles the leading zeros automatically
for pin in {0000..9999}; do
    echo "$PASS $pin"
done | nc localhost 30002 > raw_output.txt

--------------------------------------------------------------------------------
[ STEP 3: Extracting the Flag ]
--------------------------------------------------------------------------------
# The 'raw_output.txt' contains thousands of "Wrong!" messages.
# We filter them out to find the successful attempt.

grep -v "Wrong" raw_output.txt

--------------------------------------------------------------------------------
[ EXPECTED OUTPUT ]
--------------------------------------------------------------------------------
# You should see a response like this:
# "Correct! The password for user bandit25 is: p7I5W6Sss2uS6ST6pAd693vEun9Q36L0"

--------------------------------------------------------------------------------
[ CLEANUP ]
--------------------------------------------------------------------------------
# Always remove your traces in /tmp
cd .. && rm -rf /tmp/brute_24
================================================================================


EOF
;;
25)
content="$(curl -s "https://axcheron.github.io/writeups/otw/bandit/" | grep -A10000 "id=\"bandit-$LEVEL--$NEXT_LEVEL-solution" | grep -B 10000 "33C" | sed 's/<[^>]*>//g' | grep -v "Bandit $LEVEL &am")"
echo "$content" > $WTPS_FILE
;;
26)
content="$(curl -s "https://axcheron.github.io/writeups/otw/bandit/" | grep -A10000 "id=\"bandit-25--26-solution" | grep -A 10000 "Now, as we already have a shell using" | grep -B 10000 " command will give us the password." | sed 's/<[^>]*>//g')"
echo "$content" > $WTPS_FILE
;;
32)
content="$(curl -s "https://axcheron.github.io/writeups/otw/bandit/" | grep -A1000 "id=\"bandit-$LEVEL-solution" | grep -B1000 "id=\"bandit-$NEXT_LEVEL-solution" | sed 's/<[^>]*>//g' | grep -v "Bandit $NEXT_LEVEL Solution" | grep -v "Bandit $LEVEL Solution" | sed 's|&gt;&gt;|>>|g')"
echo "$content" > $WTPS_FILE
;;
*)				# Acción que se realiza para todos los numeros mayores de 10 sin contar las excepciones antes tratadas.
content="$(curl -s "https://axcheron.github.io/writeups/otw/bandit/" | grep -A10000 "id=\"bandit-$LEVEL-solution" | grep -B10000 "id=\"bandit-$NEXT_LEVEL-solution" | sed 's/<[^>]*>//g' | grep -v "Bandit $NEXT_LEVEL Solution" | grep -v "Bandit $LEVEL Solution" | sed "s|&amp;|\&|g" | sed 's|&gt;|>|g')"
echo "$content" > $WTPS_FILE
;;
esac
done
}


# Función para conectarse a los niveles automáticamente
function connect_to_level(){

# VARIABLES
local LEVEL="$1"
local IP="bandit$LEVEL@bandit.labs.overthewire.org"
local PORT="2220"
ACCESS_PASS="$(cat "$PSWD_FILE" 2>/dev/null | grep --color=never -A4 "IN-$LEVEL=" | grep "Contraseña" | cut -d ':' -f2- | xargs)"
PASS_CLEAN=$(echo -e "$ACCESS_PASS" | sed 's/\x1b\[[0-9;]*[mGJK]//g' | xargs)	# Limpiamos la contraseña de colores

# Conectarse al nivel seleccionado
sshpass -p "$PASS_CLEAN" ssh "$IP" -p "$PORT"

# Mensaje que se muestra al volver a la sesión actual
clear; tput civis

echo -e "\n\n${pur}┏━━──────────━━══[ ${cia}BanditBreaker${pur} ]══━━─────────━━┓"
echo -e "┃  ${red}[!] ${cia}Sesión SSH finalizada. Volviendo al Menú  ${pur}┃"
echo -e "┗━━════════════════════════════════════════════━━┛${end}\n"
sleep 1.5; tput cnorm; return


}

# Función para leer los writeups
function learn_this_level(){

local LEVEL="$1"
WTPS_FILE="$WTPS_DIR/bandit$LEVEL.txt"

(cat "$WTPS_FILE"; echo -e "\n${pur}---------------------------------${end}\n ${cia}[ Pulsa ${yel}q${cia} para volver al menú ]${end}") | less -R			# Sirve para ver los writeups y mostrar un texto con información para volver al menú

}


# Funcion para crear automáticamente las fichas de cada nivel
make_files(){

# Variable que recoge el nivel indicado y el siguiente nivel
local LEVEL="$1"
#local NEXT_LEVEL=$((LEVEL + 1))
local PREV_LEVEL=$((LEVEL - 1))

# Variables que guardan la descripción, notas, comandos...
desc_preview="$(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "Level Goal" | grep -v "Level Goal" | grep -B 10000 'Help!?' | grep -B 10000 "Commands" | grep -Ev 'Help!?|Donate!|Level Goal| you may need|ls,|ssh into bandit|NOTE|intended solution|instead.|shell-script|level!|NOTE 2|NOTE|Keep in mind|executed,|CONNECTED|Keep in mind|If you are having|try executing|very useful skill.|this is related|works as you think')"
desc_preview2="$(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | pup "p" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -Ev 'Helpful note|manpage|s_client|using|SSL/TLS|grep|cp,|ls,|. ssh| TIP| machine!|NOTE|NOTE 2| challenging|occasionally|yourself,|Passwords for|saved automatically|Tip|CONNECTED COMMANDS|Keep in mind' | xargs)"
commands="$(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "Commands" | grep -B 10000 'Donate!' | head -n -4 | grep -v "Commands" | grep -Ev "bandit0|Passwords|challenging|:|Helpful|Google|Chapter|Secure|FOSS|wikiHow|YouTube|accurate|Addresses|Wikipedia|Ports|OpenSSL|Piping and Redirection" | sed 's/&amp;//g' | xargs)"
helpful_material="$(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "Helpful Reading" | grep -B 10000 'Donate!' | head -n -4 | grep -v "Helpful")"
helpful_note="$(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "Helpful note" | grep -B 10000 "Commands you" | grep -v "Commands you")" # Para el nivel 15-16
note="$(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "NOTE" | grep -B 10000 'Commands' | grep -v "Commands you may need")" # Nivel 20-21 y nivel 22-23
TIP="$(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "TIP" | grep -B 10000 'Donate!' | grep -v 'Donate!' | head -n -3)"

local IP="bandit$PREV_LEVEL@bandit.labs.overthewire.org"
local PORT="2220"



# INICIO DE LA FICHA | NIVEL IP Y PUERTO + DESCRIPCIÓN
echo -e "${pur}[==IN-$PREV_LEVEL=======================================================================]" >> "$PSWD_FILE"
echo -e "${pur}┏━━══(${cia}Bandit Breaker${pur})═══════════════════════════════════════════════════━━━━━━┓${end}" >> "$PSWD_FILE"
echo -e "${pur}  Nivel ${cia}$PREV_LEVEL ${pur}-> ${cia}$LEVEL ${pur}| IP ${pur}: ${cia}$IP ${pur}|  Puerto ${pur}: ${cia}$PORT ${end}" >> "$PSWD_FILE"
echo -e "${pur}┣━━━━━━━═══════════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"
echo -e "${pur}┃  ─  ${cia}Contraseña de acceso ${pur}: ${red}[No encontrada]${end}" >> "$PSWD_FILE" >> "$PSWD_FILE"
echo -e "${pur}┣━━━━━━━═══════════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"
echo -e "${pur}┃    ─              ${blu}Descripción del nivel ${pur}── ${blu}Level Goal                  ${pur}─    ┃${end}" >> "$PSWD_FILE"
echo -e "${pur}┣━━━━━━━═══════════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"

	# Mostrar descripción dependendiendo del nivel
	if [[ $LEVEL -eq 20 || $LEVEL -eq 25 || $LEVEL -eq 32 ]]; then
		echo -e "${cia}$desc_preview2 ${end}" | fmt -w 78 -s | pr -to 3 >> "$PSWD_FILE"
	else
		echo -e "${cia}$desc_preview ${end}" | fmt -w 78 -s | pr -to 3 >> "$PSWD_FILE"
	fi


# COMANDOS POSIBLES

echo -e "${pur}┣━━━━━━━═══════════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"
echo -e "${pur}┣━━─    ${pur}──  ${blu}Comandos que puedes necesitar para resolver este nivel  ${pur}──     ─━━┫" >> "$PSWD_FILE"
echo -e "${pur}┣━━━━━━━═══════════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"


	# Comprobar si para este nivel muestran comandos útiles o no, para mostrar un mensaje acorde
	if $(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "Commands" | grep -B 10000 'Donate!' | head -n -4 | grep -v "Commands" | grep -Ev "bandit0|Passwords|challenging|:|Helpful|Google|Chapter|Secure|FOSS|wikiHow|YouTube|accurate|Addresses|Wikipedia|Ports|OpenSSL" | xargs | grep "." &>/dev/null)
	then
		echo -e "${cia}$commands ${end}" | fmt -w 78 -s | pr -to 3 >> "$PSWD_FILE"
	else
		echo -e "${pur}┣━━─             ──  ${red}No hay recomendaciones para este nivel  ${pur}──           ─━━┫${end}" >> "$PSWD_FILE"
	fi


# TIPS

	# Comprobar si hay algún tip y mostrarlo en pantalla
	if $(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "TIP" | grep -B 10000 'Donate!' | grep -v 'Donate!' &>/dev/null)
	then
		echo -e "${pur}┣━━━━━━━═══════════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"
		echo -e "${pur}┣━━─                     ──   ${blu}TIP para este nivel   ${pur}──                     ─━━┫${end}" >> "$PSWD_FILE"
		echo -e "${pur}┣━━━━━━━═══════════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"
		echo -e "${pur}$TIP ${end}" | fmt -w 78 -s | pr -to 2 >> "$PSWD_FILE"

	else
	:
	fi


# MATERIAL UTIL Y NOTAS
echo -e "${pur}┣━═══════════════════════════════════════════════════════════════════════════━┫${end}" >> "$PSWD_FILE"
echo -e "${pur}┃               ──  ${blu}Material de lectura útil ${pur}┃ ${blu}Notas y TIPS  ${pur}──               ┃${end}" >> "$PSWD_FILE"
echo -e "${pur}┣━━━━━━━═══════════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"

	# Comprobar si existe material útil y mostrarlo en pantalla
	if $(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "Helpful Reading" | grep -B 10000 'Donate!' | head -n -4 | grep -v "Helpful" &>/dev/null)
	then
		echo -e "${blu}$helpful_material ${end}" | fmt -w 78 -s | pr -to 2 >> "$PSWD_FILE"		# Se muestra el material util en pantalla formateando el texto adecuadamente
	else
		echo -e "${pur}┣━━─          ──  ${red}No se encontró material útil en este nivel  ${pur}──           ─━━┫${end}" >> "$PSWD_FILE"
	fi


# Notas Útiles

	# Comprobar si hay notas útiles y mostrarlas en pantalla
	if $(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "Helpful note" | grep -B 10000 "Commands you" | grep -v "Commands you" &>/dev/null)
	then

		echo -e "${pur}┣━━━━━━━═══════════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"
		echo -e "${blu}$helpful_note ${end}" | fmt -w 55 -s | pr -to 2 >> "$PSWD_FILE"		# Se muestran las notas útiles
	else
	:
	fi


# Notas

	# Comprobar si hay notas y mostrarlas en pantalla
	if $(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "NOTE" | grep -B 10000 'Commands' | grep -v "Commands you may need" &>/dev/null)
	then

		echo -e "${pur}┣━━━━━━━═══════════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"
		echo -e "${blu}$note ${end}" | fmt -w 55 -s | pr -to 2 >> "$PSWD_FILE"		# Se muestran las notas
	else
	:
	fi

echo -e "${pur}┗━━━━━━━═══════════════════════════════════════════════════════════════━━━━━━━┛" >> "$PSWD_FILE"		# Texto final para cerrar el menú
echo -e "${pur}[=======================================================================IN-$PREV_LEVEL==]${end}\n" >> "$PSWD_FILE"		# Final de la ficha

}


# Funcion para mostrar la ficha de los niveles
function show_files(){

# Mostrar la previsualización del nivel en la función levels
local LEVEL="$1"
local NEXT_LEVEL=$((LEVEL + 1))

content="$(cat $PSWD_FILE | grep -A 1000000 "IN-$LEVEL=" | grep -B 1000000 "IN-$LEVEL=" | grep -v "IN-$LEVEL=")"

echo -e "$content" | pr -to 4		# Mostrar el contenido

if [ $LEVEL -lt 32 ]; then
	#echo -e "\n${pur} [💡] ${cia}Conectándote al nivel ${yel}$LEVEL${cia}, resolverás para obtener la contraseña del nivel ${yel}$NEXT_LEVEL${end}"
	echo -e "\n${pur} [💡] ${cia}Resuelve el nivel ${yel}$LEVEL${cia} para obtener la contraseña del nivel ${yel}$NEXT_LEVEL${cia} y poder conectarte.${end}"
else
	echo -e "\n${pur} [💡] ${cia}Este es el nivel final.${end}"
fi



}

# Funcion para modificar las contraseñas
function modify_password(){

local LEVEL="$1"

        read -p "$(echo -e "${pur}┣━━══[${yel}?${pur}] ${cia}Establecer${cia} contraseña de ${cia}acceso ${yel}--> ${cia}")" access_pass		# NO FUNCIONAN BIEN LOS COLORES

        echo -e " ${end}"

		access_pass_final="$(echo -e "${red} $access_pass ${end}")" # Agregarle colores a la contraseña

# Verificar si se introdujo una contraseña vacía
if [ -z "$access_pass" ]; then

tput civis
echo -e "\n${pur}┣━─ ❌ ${red}No se puede introducir una contraseña vacía...  ${pur}─━┫${end}"; sleep 2; tput cnorm

else    # Cambiar contraseña
		sed -i "/IN-$LEVEL=/,/IN-$LEVEL==/ { /Contraseña de acceso.*:/ s|: .*|: $access_pass_final| }" "$PSWD_FILE"

		tput civis
        echo -e "\n${pur}┣━─ ✅ ${cia}Contraseña de acceso para el nivel ${red}$init_level${cia} correctamente establecida ${pur}─━┫${end}\n"
        sleep 2; tput cnorm
fi

}


# Función que muestra la info de los niveles y muestra un menu con opciones (conectarse a un nivel, resolverlo, ver pistas...)
function levels(){

while true; do

    clear
    show_files "$init_level"        # Mostrar la preview del nivel con su info



	echo -e "\n"
	echo -e "${pur}╔═══════════════[${cia} Menu ${pur}]═══[${cia} BanditBreaker ${pur}]═══════════════╗"
	echo -e "${pur}║                                                          ║"
	echo -e "${pur}║  ${yel}c${pur}) ${cia}Conectarse al nivel                                  ${pur}║"
	echo -e "${pur}║  ${yel}r${pur}) ${cia}Aprender a resolver el nivel                         ${pur}║"
	echo -e "${pur}║  ${yel}p${pur}) ${cia}Establecer contraseña de acceso                      ${pur}║"
	echo -e "${pur}║                                                          ║"
	echo -e "${pur}╠══════════════════════════════════════════════════════════╣"
	echo -e "${pur}║     ${yel}⬡ ${cia}Introduce un número para cambiar de nivel ${yel}⬡${pur}        ║"
	echo -e "${pur}╠══════════════════════════════════════════════════════════╣"


	if [ "$init_level" -eq 0 ]; then		# SI estamos en 0 se muestra el limite a la izquierda
	echo -e "${pur}║          ${cia}◄${pur} [${yel}a${pur}] ${pur}Anterior    ${pur}┃${cia}    Siguiente ${pur}[${yel}s${pur}] ${cia}►${pur}          ║"
	fi

	if [ "$init_level" -eq 32 ]; then		# Si estamos en 32 se muestra el limite a la derecha
	echo -e "${pur}║          ${cia}◄${pur} [${yel}a${pur}] ${cia}Anterior    ${pur}┃${pur}    Siguiente ${pur}[${yel}s${pur}] ${cia}►${pur}          ║"
	fi


	if [[ "$init_level" -lt 32 && "$init_level" -gt 0 ]]; then		# Si no estamos en 32 ni en 0 se muestra sin límites
	echo -e "${pur}║          ${cia}◄${pur} [${yel}a${pur}] ${cia}Anterior    ${pur}┃${cia}    Siguiente ${pur}[${yel}s${pur}] ${cia}►${pur}          ║"

	else
	:
	fi


	echo -e "${pur}╠══════════════════════════════════════════════════════════╣"
	echo -e "${pur}║                 ${yel}e${pur}) ${cia}Salir del script   ▼                  ${pur}║"
	echo -e "${pur}╚══════════════════════════════════════════════════════════╝${end}\n\n"

	# Recoger opción del usuario
	read -p "$(echo -e "${pur}┣━━══[${yel}?${pur}] ${cia}Elige una opción ${yel}--> ${cia}")" option
	echo -e "${end}"


    # Mostrar preview del nivel especificado
    if [[ "$option" =~ ^([0-9]|[1-2][0-9]|3[0-2])$ ]]; then			# Limitar el uso del menú del 1 al 32
        init_level="$option"
        levels
    else
        :
    fi

	# Logica de las opciónes
    case $option in
        c)
            connect_to_level "$init_level"
        ;;
        r)
            learn_this_level "$init_level"
        ;;
		p)
			modify_password "$init_level"
		;;
        a)
        if [ $init_level -gt 0 ]; then
                ((init_level--)); fi ;; # Ir a la pagina anterior restando 1 al numero de preview + añadido límite
        s)
        if [ $init_level -lt 32 ]; then
                ((init_level++)); fi ;; # Ir a la pagina siguiente sumando 1 al numero de preview + añadido límite
		e)	ctrl_c
		;;
        *)
            clear; tput civis
			echo -e "${pur}┏━━━━━━━━━━━━══[ ${cia}BanditBreaker${pur} ]══━━━━━━━━━━━━━┓"
			echo -e "┃  ${red}[!] ${cia}Opción inválida, inténtalo de nuevo...  ${pur}┃"
			echo -e "┗━━══════════════════════════════════════════━━┛${end}\e"
            sleep 2; tput cnorm; levels
        ;;
    esac

done

}


# Mostrar logo del script
logo

# Verificamos 1 vez cada vez que se abre el script si están las herramientas necesarias actualizadas.
verify

# Bucle principal
while true; do

	levels

done
