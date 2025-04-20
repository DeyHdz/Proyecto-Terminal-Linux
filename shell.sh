#!/bin/bash



# Colores estándar
M='\033[1;35m'   # Magenta brillante
C='\033[1;36m'   # Cian brillante
W='\033[1;37m'   # Blanco brillante (gris claro)

user=$1

# Bloquear Ctrl+C (SIGINT) y Ctrl+Z (SIGTSTP)
trap '' SIGINT
trap '' SIGTSTP


while true; do
    dir=$(pwd)
    #echo -n "$user@$HOSTNAME:$dir$ "
    echo -n -e "\033[1;36m$(whoami)@\033[1;33m$(hostname)\033[0m\033[1;35m$(pwd)\033[0m💻:"

    read -r input args

    case $input in
        ayuda)
            ./ayuda.sh
            ;;
        infosis)
            ./Infosis.sh
            ;;
        tiempo)
    	    ./FechaHora.sh

            ;;
        buscar)
    	    ./Buscar.sh 
            ;;
        creditos)
            ./Creditos.sh
            ;;
        jugar)
            ./gato.sh
            ;;
        musica)
            ./Musica.sh
            ;;
        salir)
	clear
            echo -e "\n\t\t${M}	C E R R A N D O   S E S I O N..."
               
	echo -e "${C}"
	echo -e "    .+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+. " 
	echo -e "   (     _ _   _           _          _                           _      )"
	echo -e "    )   (_) | | | __ _ ___| |_ __ _  | |   _   _  ___  __ _  ___ | |    ( "
	echo -e "   )    | | |_| |/ _  / __| __/ _  | | |  | | | |/ _ \/ _  |/ _ \| |     )"
	echo -e "    )   | |  _  | (_| \__ \ || (_| | | |__| |_| |  __/ (_| | (_) |_|    ( "
	echo -e "   (    |_|_| |_|\__,_|___/\__\__,_| |_____\__,_|\___|\__, |\___/(_)     )"
	echo -e "    )                                                 |___/             ( "
	echo -e "   (                                                                     )"
	echo -e "    .+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+.+*+. " 

	echo -e "${W}"

	sleep 3	
	clear
            exit 0
            ;;
        *)
            $input $args 2>/dev/null
            ;;
    esac
done

