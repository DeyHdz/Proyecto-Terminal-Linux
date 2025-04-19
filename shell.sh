#!/bin/bash

user=$1

# Bloquear Ctrl+C (SIGINT) y Ctrl+Z (SIGTSTP)
trap '' SIGINT
trap '' SIGTSTP


while true; do
    dir=$(pwd)
    echo -n "$user@$HOSTNAME:$dir$ "
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
		#echo "Uso: buscar <carpeta> <nombre_archivo>"
		#read -p "Carpeta: " carpeta
		#read -p "Nombre del archivo: " archivo
    		./Buscar.sh 
            #bash Buscar.sh $args
            ;;
        creditos)
            ./Creditos.sh
            ;;
        jugar)
            ./juegos.sh
            ;;
        musica)
            ./Musica.sh
            ;;
        salir)
            echo "Cerrando sesión..."
            exit 0
            ;;
        *)
            $input $args 2>/dev/null
            ;;
    esac
done
