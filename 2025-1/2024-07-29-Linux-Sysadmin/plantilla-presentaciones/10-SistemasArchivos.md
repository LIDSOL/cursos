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

Que el alumno entienda conceptos y propiedades de:

- Particiones, tipos de tabla y tipos de arranque
- Montado de sistemas y sus propiedades
- Sistemas de archivos, características
- RAID

# Particiones

![Particiones](./img/particiones.jpg)

# Arranque 

![Arranque](./img/mbr-gpt.png)

# Montado de sistema

Se encuentra en `/etc/fstab` actualmente la configuración la realiza systemd.

```fstab
# <file system>        <dir>         <type>    <options>             <dump> <pass>
/dev/sda1              /             ext4      defaults              1      1
/dev/hdxx              /usr          ext4      defaults              1      1
/dev/sda5              swap          swap      defaults              0      0
```

# Montado de sistema

La mayoría de las opciones tienen una negación con el prefijo no

## Opciones

- auto - file system will mount automatically at boot, or when the command 'mount -a' is issued.
- exec - allow the execution binaries that are on that partition (default).
- ro - mount the filesystem read only.
- rw - mount the filesystem read-write.
- sync - I/O should be done synchronously.
- flush - specific option for FAT to flush data more often, thus making copy dialogs or progress bars to stays up until things are on the disk.

# Montado de sistema

## Opciones

- user - permit any user to mount the filesystem (implies noexec,nosuid,nodev unless overridden).
- defaults - default mount settings (equivalent to rw,suid,dev,exec,auto,nouser,async).
- suid - allow the operation of suid, and sgid bits. They are mostly used to allow users on a computer system to execute binary executables with temporarily elevated privileges in order to perform a specific task.
- noatime - do not update inode access times on the filesystem. Can help performance.

# Sistemas de archivos

- ext4
- xfs
- btrfs
- zfs

# RAID