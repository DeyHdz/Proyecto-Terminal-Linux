#!/bin/bash

clear
# Colores estándar
R='\033[1;31m'   # Rojo brillante
G='\033[1;32m'   # Verde brillante
Y='\033[1;33m'   # Amarillo brillante
B='\033[1;34m'   # Azul brillante
M='\033[1;35m'   # Magenta brillante
C='\033[1;36m'   # Cian brillante
W='\033[1;37m'   # Blanco brillante (gris claro)

# Colores oscuros
R0='\033[0;31m'  # Rojo
G0='\033[0;32m'  # Verde
Y0='\033[0;33m'  # Amarillo
B0='\033[0;34m'  # Azul
M0='\033[0;35m'  # Magenta
C0='\033[0;36m'  # Cian
W0='\033[0;37m'  # Blanco (gris)

echo -e "${M}"

	printf "\t\t   ▗▖▗▖ ▗▖▗▄▄▄▖ ▗▄▄▖ ▗▄▖  ▗▄▄▖\n"
	printf "\t\t   ▐▌▐▌ ▐▌▐▌   ▐▌   ▐▌ ▐▌▐▌   \n"
	printf "\t\t   ▐▌▐▌ ▐▌▐▛▀▀▘▐▌▝▜▌▐▌ ▐▌ ▝▀▚▖\n"
	printf "\t\t▗▄▄▞▘▝▚▄▞▘▐▙▄▄▖▝▚▄▞▘▝▚▄▞▘▗▄▄▞▘\n"

echo -e "${C}\t===-===-===-===-===-===-===-===-===-===-==="
echo -e "${C}\t\t          M E N Ù"
echo -e "${C}\t===-===-===-===-===-===-===-===-===-===-===${W}"
echo -e " ${C}\t\t\t1.${W} Ahorcado"
echo -e " ${C}\t\t\t2. ${W}Gato"
echo -e " ${C}\t\t\t3. ${W}Salir${W}"

read -p "         Selecciona una opción [1-3]: " opcion

case $opcion in
    1)
        ./juegos/ahorcado.sh
        ;;
    2)
        ./juegos/gato.sh
        ;;
    3)
        echo -e "${G}\n\t\t\tS A L I E N D O ${W}"
      	sleep 1.5
	clear
	;;
    *)
        echo -e "${R}\n\t\t\tOpción inválida.${W}"
        ;;
esac
