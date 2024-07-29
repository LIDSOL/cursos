---
lang: "es"
title: "Comandos Básicos (uso básico de la terminal)"
# subtitle: "Subtítulo"
author:
    - \textsc{Enrique Calderón, Francisco Galindo} \newline Estudiante de Ingeniería en
      Computación
institute:
    - \textit{Universidad Nacional Autónoma de México\\ Facultad de Ingeniería}
date: Curso de SysAdmin, Julio de 2024

---

# Recordatorio

También hay apuntes correspondientes a esta presentación. Ahí, algunos conceptos
presentados (sobre todo redirección y *pipes*) estarán explicados en mayor
detalle que en las diapositiva con el objetivo de no sobrecargar la
presentación.

# Los más básicos

# Comandos útiles para el manejo de archivos

- `find`: Permite realizar búsquedas detalladas de archivos.

- `find`: Permite realizar búsquedas detalladas de archivos.

# Comandos para obtener información del Sistema

- `uname`: muestra información como el `hostname`, version del *kernel* y la
  arquitectura del procesador.

- `uptime`: Muestra el tiempo que la computadora ha estado funcionando.

- `free`: Muestra el uso de memoria RAM y de *swap*.

- `df`: Muestra el uso de los discos de la computadora.


# Comandos para procesamiento de texto 

- `grep`: Permite la búsqueda de cierta cadena en un archivo. Te permite
  encontrar las partes del archivo que contienen (o que no contienen) la cadena
  de interés. Extremadamente útil para extraer información útil de un archivo
  grande.

- `sed`: Permite filtrar y editar flujos de texto. Generalmente se usa para
  hacer modificaciones relativamente sencillas en archivos o en la salida de
  algún otro programa. Se utilizan expresiones regulares para definir qué partes
  del texto modificar o mostrar.

- `awk`: ¡Es lenguaje de programación! A diferencia de Python, C y el resto.
  `awk` se centra en el procesamiento de texto. 

# a

a

# Redirección de entrada y salida

La mayoría de los comandos que se han utilizado hasta ahora, mientras se están
ejecutando, muestran su salida en la terminal, algunos también reciben
información de este modo.

# Tuberías (`pipes`)

