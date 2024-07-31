---
lang: "es"
title: ""
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

Aproximadamente 180 minutos de clase.

## Objetivos

El objetivo general es que los alumnos sean capaces de entender la red en la que
trabajan así como sun configuración básica. Además, aprenderá a habilitar y
configurar un *firewall* para regular el tránsito de paquetes entrante y
saliente de la máquina que administran.

# Redes de computadoras

Se trata de un conjunto de computadoras que están conectadas entre sí por medio
de algún medio y que comparten recursos entre sí.

¿Cómo se comparten los recursos?

# Topologías de Red

![Algunas topologías de red](img/topologias.png)

# .

A cada una de las computadoras dentro de una red se les llama *host*. En una red
local típica, uno de los hosts de una red local es el *router*, que se encarga
de conectar la red local de computadoras con una red más grande (internet).

# Una LAN típica

![lan](img/lan.png)

# Paquetes

Los datos que transfiere una computadora en la red se envían a través de
paquetes. Un paquete contiene un *header* y *payload*. El primero indica cosas
como el destino y origen del paquete. El *payload* contiene la información como
tal.

Cualquier host puede recibir y enviar paquetes en el orden que sea, sin importar
de donde vengan o vayan.

# *Layers*

Una red incluye distintas capas que conforman un *stack*. Toda red funcional
tiene un *stack*:

- *Applicacion layer*: Protocolos de las aplicaciones que se conectan (HTTP).
- *Transport layer*: Define características de la transmisión de datos. (TCP,
  UDP).
- *Network layer*: Define la ruta de movimiento de los paquetes. (IP).
- *Physcal layer*: Referente al hardware y cómo los datos viajan en él
  (Ethernet, WiFi).

Todos los datos viajan en sube y baja completamente por lo menos una vez en el
*stack* para enviar un paquete a través de la red.

# IPv4

En la capa de red está protocolo IP, donde se tiene el concepto de direcciones
IP.

Estas direcciones nos permiten reconocer a cada uno de los hosts dentro de la
red.

Cada host tiene por lo menos una dirección IP, que le permite conectarse a otras
computadoras y saber dónde están. Funciona como una dirección real.

Estas direcciones están compuestas por 4 bytes. Por ejemplo:

10.24.2.57

# Viendo la dirección IP

```
ip a
```
