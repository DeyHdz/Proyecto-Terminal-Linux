#!/bin/bash

# Verifica si mpg123 está instalado
if ! command -v mpg123 &> /dev/null; then
    zenity --question --title="mpg123 no encontrado" --text="¿Deseas instalar mpg123?" --width=300
    if [[ $? -eq 0 ]]; then
        sudo apt update && sudo apt install -y mpg123
    else
        zenity --error --text="No se puede continuar sin mpg123."
        exit 1
    fi
fi

# Pedir al usuario seleccionar carpeta con música
musica_dir=$(zenity --file-selection --directory --title="Selecciona la carpeta con tu música")

if [[ -z "$musica_dir" ]]; then
    zenity --error --text="No seleccionaste ninguna carpeta."
    exit 1
fi

# Listar canciones en un menú
canciones=$(find "$musica_dir" -type f -iname "*.mp3")
if [[ -z "$canciones" ]]; then
    zenity --error --text="No se encontraron archivos MP3 en esa carpeta."
    exit 1
fi

# Crear un array con canciones
mapfile -t canciones_array <<< "$canciones"

# Selección de canción
opcion=$(zenity --list --title="🎵 Biblioteca Musical" \
    --column="Canciones" "${canciones_array[@]}" --height=400 --width=500)

if [[ -z "$opcion" ]]; then
    zenity --info --text="No seleccionaste ninguna canción."
    exit 0
fi

# Reproducir la canción seleccionada
zenity --info --text="Reproduciendo: $(basename "$opcion")"
mpg123 "$opcion"
