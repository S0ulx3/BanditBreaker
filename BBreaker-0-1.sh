#!/bin/bash


###################################################################

# Función Ctrl+C

function ctrl_c (){
tput civis
clear
echo -e "\e[0m\e[42\e[31m\n\n|--------------------|"
          echo -e "| [!] Saliendo...    |"
          echo -e "|--------------------|\n\n\e[0m"

sleep 0.7
tput cnorm; exit 1
}

# Ctrl+C

trap ctrl_c INT


###################################################################



# Función Start

function start (){
tput civis
clear

echo -e "\e[31m
|--------------------------------------------------------------------|
| ADVERTENCIA: Este script se proporciona con fines educativos.      |
| El usuario es totalmente responsable de cualquier acción realizada |
| con o a través de este script. El autor no asume ninguna           |
| responsabilidad por el uso o mal uso de este script.               |
| Por favor, úsalo de manera responsable.                            |
|--------------------------------------------------------------------|\e[0m"

sleep 5
clear

        echo -e "\e[41m\e[30m|-----------------------------------|"
                    echo -e "| \e[0m\e[40m\e[31m Bienvenido a [ BanditBreaker ] \e[0m\e[41m\e[30m  |"
                    echo -e "|------------\e[0m\e[40m\e[31m By S0ulx3 \e[0m\e[41m\e[30m------------|\e[0m\n\n\n\n"

        sleep 2

        echo -e "\e[41m\e[30m|-----------------------------------------------------|"
                    echo -e "| Para entender los procesos realizados es de suma    |"
                    echo -e "| importancia tener la pagina abierta de bandit,      |"
                    echo -e "| conocer o haber intentado antes el nivel a realizar.|"
                    echo -e "| ----------------------------------------------------|"
                    echo -e "| ----- https://overthewire.org/wargames/bandit/ -----|"
                    echo -e "| -------------- Dicho esto, Comenzemos --------------|\e[0m\n\n"
        sleep 5
        tput cnorm; tutorial

}




# Pedir al usuario si quiere iniciar el tutorial

function tutorial () {
tput civis
clear
sleep 0.5

        echo -e "\e[41m\e[30m|----------------------------------------|"
                    echo -e "|  Tutorial para el nivel [ Bandit 0-1 ] |"
                    echo -e "|----------------------------------------|\e[0m\n\n"
        sleep 1

        echo -e "\e[41m\e[30m|--------------------------------------|"
                    echo -e "|  [?] ¿Deseas comenzar el tutorial?   |"
                    echo -e "|--------------------------------------|\e[0m\n"
        echo -e "\e[41m\e[30m|-------------------|"
                    echo -e "|   [?] [ y or n ]  |"
                    echo -e "|-------------------|"
        read -p "---> " yorn

                if [ $yorn == "y" ]; then

        tput cnorm; start_tutorial

                else

        echo -e "\e[41m\e[30m|----------------------------------|"
                    echo -e "| [!]    - Cerrando script -       |"
                    echo -e "|----------------------------------|\e[0m\n"

        tput cnorm; exit 1

                fi

}




##############################################################################################################################################################




# Empezar el tutorial


function start_tutorial () {
tput civis
clear

        echo -e "\e[41m\e[30m|----------------------------------------------------------|"
                    echo -e "| Primero vamos a ver que hay en el directorio de Bandit0  |"
                    echo -e "| ---\e[0m\e[40m\e[31m Ejecutando el comando ls \e[0m\e[41m\e[30m--------------------------- |\n\n"
sleep 3
output_ls=$(sshpass -p "bandit0" ssh bandit0@bandit.labs.overthewire.org -p 2220 'ls')
                    echo -e "|----------------------------------------------------------|"
                    echo -e "| \e[0m\e[40m\e[31m $output_ls \e[0m\e[41m\e[30m            "
                    echo -e "|----------------------------------------------------------|\e[0m\n\n"
sleep 3
        echo -e "\e[41m\e[30m|----------------------------------------------------------|"
                    echo -e "| Ahora, ya que vemos que hay un archivo con nombre readme |"
                    echo -e "| Vamos a ver que hay dentro de ese archivo                |"
                    echo -e "| ---\e[0m\e[40m\e[31m Ejecutando el comando cat readme \e[0m\e[41m\e[30m------------------- |"
sleep 4
output_cat=$(sshpass -p "bandit0" ssh bandit0@bandit.labs.overthewire.org -p 2220 'cat readme')
                    echo -e "|----------------------------------------------------------|"
                    echo -e "| \e[0m\e[40m\e[31m $output_cat \e[0m\e[41m\e[30m           "
                    echo -e "|----------------------------------------------------------|\e[0m\n"
sleep 3
        echo -e "\e[41m\e[30m|----------------------------------------------------------|"
                    echo -e "|\e[0m\e[40m\e[31m  [!] Esa seria la contraseña para el nivel Bandit1 [!]   \e[0m\e[41m\e[30m|"
                    echo -e "|----------------------------------------------------------|"
sleep 2
tput cnorm; exit 1

}



##############################################################################################################################################################

start
