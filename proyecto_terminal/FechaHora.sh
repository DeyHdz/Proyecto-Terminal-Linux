#!/bin/bash

# Leer desde /proc/driver/rtc
if [ -f /proc/driver/rtc ]; then
    fecha=$(grep 'date' /proc/driver/rtc | awk '{print $3}')
    hora=$(grep 'time' /proc/driver/rtc | awk '{print $3}')
    
    echo "=============================="
    echo "        Fecha y Hora"
    echo "=============================="
    echo "📅 Fecha actual: $fecha"
    echo "⏰ Hora actual:  $hora"
else
    echo "No se puede acceder a la fecha del sistema desde /proc/driver/rtc"
fi
