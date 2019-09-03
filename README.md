# ArchLinux_Bash
script para instalar Arch Linux

## Pre instalación

* Descargar [ArchLinux](https://www.archlinux.org/download/) y montar en una unidad USB con rufus o programas similares

* Clonar repositorio

```sh
$ git clone https://github.com/javierdarksoul/ArchLinux_Bash.git
```
* Abrir "config.sh" con un editor de texto y completar los campos:
  * **NOMBRDOM**: corresponde al nombre del dominio, usuario@dominio
  * **USERNAME**: corresponde al nombre del usuario.
  * **PASS**: corresponde a la contraseña del usuario y de root.
  * **ZONA**: Zona horaria de tu localización, predefinida para Chile.
  * **Key**: Corresponde al idioma del teclado, predefinido para español latinoamérica. 
  
* Copiar en la raiz del dispositivo USB los 4 archivos bash descargados del repositorio.

## Instalación

* Una vez arrancado arch desde el dispositivo USB, escribir el siguiente comando

```sh
 $ sh /run/arch/bootmgr/paso1.sh
```
* se abrira una ventana de wifi-menu, conectese a la red wi-fi preferida.
