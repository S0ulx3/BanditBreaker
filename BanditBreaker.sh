#!/bin/bash

## BanditBreaker ## By Shadow0011 ## V0.6-beta ##


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


# Colores normales - de momento no se usan
#red='\e[31m'
#gre='\e[32m'
#yel='\e[33m'
#blu='\e[34m'
#pur='\e[35m'
#cia='\e[36m'
end='\e[0m'


# Paleta híbrida optimizada
pur='\e[38;5;135m'   # Morado vibrante (títulos, marcos)
cia='\e[38;5;51m'    # Cyan neón (info importante)
gre='\e[38;5;46m'    # Verde Matrix (éxito, confirmaciones)
yel='\e[38;5;226m'   # Amarillo brillante (advertencias)
red='\e[38;5;196m'   # Rojo intenso (errores)
blu='\e[38;5;39m'    # Azul neón (secundario)


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

    for vuelta in {0..34}; do

	make_writeups "$vuelta"

    done
    fi


    # Archivo de contraseñas

    if [ ! -f "$PSWD_FILE" ]; then

    clear; tput civis
    echo -e "${pur}┏━━══[${cia} BanditBreaker ${pur}]══━━────────────────────────────────━━┓"
    echo -e "${pur}┃   ${red}[!] ${cia}No se encontró el archivo de niveles, creando...${pur}    ┃"
    echo -e "${pur}┃   ${red}[!] ${cia}Puede tardar un poco, dependiendo de tu conexión.${pur}   ┃"
    echo -e "${pur}┗━━═══════════════════════════════════════════════════════━━┛${end}"
	echo -e "${pur}    ╰─>${cia} Extrayendo desde: ${yel}https://overthewire.org/wargames/bandit/${end}\n"

    for levels in {0..34}; do

        make_files "$levels"    # Crear automaticamente las fichas de los niveles

    done

    clear
    echo -e "\n${pur}┏━━══[${cia} BanditBreaker ${pur}]══━━───────────────────────────━━┓"
    echo -e "┃   ${gre}[!] ${cia}Archivo de contraseñas correctamente creado.${pur}   ┃"
    echo -e "┗━━══════════════════════════════════════════════════━━┛${end}\n"; sleep 3.5; tput cnorm;

    fi

levels

}


# Función para crear los writeups -- ( De manera provisional se escribirán lso writeups aquí manualmente, posiblemente en un futuro se extraigan automáticamente de alguna web )
function make_writeups(){

local LEVEL="$1"
WTPS_FILE="$WTPS_DIR/bandit$LEVEL.txt"


case $LEVEL in
0)							# WRITEUP NIVEL 1
cat << 'EOF' > $WTPS_FILE

  #                                                       #
  #  ¡Bienvenido a este primer WRITEUP de BANDITBREAKER!  #
  #                                                       #

    ######################
    ## Bandit - Nivel 0 ##
    ######################





EOF
;;
1)
cat << 'EOF' > $WTPS_FILE


    ######################
    ## Bandit - Nivel 1 ##
    ######################


EOF
;;
2)
cat << 'EOF' > $WTPS_FILE


    ######################
    ## Bandit - Nivel 2 ##
    ######################


EOF
;;
3)
cat << 'EOF' > $WTPS_FILE

	######################
    ## Bandit - Nivel 3 ##
    ######################


EOF
;;
4)
cat << 'EOF' > $WTPS_FILE


    ######################
    ## Bandit - Nivel 4 ##
    ######################


EOF
;;
5)							# WRITEUP NIVEL 5
cat << 'EOF' > $WTPS_FILE

    ######################
    ## Bandit - Nivel 5 ##
    ######################

EOF
;;
6)
cat << 'EOF' > $WTPS_FILE

    ######################
    ## Bandit - Nivel 6 ##
    ######################

EOF
;;
7)
cat << 'EOF' > $WTPS_FILE

    ######################
    ## Bandit - Nivel 7 ##
    ######################

EOF
;;
8)
cat << 'EOF' > $WTPS_FILE

    ######################
    ## Bandit - Nivel 8 ##
    ######################

EOF
;;
9)
cat << 'EOF' > $WTPS_FILE

    ######################
    ## Bandit - Nivel 9 ##
    ######################

EOF
;;
10)							# WRITEUP NIVEL 10
cat << 'EOF' > $WTPS_FILE

    #######################
    ## Bandit - Nivel 10 ##
    #######################

EOF
;;
11)
cat << 'EOF' > $WTPS_FILE

    #######################
    ## Bandit - Nivel 11 ##
    #######################

EOF
;;
12)
cat << 'EOF' > $WTPS_FILE

    #######################
    ## Bandit - Nivel 12 ##
    #######################

EOF
;;
esac

}


# Función para conectarse a los niveles automáticamente
function connect_to_level(){

local LEVEL="$1"
local IP="bandit$LEVEL@bandit.labs.overthewire.org"
local PORT="2220"
ACCESS_PASS="$(cat "$PSWD_FILE" 2>/dev/null | grep --color=never -A3 "IN-$LEVEL=" | grep "Contraseña" | cut -d ':' -f2- | xargs)"
PASS_CLEAN=$(echo -e "$ACCESS_PASS" | sed 's/\x1b\[[0-9;]*[mGJK]//g' | xargs)	# Limpiamos la contraseña de colores

# Conectarse al nivel seleccionado
sshpass -p "$PASS_CLEAN" ssh "$IP" -p "$PORT"

# Mensaje que se muestra al volver a la sesión actual
clear; tput civis

#clear; echo -e "[$PASS_CLEAN]"; sleep 4; clear # DEBUG

echo -e "\n\n${pur}┏━━──────────━━══[ ${cia}BanditBreaker${pur} ]══━━─────────━━┓"
echo -e "┃  ${red}[!] ${cia}Sesión SSH finalizada. Volviendo al Menú  ${pur}┃"
echo -e "┗━━════════════════════════════════════════════━━┛${end}\n"
sleep 2.5; tput cnorm; return


}

# Función para leer los writeups
function learn_this_level(){

local LEVEL="$1"
WTPS_FILE="$WTPS_DIR/bandit$LEVEL.txt"

less -R "$WTPS_FILE"

}


# Funcion para crear automáticamente las fichas de cada nivel
make_files(){

# Variable que recoge el nivel indicado
local LEVEL="$1"

# Variables que guardan la descripción, notas, comandos...
desc_preview="$(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "Level Goal" | grep -v "Level Goal" | grep -B 10000 'Help!?' | grep -B 10000 "Commands" | grep -Ev 'Help!?|Donate!|Level Goal| you may need|ls,|ssh into bandit|NOTE|intended solution|instead.|shell-script|level!|NOTE 2|NOTE|Keep in mind|executed,|CONNECTED|Keep in mind|If you are having|try executing|very useful skill.|this is related|works as you think')"
desc_preview2="$(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | pup "p" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -Ev 'Helpful note|manpage|s_client|using|SSL/TLS|grep|cp,|ls,|. ssh| TIP| machine!|NOTE|NOTE 2| challenging|occasionally|yourself,|Passwords for|saved automatically|Tip|CONNECTED COMMANDS|Keep in mind' | xargs)"
commands="$(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "Commands" | grep -B 10000 'Donate!' | head -n -4 | grep -v "Commands" | grep -Ev "bandit0|Passwords|challenging|:|Helpful|Google|Chapter|Secure|FOSS|wikiHow|YouTube|accurate|Addresses|Wikipedia|Ports|OpenSSL|Piping and Redirection" | sed 's/&amp;//' | xargs)"
helpful_material="$(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "Helpful Reading" | grep -B 10000 'Donate!' | head -n -4 | grep -v "Helpful")"
helpful_note="$(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "Helpful note" | grep -B 10000 "Commands you" | grep -v "Commands you")" # Para el nivel 15-16
note="$(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "NOTE" | grep -B 10000 'Commands' | grep -v "Commands you may need")" # Nivel 20-21 y nivel 22-23
TIP="$(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "TIP" | grep -B 10000 'Donate!' | grep -v 'Donate!' | head -n -3)"

local IP="bandit$LEVEL@bandit.labs.overthewire.org"
local PORT="2220"



# INICIO DE LA FICHA | NIVEL IP Y PUERTO + DESCRIPCIÓN
echo -e "${pur}[==IN-$LEVEL=======================================================================]" >> "$PSWD_FILE"
echo -e "${pur}┃  ─  ${cia}Nivel ${pur}─ ${cia}$LEVEL ${pur}┃ ${cia}IP${pur}: ${cia}$IP ${pur}┃ ${cia}Puerto${pur}: ${cia}$PORT ${pur}─   ┃${end}" >> "$PSWD_FILE"
echo -e "${pur}┣━━━━━━━━━━━━══════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"
echo -e "${pur}┃  ─  ${cia}Contraseña de acceso${pur}: ${red}[No encontrada]${end}" >> "$PSWD_FILE" >> "$PSWD_FILE"
echo -e "${pur}┣━━━━━━━━━━━━══════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"
echo -e "${pur}┃    ─              ${blu}Descripción del nivel ${pur}── ${blu}Level Goal                  ${pur}─    ┃${end}" >> "$PSWD_FILE"
echo -e "${pur}┣━━━━━━━━━━━━══════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"


	# Mostrar descripción dependendiendo del nivel
	if [[ $LEVEL -eq 20 || $LEVEL -eq 25 || $LEVEL -eq 34 ]]; then
		echo -e "${cia}$desc_preview2 ${end}" | fmt -w 78 -s | pr -to 2 >> "$PSWD_FILE"
	else
		echo -e "${cia}$desc_preview ${end}" | fmt -w 78 -s | pr -to 2 >> "$PSWD_FILE"
	fi


# COMANDOS POSIBLES

echo -e "${pur}┣━━━━━━━━━━━━══════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"
echo -e "${pur}┣━━─    ${pur}──  ${blu}Comandos que puedes necesitar para resolver este nivel  ${pur}──     ─━━┫" >> "$PSWD_FILE"
echo -e "${pur}┣━━━━━━━━━━━━══════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"


	# Comprobar si para este nivel muestran comandos útiles o no, para mostrar un mensaje acorde
	if $(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "Commands" | grep -B 10000 'Donate!' | head -n -4 | grep -v "Commands" | grep -Ev "bandit0|Passwords|challenging|:|Helpful|Google|Chapter|Secure|FOSS|wikiHow|YouTube|accurate|Addresses|Wikipedia|Ports|OpenSSL" | xargs | grep "." &>/dev/null)
	then
		echo -e "${cia}$commands ${end}" | fmt -w 78 -s | pr -to 2 >> "$PSWD_FILE"
	else
		echo -e "${pur}┣━━─             ──  ${red}No hay recomendaciones para este nivel  ${pur}──           ─━━┫${end}" >> "$PSWD_FILE"
	fi


# TIPS

	# Comprobar si hay algún tip y mostrarlo en pantalla
	if $(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "TIP" | grep -B 10000 'Donate!' | grep -v 'Donate!' &>/dev/null)
	then
		echo -e "${pur}┣━━━━━━━━━━━━══════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"
		echo -e "${pur}┣━━─                     ──   ${blu}TIP para este nivel   ${pur}──                     ─━━┫${end}" >> "$PSWD_FILE"
		echo -e "${pur}┣━━━━━━━━━━━━══════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"
		echo -e "${pur}$TIP ${end}" | fmt -w 78 -s | pr -to 2 >> "$PSWD_FILE"

	else
	:
	fi


# MATERIAL UTIL Y NOTAS
echo -e "${pur}┣━═══════════════════════════════════════════════════════════════════════════━┫${end}" >> "$PSWD_FILE"
echo -e "${pur}┃               ──  ${blu}Material de lectura útil ${pur}┃ ${blu}Notas y TIPS  ${pur}──               ┃${end}" >> "$PSWD_FILE"
echo -e "${pur}┣━━━━━━━━━━━━══════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"

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

		echo -e "${pur}┣━━━━━━━━━━━━══════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"
		echo -e "${blu}$helpful_note ${end}" | fmt -w 55 -s | pr -to 2 >> "$PSWD_FILE"		# Se muestran las notas útiles
	else
	:
	fi


# Notas

	# Comprobar si hay notas y mostrarlas en pantalla
	if $(curl -s "https://overthewire.org/wargames/bandit/bandit$LEVEL.html" | sed 's/<[^>]*>//g' | sed '/^$/d' | grep -v "OverTheWire:" | grep -A 10000 "NOTE" | grep -B 10000 'Commands' | grep -v "Commands you may need" &>/dev/null)
	then

		echo -e "${pur}┣━━━━━━━━━━━━══════════════════════════════════════════════════════════━━━━━━━┫${end}" >> "$PSWD_FILE"
		echo -e "${blu}$note ${end}" | fmt -w 55 -s | pr -to 2 >> "$PSWD_FILE"		# Se muestran las notas
	else
	:
	fi

echo -e "${pur}[=======================================================================IN-$LEVEL==]${end}\n" >> "$PSWD_FILE"		# Final de la ficha

}


# Funcion para mostrar la ficha de los niveles
function show_files(){

# Mostrar la previsualización del nivel en la función levels
local LEVEL="$1"
content="$(cat $PSWD_FILE | grep -A 1000000 "IN-$LEVEL=" | grep -B 1000000 "IN-$LEVEL=")"

echo -e "${cia}╔═════════════════════════════════════════════════════════════════════════════════════════╗${end}"
echo -e "$content" | pr -to 4
echo -e "${cia}╚═════════════════════════════════════════════════════════════════════════════════════════╝${end}"

}

# Funcion para modificar las contraseñas
function modify_password(){

local LEVEL="$1"

        read -p "$(echo -e "${pur}┣━━══${yel}[?] ${cia}Establecer${cia} contraseña de ${cia}acceso ${yel}--> ${cia}")" access_pass
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
    show_files "$init_level"        # Mostrar la preview del nivel y su descripción, logo...



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

	if [ "$init_level" -eq 34 ]; then		# Si estamos en 34 se muestra el limite a la derecha
	echo -e "${pur}║          ${cia}◄${pur} [${yel}a${pur}] ${cia}Anterior    ${pur}┃${pur}    Siguiente ${pur}[${yel}s${pur}] ${cia}►${pur}          ║"
	fi


	if [[ "$init_level" -lt 34 && "$init_level" -gt 0 ]]; then		# Si no estamos en 34 ni en 0 se muestra sin límites
	echo -e "${pur}║          ${cia}◄${pur} [${yel}a${pur}] ${cia}Anterior    ${pur}┃${cia}    Siguiente ${pur}[${yel}s${pur}] ${cia}►${pur}          ║"

	else
	:
	fi


	echo -e "${pur}╠══════════════════════════════════════════════════════════╣"
	echo -e "${pur}║                 ${yel}e${pur}) ${cia}Salir del script   ▼                  ${pur}║"
	echo -e "${pur}╚══════════════════════════════════════════════════════════╝${end}\n\n"

	# Recoger opción del usuario
	read -p "$(echo -e "${pur}┣━━══${pur}[?] ${cia}Elige una opción ${pur}--> ${cia}")" option
	echo -e "${end}"


    # Mostrar preview del nivel especificado
    if [[ "$option" =~ ^([0-9]|[1-2][0-9]|3[0-4])$ ]]; then

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
        a) if [ $init_level -gt 0 ]; then
                ((init_level--)); fi ;; # Ir a la pagina anterior restando 1 al numero de preview + añadido límite
        s) if [ $init_level -lt 34 ]; then
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

# Verificamos 1 vez cada vez que se abre el script si están las herramientas necesarias actualizadas.
verify

# Bucle principal
while true; do

	levels

done
