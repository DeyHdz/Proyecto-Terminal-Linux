#!/bin/bash

# Memoria RAM (en KB) desde /proc/meminfo
mem_total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
mem_total_mb=$((mem_total / 1024))

# Arquitectura desde /proc/cpuinfo
arquitectura=$(grep "model name" /proc/cpuinfo | head -n 1 | cut -d ':' -f 2)

# Versión del sistema desde /etc/os-release
version=$(grep PRETTY_NAME /etc/os-release | cut -d '=' -f 2 | tr -d '"')

echo "=============================="
echo "   Información del sistema"
echo "=============================="
echo "🔹 Memoria RAM total: $mem_total_mb MB"
echo "🔹 CPU: $arquitectura"
echo "🔹 Sistema operativo: $version"

