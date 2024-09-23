---
lang: "es"
title: "Gestión de Paquetes"
author:
    - \textsc{Hansel Tepal, Francisco Galindo} \newline Estudiantes de Ingeniería en
      Computación
institute:
    - \textit{Universidad Nacional Autónoma de México\\ Facultad de Ingeniería}
date: Curso de SysAdmin, 2025-1
aspectratio: 169
---

# Información del tema

## Tiempo estimado

Aproximadamente 1 hora de clase, repartido en secciones de explicación teórica y
pequeños ejercicios para reforzar el aprendizaje.

## Objetivos

- Aprender la utilidad de la existencia de usuarios, grupos y permisos en un
  sistema Linux
- Aprender a crear, modificar y eliminar usuarios y grupos del sistema.
- Se podrán interpretar y asignar diferentes permisos a los archivos del sistema
  de archivos.

# Instalando Software en un sistema linux

En Linux (y en UNIX), el software se instalal de una manera distinta a otros
sistemas operativos.

En lugar de utilizar una *AppStore* o descargar cosas desde el sitio web del
desarrollador, se prefiere instalar programas mediante un *gestor de paquetes*.

# Gestores de paquetes

Son herramientas que automatizan la instalación, actualización, configuración y
eliminación de colecciones de software (programas, bibliotecas, ...) que se
conocen como *paquetes* en una computadora.

La manera principal de instalar software en una distribución Linux es mediante
algún gestor de paquetes.

# Gestores de paquetes

Un gestor de paquetes tiene una base de datos (repositorio) sobre muchos
paquetes, así como las dependencias que tiene uno del otro para que todas las
instalaciones sean correctas.

# Gestores de paquetes

Algunos gestores de paquetes muy conocidos son: 

- `apt`: El utilizado por Debian, Ubuntu y sus derivados (Mint, etc.). Los
  paquetes con los que trabaja tienen la extensión `.deb`
- `dnf`, `yum`: Utilizados en distribuciones basadas en *RHEL* (Fedora, CentOS,
  Rocky, etc.). Los paquetes están en formato `rpm`.
- `pacman`: Utilizado en Arch y sus derivados.

El gestor de paquetes es uno de los principales elementos que distinguen una
distribución de otra.

# `dnf`

```sh
dnf search paquete
sudo dnf install paquete
sudo dnf remove paquete
sudo dnf autoremove paquete
sudo dnf update
```

# Gestores de paquetes agnósticos

Para prevenir la fragmentación del "ecosistema" de Linux, existen algunos
gestores de paquetes que intentan funcionar sim importar la distribución en la
que se use:

- Flatpak
- Snap *
- AppImage

# Flatpak

*FlatHub*[^1] es el repositorio más grande de Flatpak:

```sh
flatpak search programa
flatpak install programa
flatpak uninstall programa
flatpak update
```

[^1]: https://flathub.org/setup

# AppImage

Es un formato donde el programa viene empaquetado junto a todas sus
dependencias, para que no importe el sistema que está por detrás

Ejemplo: https://github.com/jgraph/drawio-desktop

# AppImage

Una vez descargado algún `.AppImage`, se le dan permisos de ejecución y se puede
correr como cualquier otro ejecutable.

# Compilando un programa

Si lo que deseamos instalar no se encuentra disponible fácilmente en los
gestores de paquetes, puede optarse por compilar directamente

¡Instalemos `git`!

# Compilando un programa

## Instalar requerimientos

```sh
$ sudo apt install build-essential
$ sudo apt install make \\
    libssl-dev libghc-zlib-dev \\
    libcurl4-gnutls-dev libexpat1-dev \\
    gettext
```

## Obtener código fuente

```sh
$ sudo mkdir /opt/git
$ wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.46.0.tar.xz
```

# Compilando git

## Extrae el código

```sh
$ tar -xvf git-2.46.0.tar.xz
$ cd git-2.46.0
```

## Configura la instalación

```sh
$ make -j $(nproc) prefix=/opt/git all
```

## Instala el software

```sh
$ sudo make prefix=/opt/git install
```

## Prueba el software

```sh
$ /opt/git/bin/git init
```
