# 🙌 Guía de Contribución

¡Gracias por tu interés en contribuir al proyecto de Terminal Linux!

## 🎁 ¿Qué contribuciones son bienvenidas?

- Nuevos comandos personalizados útiles o divertidos
- Mejoras en la interfaz (colores, menús, animaciones)
- Soporte para más herramientas del sistema
- Agrgar más juegos
- Corrección de errores y optimización de código
---
## 🧰 Requisitos previos
- Linux instalado, puede ser nativo o en virtual box.
- Conocimiento básico linux.
- Git instalado
---
## 🛠️ Clonar y configurar el proyecto

```bash
git clone https://github.com/tu_usuario/Proyecto-Terminal-Linux.git
cd Proyecto-Terminal-Linux
chmod +x terminal.sh
```
---

## 👩🏻‍💻 Convenciones de código

- Usa nombres descriptivos para funciones y variables con tipo de notacion camelCase
- Comenta el código 
---

## 📝 Formato de commits
Sigue el siguiente estilo:

```bash
[OWNER][ADD][MASTER]
```

[OWNER]: ¿Quién esta realizando el cambio?
[ADD]: ¿Dónde se esta agregando?
[RAMA]: Master, main, o alguba otra.
Ejemplo:
ademas de una pequeña descripcion de lo que se hizo,
[DeyHdz][musica.sh][main] Se agrego menú, para elegir si se desea escuchar musica en aleatorio, seleccionar alguna o salr.

---
## 🐛 ¿Cómo abrir un issue o pull request?
- Abre un issue describiendo el problema o idea
- Espera aprobación o sugerencias
- Haz un fork del repositorio
- Trabaja en una nueva rama: git checkout -b fix-nombre
- Haz tu PR explicando tus cambios

---
## ✅ Pruebas
Ejecuta el script principal y prueba todas las funciones antes de subir cambios. Si agregas nuevas, incluye instrucciones de prueba en el PR.
