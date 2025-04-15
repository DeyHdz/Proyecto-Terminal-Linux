#!/bin/bash
clear
# Colores
M='\033[1;35m'  # Magenta
C='\033[1;36m'  # Cian
G='\033[1;32m'  # Verde
R='\033[1;31m'  # Rojo
W='\033[0m'     # Reset

echo -e "${M}"
printf "\t\t▗▄▄▄▖▗▄▄▄▖▗▄▄▄▖▗▖  ▗▖▗▄▄▖  ▗▄▖ \n"
printf "\t\t  █    █  ▐▌   ▐▛▚▞▜▌▐▌ ▐▌▐▌ ▐▌\n"
printf "\t\t  █    █  ▐▛▀▀▘▐▌  ▐▌▐▛▀▘ ▐▌ ▐▌\n"
printf "\t\t  █  ▗▄█▄▖▐▙▄▄▖▐▌  ▐▌▐▌   ▝▚▄▞▘\n"


    # Obtener fecha y hora desde /proc/driver/rtc
    fecha=$(cat /proc/driver/rtc | grep rtc_date | awk '{print $3}')
    hora=$(cat /proc/driver/rtc | grep rtc_time | awk '{print $3}')

    echo -e "${C}\n\t\t=============================="
    echo -e "\t\t         Fecha y Hora"
    echo -e "\t\t=============================="
    echo -e "${M}\t\t Fecha actual:${W} $fecha"
    echo -e "${M}\t\t Hora actual: ${W} $hora"
