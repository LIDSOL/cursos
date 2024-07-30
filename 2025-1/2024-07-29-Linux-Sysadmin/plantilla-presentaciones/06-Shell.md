---
lang: "es"
title: "Shell"
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

Aproximadamente 120 minutos de clase.

## Objetivos

Que los alumnos comprendan que es una shell, como se interactúa con ella además de el uso de jobs para mandar ejecuciones a background, los archivos de configuración, entornos, caracteres especiales y scripting.

# Introducción al tema

Una shell es la capa interactiva entre el usuario y el sistema. Es la interfaz que te permite ejecutar comandos, administrar archivos y tener acceso a los recursos del sistema.

Las mas comunes:

- Bash (Bourne-Again SHell): La mas común
- Zsh (Z shell): Shell con autocompletado plugins, temas y mas
- Fish: Shell fácil de aprender
- TCSH: Similar a bash, usado en multiples sistemas unix.

# Funciones de una shell

- Interpretar comandos
- Gestionar archivos
- Ejecutar comandos
- Variables de entorno
- Scripting

# Jobs

## Listar jobs

```sh
jobs
```

## Suspender un comando

```sh
make all
#<ctrl+z>
```

## Correr el comando en background

```sh
bg
```

## Mandar un proceso a background

```sh
make all &
```

## Traer un proceso de regreso

```sh
fg
```

# Entorno

## Listar todas las variables en el entorno actual

```sh
env
```

## $PATH

Es el lugar donde la shell buscará los archivos ejecutables que le presentará al usuario sin necesidad de la ruta absoluta.



# Archivos importantes

## ~/.bash_profile y ~/.bashrc

Archivos de configuración de arranque. Se ejecutan al iniciar una shell.

## ~/.bash_history

Almacena el historial de comandos. Se puede pedir imprimir a stdout

```sh
history
```

O se puede buscar en el historia con `<ctrl+r>`

# Caracteres a recordar

| Character | Name(s)           | Uses                                                                 |
|-----------|-------------------|----------------------------------------------------------------------|
| *         | star, asterisk    | Regular expression, glob character                                   |
| .         | dot               | Current directory, file/hostname delimiter                           |
| !         | bang              | Negation, command history                                            |
| |         | pipe              | Command pipes                                                        |
| /         | (forward) slash   | Directory delimiter, search command                                  |
| \         | backslash         | Literals, macros (never directories)                                 |
| $         | dollar            | Variables, end of line                                               |

# Caracteres a recordar

| Character | Name(s)           | Uses                                                                 |
|-----------|-------------------|----------------------------------------------------------------------|
| '         | tick, (single) quote | Literal strings                                                  |
| `         | backtick, backquote | Command substitution                                              |
| "         | double quote      | Semi-literal strings                                                 |
| ^         | caret             | Negation, beginning of line                                          |
| ~         | tilde, squiggle   | Negation, directory shortcut                                         |
| #         | hash, sharp, pound | Comments, preprocessor, substitutions                               |

# Caracteres a recordar

| Character | Name(s)           | Uses                                                                 |
|-----------|-------------------|----------------------------------------------------------------------|
| [ ]       | (square) brackets | Ranges                                                               |
| { }       | braces, (curly) brackets | Statement blocks, ranges                                    |
| _         | underscore, under | Cheap substitute for a space used when spaces aren’t wanted or allowed, or when autocomplete algorithms get confused |
