#!/bin/bash

# Verifica que se hayan recibido dos argumentos
if [ $# -ne 2 ]; then
    echo "Uso: buscar <carpeta> <nombre_archivo>"
    exit 1
fi

carpeta=$1
archivo=$2

# Verifica si la carpeta existe
if [ ! -d "$carpeta" ]; then
    echo "La carpeta '$carpeta' no existe."
    exit 1
fi

# Buscar el archivo
resultado=$(find "$carpeta" -type f -name "$archivo" 2>/dev/null)

if [ -z "$resultado" ]; then
    echo "No se encontró el archivo '$archivo' en '$carpeta'."
else
    echo "Archivo encontrado en:"
    echo "$resultado"
fi

