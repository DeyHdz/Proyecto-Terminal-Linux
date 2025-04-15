clear

#!/bin/bash

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


# Título generado en https://patorjk.com/software/taag/
echo -e "${B0}"

printf "\t████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     \n"
printf "\t╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     \n"
printf "\t   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     \n"
printf "\t   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     \n"
printf "\t   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗\n"
printf "\t   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝\n"
                                                                                        

	echo -e "${C}\t\t\t┌────────────────────────────────┐"
	echo -e "${C}\t\t\t│  ${W}    B I E N V E N I D O       ${C}│"
	echo -e "${C}\t\t\t└────────────────────────────────┘"


# Entrada de usuario y contraseña

	user="$C\t\t\t Usuario: $W "
	pass="$C\t\t\t Contraseña:$W "

	read -p "$(echo -e "$user")" user
	read -s -p "$(echo -e "$pass")" pass


# Verifica usuario con el sistema
	if su -c "exit" "$user" <<< "$pass" &>/dev/null; then
    		echo -e "${G}\n\n\t\t\t\t ACCESO AUTORIZADO"
	else
    		echo -e "${R}\n\n\t\t\t USUARIO O CONTRASEÑA INCORRECTOS"
    	exit 1
	fi

# Ejecutar la terminal personalizada
	echo -e "${G}\n\t\t\t\t I N I C I A N D O...${W}"
sleep 3
clear
exec ./shell.sh

