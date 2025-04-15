#!/bin/bash
clear
# Colores estándar
M='\033[1;35m'   # Magenta brillante
C='\033[1;36m'   # Cian brillante
W='\033[1;37m'   # Blanco brillante (gris claro)


echo -e "${M}"
printf "\t\t ▗▄▄▖▗▄▄▄▖ ▗▄▄▖▗▄▄▄▖▗▄▄▄▖▗▖  ▗▖ ▗▄▖ \n"
printf "\t\t▐▌     █  ▐▌     █  ▐▌   ▐▛▚▞▜▌▐▌ ▐▌\n"
printf "\t\t ▝▀▚▖  █   ▝▀▚▖  █  ▐▛▀▀▘▐▌  ▐▌▐▛▀▜▌\n"
printf "\t\t▗▄▄▞▘▗▄█▄▖▗▄▄▞▘  █  ▐▙▄▄▖▐▌  ▐▌▐▌ ▐▌\n"


echo -e "${M}===-===-===-===-===-===-===-===-===-===-===-===-===-===-===-===-===${W}"
# Memoria RAM (en KB) desde /proc/meminfo
mem_total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
mem_total_mb=$((mem_total / 1024))


echo -e "${C}\n\t\t R A M  T O T A L: ${W} $mem_total_mb MB" 
# Arquitectura del sistema
echo -e "${C}\tA R Q U I T E C T U R A: ${W} $(getconf LONG_BIT) bits"

# Modelo de procesador
echo -e "${C}\tP R O C E S A D O R: ${W} $(egrep "model name" /proc/cpuinfo | uniq | cut -d ":" -f2)"

echo -e "${C}\n\t\tS I S T E M A  O P E R A T I V O${W}"

# Nombre del sistema operativo
nombre_sisop=$(grep "PRETTY_NAME" /etc/os-release | grep -o '".*"' | sed 's/"//g')
echo -e "${W}\n\t\t\t$nombre_sisop"

# Tipo de sistema (basado en Debian, etc.)
basado_sisop=$(grep "ID_LIKE" /etc/os-release | grep -o '=.*' | sed 's/=//')
echo -e "${C}\t\t B A S A D O  E N: ${W} $basado_sisop"

