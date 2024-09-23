
---
lang: "es"
title: "Sistemas de archivos"
# subtitle: "Subtítulo"
author:
    - \textsc{Enrique Calderón, Francisco Galindo} \newline Estudiante de Ingeniería en
      Computación
institute:
    - \textit{Universidad Nacional Autónoma de México\\ Facultad de Ingeniería}
date: Curso de SysAdmin, Julio de 2024

---

# Información del tema

## Tiempo estimado

Aproximadamente 120 minutos de clase.

## Objetivos

Que el alumno comprenda la necesidad y la forma en la que se realizan respaldos
de información en un servidor

# Introducción al tema

Puede llegar a decirse que cualquier información que no está respaldada no
existe.

Los medios en los que se almacena información digital son perecederos.

No es una cuestión de si un disco duro fallará, sino cuando.

# Introducción al tema

- Imagina que los datos de tus clientes, *e-mails*, historiales de compra, hojas
contables, se perdieran.

- Imagina que un desarrollador comete un error y hace una query SQL que borra
contenidos importantes de una base de datos.

- Imagina que quieres instalar Linux junto con tu sistema Windows en  *dual
  boot*, pero accidentalmente eliminas la partición en la que vivía Windows,
  junto con todas tus tareas y archivos personales.

# Introducción al tema

La importancia de hacer backups radica en la garantía de continuidad, protección
de datos, análisis, toma de decisiones y estrategia de recuperación. Es
fundamental elegir un método efectivo y ejecutarlo de manera regular para
proteger datos valiosos.

# Estrategia 3 2 1

Esta estrategia es bastante aceptada, y se basa en tener:

- **Tres** copias de los datos.
- Almacenadas en **dos** tipos de almacenamiento distintos.
- Donde **una** copia es almacenada en otro lugar geográfico (*off-site*).

# Estrategia 3 2 1

Esta estrategia asegura la protección ante:

- Fallos de *hardware*
- Errores de *software* (es más raro que el mismo bug provoque pérdida de datos
  si estos están en medios distintos, como un disco duro y un SSD con sistemas
  de archivos distintos)
- Desastres físicos (inundaciones, terremotos, incendios), pues todavía se tiene
  la copia remota.
- Ataques informáticos, como *ransomware*.

# `rsync`

`rsync` es un programa diseñado para transferir archivos entre dos *hosts*. 

```sh
rsync arch1 arch2 ... usuario@destino:/ruta/destino
```

`rsync` debe estar instalado en ambas máquinas.

# `rsync`

Por defecto, `rsync` sólo puede copiar archivos individuales. Si quieres copiar
una jerarquía de directorios, es necesaria la opción `-a`:

```sh
rsync -a directorio usuario@destino:/ruta/destino
```

# Probando el comando sin sufrir sus efectos

Transferir muchos archivos puede ser una tarea tardada, si necesitas verificar
que la transferencia que vas a realizar es la que quieres, puedes usar la opción
`-n` para hacer un *dry-run*. Te dice qué cosas haría el comando sin hacerlas de
verdad:

```sh
rsync -nva directorio usuario@destino:/ruta/destino
```

# Excluyendo archivos y directorios de la copia

```sh
rsync -a --exclude=.git src usuario@destino:
```

Hace que todo archivo llamado `.git` sea ignorado al hacer la copia

```sh
rsync -a --exclude=/src/.git src usuario@destino:
```

Hace que todo *el* `/src.git` sea ignorado al hacer la copia

# Haciendo copias exactas

Por defecto, `rsync` no toma en cuenta los contenidos previos que ya tuviera el
lugar de destino. Si quieren hacerse copias exactas de un directorio de origen,
debe hacerse esto:

```sh
rsync -a --delete directorio/ \
    usuario@destino:/ruta/destino
```

# *Trailing slash*

Colocar una diagonal al final del nombre de un directorio que se quiere copiar
causa un comportamiento distinto en `rsync`. A esta diagonal final se le llama
*trailing slash*.

# *Trailing slash*

![Copia normal con `rsync`](./img/rsync-normal.png)

# *Trailing slash*

![Copia normal con `rsync` usando el *trailing slash*](./img/rsync-trailing.png)
