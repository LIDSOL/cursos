---
lang: "es"
title: "Presentación del curso"
#subtitle: "Subtítulo"
author:
    - \textsc{Enrique Calderón, Francisco Galindo} \newline Estudiante de Ingeniería en
      Computación
institute:
    - \textit{Universidad Nacional Autónoma de México\\ Facultad de Ingeniería}
date: Curso de SysAdmin, 2025-1
---

# Objetivo del curso

El curso esta dirigido hacia personas con conocimientos de GNU/Linux quienes se deseen adentrar a la administración y mantenimiento de servidores.

Los alumnos obtendrán conocimientos sobre la administración de sistemas GNU/Linux para su
uso como servidor.

# Temario

- Linea de comandos [7.5 h]
    - Estructura de directorios en GNU/Linux [0.5 h]
    - Usuarios y permisos [1 h]
    - Comandos básicos [2 h]
    - Editor de texto [1 h]
    - Instalación de programas [1 h]
    - Shell [2 h]
- Sistema Debian GNU/Linux [12.5 h]
    - Systemd [1 h]
    - Administración de servicios [2.5 h]
    - Redes y Firewall [3 h]
    - Almacenamiento y sistemas de archivos [2 h]
    - Métodos de respaldo de información [2 h]
    - Contenedores [2 h]

# Requisitos

- Conocimientos básicos de GNU/Linux
- Acceso a la máquina virtual proporcionada por el laboratorio

# Metodología de enseñanza

Se utiliza un sistema teórico-práctico en el cual inicialmente se imparte la parte teórica para posteriormente asignar ejercicios de reforzamiento.

Se finaliza con un proyecto para reforzar la totalidad de conocimientos adquiridos en el curso.

El proyecto se mencionará al finalizar el curso, la fecha de entrega es máximo el día posterior a la finalización del curso.

# Evaluación

El curso se evalúa por medio de asistencia (mínima del 80%) y entrega del proyecto final.

Ambas son requeridas para la obtención de la constancia del curso.

# Recursos

- B. Smith, DevOps for the Desperate.
- G. Wolf, Fundamentos de sistemas operativos.
- B. Ward, How Linux Works.
- M. Hausenblas, Learning Modern Linux.
- V. Rudareanu y D. Baturin, Linux for System Administrators.
- D. A. Tevault, Linux Service Management Made Easy With Sy.
- K. Hess, Practical Linux System Administration.

# Acceso a máquina virtual

A cada alumno se le proporciona acceso a una máquina virtual dentro de la red de la UNAM, en caso de requerir acceso fuera de la misma se puede proporcionar acceso mediante VPN.

La máquina virtual tiene instalado Debian GNU/Linux, se proporciona acceso a un usuario con privilegios de root, este acceso es de tipo ssh y se proporcionaran los datos de acceso al iniciar el curso.

Es posible realizar las actividades en una máquina virtual propia.

# Guía de acceso por ssh

## Datos de acceso

- IP del servidor
- Puerto para SSH
- Usuario
- Contraseña

## Comando para acceder al servidor

```sh
ssh -p PUERTO usuario@ip
```

# Acceso mediante llave de ssh

Para evitar el uso de contraseñas se recomienda el uso de llaves SSH

## Creación de llave ssh

```sh
ssh-keygen -t ed25519 -f ~/.ssh/id -C "user@email.com"
```

- `-t ed25519` El tipo de llave a crear, este tipo es de curva elíptica proporcionando mas seguridad y rendimiento en comparación a la tradicional RSA
- `-f ~/.ssh/id_ed25519` El nombre del archivo donde guardar la llave, se agrega la extensión `.pub` para distinguir a la llave pública.
- `user@email.com` El comentario de la llave, es un identificador opcional.

# Acceso mediante llave de ssh

## Copia de llave al servidor

```sh
ssh-copy-id -i ~/.ssh/llave.pub -p PUERTO usuario@IP
```

Al copiar la llave al servidor se debe indicar la ruta a tu llave pública. Esta será la última vez que debe de pedir la contraseña.

