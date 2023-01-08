# Comunicacion UART entre dispositivos con distintos sistemas operativos

### 2do Proyecto Taller de circuitos empotrados
En este proyecto se utiliza el protocolo de comunicacion UART, con el cual se comunican los dispositivos:

  - PC (Ubuntu )
  - Raspberry pi 3 (Raspbian)
  - Microcontrolador de uso especifico (PIC18F4550)
  
De igual forma la recreacion del videojuego de 1973 "Space Race" es capaz de jugar en modo un jugador contra la computadora, la cual cuenta con un sistema basico de 
toma de desiciones variando de la ubicacion y direccion de los asteriodes que detecte en un area cercana a la nave.

En orden de correr el juego en Ubuntu o Raspbian, se deben seguir los siguientes pasos:
  1. Descargar el archivo correspondiente al sistema operativo en el que se va a correr.
 - [Ubuntu_Space_Race](https://github.com/Chaiinito/SpaceRace_tallerEmpotrados/tree/main/Ubuntu_Space_Race)
 - [Raspberry_Space_Race](https://github.com/Chaiinito/SpaceRace_tallerEmpotrados/tree/main/Raspberry_Space_Race)
  2. Abrir la terminal y ubicarse en el directorio que se descargó recientemente.
  3. Escribir los siguientes comandos:
      ### Para correr en raspbian
        - `gcc -o Rasp_Space_exe Rasp_Space.c` 
        - `./Rasp_Space_exe`
        
      ### Para correr en Ubuntu
        - `gcc -o Ubuntu_Space_exe Ubuntu_Space.c` 
        - `./Ubuntu_Space_exe` 
        
      ### Para correr en el PIC18F4550
        - Se debe descargar la carpeta [PIC_Space_Race](https://github.com/Chaiinito/SpaceRace_tallerEmpotrados/tree/main/PIC18F4550)
        - Cargar el archivo al PIC

Las conexiones alcanzadas son:
  - PIC18F4550 <-> Ubuntu
  - PIC18F4550 <-> Raspberry
  - Raspberry <-> Ubuntu
  - Ubuntu <-> Ubuntu
  - PIC18F4550 <-> PIC18F4550
  - Raspberry <-> Raspberry 

### UART communication between devices with different operating systems

### 2nd Project Embedded Circuits Workshop
This project uses the UART communication protocol, with which the devices communicate:

  - PC (Ubuntu)
  - Raspberry pi 3 (Raspbian)
  - Microcontroller of specific use (PIC18F4550)
  
Likewise, the recreation of the 1973 video game "Space Race" is able to play in single player mode against the computer, which has a basic system of 
The computer has a basic decision making system varying from the location and direction of the asteriods it detects in an area near the spacecraft.

In order to run the game on Ubuntu or Raspbian, the following steps must be followed:
  1. Download the file corresponding to the operating system you are going to run it on.
 - [Ubuntu_Space_Race](https://github.com/Chaiinito/SpaceRace_tallerEmpotrados/tree/main/Ubuntu_Space_Race)
 - [Raspberry_Space_Race](https://github.com/Chaiinito/SpaceRace_tallerEmpotrados/tree/main/Raspberry_Space_Race)
  2. Open the terminal and locate in the directory that was recently downloaded.
  3. Type the following commands:
      ### To run on raspbian
        - `gcc -o Rasp_Space_exe Rasp_Space.c` 
        - `./Rasp_Space_exe`.
        
      ### To run on Ubuntu
        - `gcc -o Ubuntu_Space_exe Ubuntu_Space.c` 
        - `./Ubuntu_Space_exe` 
        
      ### To run on the PIC18F4550
        - Download the [PIC_Space_Race](https://github.com/Chaiinito/SpaceRace_tallerEmpotrados/tree/main/PIC18F4550) folder.
        - Upload the file to the PIC

The connections reached are:
  - PIC18F4550 <-> Ubuntu
  - PIC18F4550 <-> Raspberry
  - Raspberry <-> Ubuntu
  - Ubuntu <-> Ubuntu
  - PIC18F4550 <-> PIC18F4550
  - Raspberry <-> Raspberry 


