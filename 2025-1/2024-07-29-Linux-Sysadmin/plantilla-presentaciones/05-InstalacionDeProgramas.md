---
lang: "es"
title: "Instalación de programas"
#subtitle: "Subtítulo"
author:
    - \textsc{Enrique Calderón, Francisco Galindo} \newline Estudiante de Ingeniería en
      Computación
institute:
    - \textit{Universidad Nacional Autónoma de México\\ Facultad de Ingeniería}
date: Curso de SysAdmin, 2025-1
---

# Información del tema

## Tiempo estimado

Aproximadamente 60 minutos de clase.

## Objetivos

Que los alumnos comprendan como se administran los programas en un sistema Debian GNU/Linux, tanto usando el administrador de paquetes `apt` como mediante el uso de código fuente.

# Introducción al tema

Un paquete son archivos que contiene todo lo necesario para instalar un programa. Como la lista de dependencias, bibliotecas, binarios, manuales y las instrucciones de donde debe de ir cada cosa.

Un repositorio es una colección de paquetes en Linux. Este suele ser un servidor de archivos web.

# ¿Por qué?

- Tener un ecosistema compatible entre sí
- Sistema de dependencias para evitar archivos duplicados
- Control de versiones
- Ubicación centralizada y confiable

# Comandos APT

## Actualizar

```sh
sudo apt update
sudo apt upgrade <paquete>

sudo apt full-upgrade
```

## Instalar

```sh
sudo apt install paquete1 paquete2 /path/paquete.deb
```

## Desinstalar

```sh
sudo apt remove paquete1 paquete2
sudo apt purge paquete1 paquete2
```

## Auto-desinstalar

```sh
sudo apt autoremove
```

# Comandos APT

## Buscar

```sh
sudo apt search paquete
```

## Listar

```sh
sudo apt list <--installed> <--upgradeable>
```

## Mostrar información

```sh
sudo apt show paquete
```

# Actividad APT

- Identifica si tienes instalado `vim`
- Encuentra la versión de `git`
- Lista las dependencias de `gcc`

# Compilado

La mayor parte de paquetes de Debian son software libre. Esto implica que el código fuente es de libre acceso.

## Razones para compilar

- Rendimiento
- Portabilidad
- Versión específica
- Actualización de seguridad
- Manejo de dependencias

# Compilando git

## Instalar requerimientos

```sh
sudo apt install build-essential
sudo apt install make \\
    libssl-dev libghc-zlib-dev \\
    libcurl4-gnutls-dev libexpat1-dev \\
    gettext
```

## Obtener código fuente

```sh
sudo mkdir /opt/git
```
`wget` https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.46.0.tar.xz

# Compilando git

## Extrae el código

```sh
tar -xvf git-2.46.0.tar.xz
cd git-2.46.0
```

## Configura la instalación

```sh
make -j $(nproc) prefix=/opt/git all
```

## Instala el software

```sh
sudo make prefix=/opt/git install
```

## Prueba el software

```sh
/opt/git/bin/git init
```
