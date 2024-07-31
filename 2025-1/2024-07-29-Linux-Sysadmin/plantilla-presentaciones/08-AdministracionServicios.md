---
lang: "es"
title: "Administración de servicios"
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

Aproximadamente 150 minutos de clase.

## Objetivos

La clase será en su mayor parte práctica. A lo largo de la realización de los ejercicios los alumnos terminarán de entender los conceptos de administración de servicios.

- Instalaran un servicio dummy para hacer uso de systemd timers y aprenderán a listarlos.
- Instalar un servicio a nivel usuario para entender el uso de lingering.
- Instalaran nginx, observaran como se representa con systemd, bitácora, configuración y permisos.
- Instalaran un servicio de DNS, blocky, para entender como se lleva a cabo la configuración de un servicio.

# Recordar

Los archivos de systemd units se almacenan en `/etc/systemd/system/`

# Creación de un servicio

```systemd
[Unit]
Description=Datos IP
Wants=network-online.target
After=network-online.target
#Before=
[Service]
Type=simple
ExecStart=/usr/bin/curl -s https://ipinfo.io/
#ExecReload=
Restart=on-failure
RestartSec=10
[Install]
WantedBy=multi-user.target
#RequiredBy=
```

# Targets

| Nombre de la unidad de destino | Descripción                                                                                                                                  |
|--------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| halt                           | Apagar todos los servicios y detener el sistema                                                                                              |
| poweroff                       | Apagar todos los servicios y apagar el sistema                                                                                               |
| shutdown                       | Apagar el sistema normalmente                                                                                                                |
| rescue                         | Modo de usuario único (root) para funciones de mantenimiento y recuperación. Monta todos los sistemas de archivos pero no inicia servicios o funciones de red |

# Targets

| Nombre de la unidad de destino | Descripción                                                                                                                                  |
|--------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| multi-user                     | Modo de línea de comandos multiusuario para tareas regulares. Inicia todos los servicios esenciales y personalizados y proporciona el prompt CLI para iniciar sesión y trabajar |
| graphical                      | Igual que multi-user.target pero también incluye GUI. Un usuario puede usar el entorno de escritorio gráfico para iniciar sesión y trabajar o puede usar la interfaz de línea de comandos regular |
| reboot                         | Reiniciar el sistema normalmente                                                                                                             |
| default                        | Objetivo predeterminado para iniciar el sistema. Generalmente se establece en multi-user.target o graphical.target                           |


# Targets

| Nombre de la unidad de destino | Descripción                                                                                                                                  |
|--------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| emergency                      | Iniciar un shell de emergencia y montar solo el sistema de archivos raíz. Otros sistemas de archivos y la red permanecen deshabilitados       |
| hibernate                      | Guardar el estado en ejecución del sistema en el disco duro y apagar el sistema. Al encender el sistema nuevamente, systemd restaura el estado guardado |
| suspend                        | Igual que hibernate excepto que el estado del sistema se guarda en la memoria y la energía de la memoria no se apaga                         |

# Tipos

| Tipo de Servicio   | Descripción                                                                                       |
|--------------------|--------------------------------------------------------------------------------------------------|
| `simple`           | Inicia el servicio de manera simple. El proceso especificado en `ExecStart` es el principal.     |
| `forking`          | Inicia el servicio como un proceso en segundo plano. El proceso padre finaliza rápidamente y el proceso hijo continúa ejecutándose. |
| `oneshot`          | Se utiliza para tareas de corta duración que finalizan rápidamente. Ideal para tareas de inicialización o scripts de configuración. |
| `idle`             | El servicio se inicia solo después de que se hayan ejecutado todos los trabajos de inicialización activos. Es útil para tareas que no son críticas y que pueden esperar hasta que el sistema esté completamente operativo. |
| `exec`             | Similar a `simple`, pero se espera que el proceso principal ejecute otros procesos secundarios. |

# Creación de un timer

```systemd
[Unit]
Description=Datos IP timer

[Timer]
OnCalendar=*-*-* *:*:00
Persistent=true
#OnCalendar=weekly
#DayOfWeek Year-Month-Day Hour:Minute:Second
#OnCalendar=Mon,Tue *-*-01..04 12:00:00
#OnBootSec=15min
#OnUnitActiveSec=1w

[Install]
WantedBy=timers.target
```

# Comandos

```sh
# Reiniciar demonio
systemctl daemon-reload
# Imprimir información del servicio
systemctl status servicio
# Iniciar el servicio
systemctl start servicio
# Iniciar y habilitar el servicio
systemctl enable --now servicio
# Detener el servicio
systemctl stop servicio
# Deshabilitar el servicio
systemctl disable servicio
# Bitácora
journalctl -u servicio
```

# Servicios de usuario

Los archivos se guardan en `~/.config/systemd/user/`

```sh
sudo loginctl enable-linger username
```

Se agrega `--user` a los comandos de systemd

# Nginx

Es un servidor web de código abierto que también puede ser usado como proxy inverso, cache de http, balanceador de carga. Usado en muchas compañías.

[Mis notas](https://gitlab.com/ksobrenat32/notes/-/tree/main/web)

## Instalar

```sh
sudo apt install nginx
```

## Acceder

```sh
curl 127.0.0.1
```

# Nginx

## Actividad

Respecto al servicio de Nginx

- Cambia el contenido de la página default y revisa que se realizó el cambio
- Configura un directorio para mostrarlo como servidor de archivos por default
- Lee la bitácora de Nginx

# Blocky DNS

Un proxy de servidor DNS, ideal para el uso de bloqueadores de anuncios en una red local

## Pasos de instalación

1. Descargar código fuente
2. Colocar binario en `/usr/local/bin` con los permisos correctos
3. Crear usuario para el servicio `adduser --home /var/lib/blocky --system  --shell /sbin/nologin blocky`
4. Crear y levantar servicio `systemctl enable --now blocky.service`
5. Comprobar que funciona `dig @127.0.0.1 -p 5353 gnu.org`

## Fuente

https://github.com/0xERR0R/blocky
