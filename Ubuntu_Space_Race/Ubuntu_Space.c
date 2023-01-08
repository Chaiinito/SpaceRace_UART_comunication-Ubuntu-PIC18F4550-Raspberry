//gcc -o Proyecto2 ubuntoSpace_test_16_10_22.c -lncurses
// ./Proyecto2

//Librerias de C
#include <stdio.h>
#include <string.h>
#include <ncurses.h>
#include <stdlib.h>


//Librerias de linux
#include <fcntl.h> // contiene archivos de control como like O_RDWR
#include <errno.h> // contiene la funcion strerror()
#include <termios.h> //Contiene la terminal POSIX 
#include <unistd.h> // write(), read(), close()

//################################################################
//Estrucuras
typedef struct debris{
	signed short x; //loc. en x
	signed short y; //loc. en y
	signed short dx;
    unsigned short dir;

}escombro;
//Se define la estructura para la bala

typedef struct players{
	unsigned short x; //loc. en x
	unsigned short y; //loc. en y
	unsigned short w; //Ancho
	unsigned short h; //Largo
}ships;

typedef struct windows_border{
	chtype leftside,rightside,topside,bottomside,topleft,topright,bottomleft,bottomright;

}window_BORDER; //Esto es para limitar los bordes de las pantalla

typedef struct windows{
	int initx, inity;
	int height, width;
	window_BORDER border;
}window; 
//Esto es para la ventana

//################################################################

// Variables globales
ships ship[2];
escombro debris[14];

ships old_ship[2];
escombro old_debris[14];

int ch;
int lineTime = 1;
int intervencion = 0;
unsigned short score[]={0,0};
unsigned short flag = 0;
unsigned short seconds = 0;
unsigned short minutes = 64;
unsigned short centerShip = 0;
unsigned short areaX = 0;
unsigned short areaY = 0;
unsigned short Master = 0;
unsigned short esclavo_go = 0;

char info[8];
char info1[5];
char gameover[1];

unsigned short turno= 0;
unsigned short turno_player = 0;
unsigned short debris_turn = 0;
unsigned short turn2 = 0;


//#################################################################
//Inicializacion de funciones
void init_window_p(window *pointer_window);
void create_box(window *pointer_window);
void init();
void gen_debris();
void portada_selec(unsigned short c, unsigned short mode);
void move_ship(unsigned short i, unsigned short direction);
void move_ship1(unsigned short i, unsigned short direction);
void draw_ship(unsigned short x, unsigned short y, unsigned short color);
int mapping(int y);
void move_ia();
void move_debris();
void move_debris_mult();
void move_debris_mult1();
void game_over(unsigned short p);
void draw_time();
void draw_score ();
void data_pack();
void desdata_pack();
//void coordinate_pos();
//void pos_coordinate();
void save_old_data();
void configuracion(int serial_port1, int vmin, int vtime);
void input_data(char *text_dir);
void portada();
void move_ship2(unsigned short i, unsigned short direction);
//#################################################################

int main(){

	initscr();
	start_color();
	cbreak();
	keypad(stdscr, TRUE);
	
	init_pair(0, COLOR_BLACK, COLOR_BLACK);
	init_pair(1, COLOR_WHITE, COLOR_BLACK);
	init_pair(2, COLOR_CYAN, COLOR_BLACK);
	init_pair(3, COLOR_CYAN, COLOR_WHITE);
	init_pair(4, COLOR_BLUE, COLOR_WHITE);
	init_pair(5, COLOR_BLUE, COLOR_BLACK);

	window win;
	int ch;
	
	init_window_p(&win);
	keypad(stdscr, TRUE);
	noecho();    // No mostrar en terminal la tecla utilizada
	curs_set(0); // Ocultar cursor
	timeout(0);  // Sin bloqueo en espera de entradas
	
	int fd;
	int n = 0;
	char dato[1];
	
	int counter = 0;
	int counter2 = 0;
	
	while(1){
		switch(flag){
			case 0:
				fd = open("/dev/ttyUSB0", O_RDWR);
				

				if (fd < 0){
					mvprintw(45, 0, "Error %i from open: %s\n", errno, strerror(errno));
				}
				
				portada();
				portada_selec(2, 0);
				create_box(&win);
				refresh();
				//portada();
				
				while(1){
					ch = getch();
					if(ch == 49){//SINGLEship
					    portada_selec(3,1);
						mvprintw(1,30,"PRESS SPACE TO START OR PRESS 2 TO MULTIPLAYER");
						while(1){
							ch = getch();
							if(ch == 32){
								flag = 1;
								refresh();
								sleep(2);
								clear();
								break;
							}
							else if(ch == 50){
								break;
							}
						}
					}
					if(ch == 50){//MULTIship
					    portada_selec(3,2);
						while(1){
							ch = getch();
							mvprintw(1,30,"PRESS SPACE TO START OR PRESS 1 TO SINGLEPLAYER");
							if(ch == 32){
								flag = 2;
								refresh();
								sleep(2);
								clear();
								break;
							}
							else if(ch == 49){
								break;
							}
						}
					}
					if(flag == 1 || flag == 2){
						break;
					}
					
				}
				break;
			
			case 1:
				init();
				gen_debris();
				int timeCount = 0;
				create_box(&win);
				//ready();
				
				draw_ship(ship[0].x, ship[0].y, 1);
				draw_ship(ship[1].x, ship[1].y, 1);
				
				draw_time();
				refresh(); 
				
				while(1){
					ch = getch();
					if(debris_turn > 8000){
						debris_turn = 0;
					}
					if(turno > 10000){
						turno = 0;
					}
					if(turn2 > 10000){
						turn2 = 0;
					}
					if(turno_player > 8000){
							turno_player = 0;
					}
                            
					if(timeCount > 100000){
						mvaddch(lineTime, 64,' ');
						timeCount = 0;
						lineTime += 1;
					}
					if(ch == KEY_DOWN){//HACIA ABAJO
						draw_ship(ship[0].x, ship[0].y, 0);
						move_ship1(0,2);//move_ship(i, direction) 1 arriba / 2 abajo
						draw_ship(ship[0].x, ship[0].y, 1);//draw_ship(x, y, color)
					}
					else if(ch == KEY_UP){//HACIA ARRIBA    
						draw_ship(ship[0].x, ship[0].y, 0);
						move_ship1(0,1);//move_ship(i, direction) 1 arriba / 2 abajo
						draw_ship(ship[0].x, ship[0].y, 1);//draw_ship(x, y, color)
					}
					
					move_ia();
					//mvprintw(16,70, "LocY: %i", ship[1].y);
					draw_ship(ship[1].x, ship[1].y, 1);
					move_debris();
					draw_time();
					draw_score ();
					
					if(lineTime == 33){
						seconds = 0;
						game_over(1);
						flag = 0;
						break;
					}
					seconds ++;
					debris_turn ++;
					turno ++;
					turn2 ++;
					timeCount++;
					turno_player++;
				}
				break;
				
			case 2:
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
				fd = open("/dev/ttyUSB0", O_RDWR);

				if (fd < 0){
					mvprintw(45, 0, "Error %i from open: %s\n", errno, strerror(errno));
				}
				
				int timeCount1 = 0;			      
				init();

				///MASTER/SLAVE
				memset(&dato, '\0', sizeof(dato));
				memset(&info, '\0', sizeof(info));//Donde recibe info desdatapack

				configuracion(fd, 0, 1);
				n = read(fd, &dato, sizeof(dato));
				
				char msj[] = {'1'};
				write(fd, msj, sizeof(msj));
				
				if(n == 0){
					
                        		mvaddstr(16, 50, "Waiting for other player");
				}
				else if (n!= 0 && dato[0] == '1'){
					
					mvaddstr(16, 50, "Device connected. Press space to start");
					while(1){
						ch = getch();
						read (fd, &dato, sizeof(dato));
						//mvprintw(20, 0, "Read %i bytes. Received message: %s\n", n, dato);
						if(ch == 32){
							Master = 1;
							char msj[] = {'3'};
							write(fd, msj, sizeof(msj));
							mvaddstr(16, 50, "MASTER");
							sleep(4);
							refresh();
							clear();
							break;
						}
						if(dato[0] == '3'){
							Master = 2;
							mvaddstr(16, 50, "SLAVE");
							sleep(4);
							refresh();
							clear();
							break;
						}
					}
				}
				
				
				lineTime = 0;


			  	//mvprintw(45, 0, "Read %i bytes. Received message: %s\n", n, dato);
			  	/////////////////////////////////////////

			  	refresh();
			  	clear();
				
				
			  	if(Master== 1){ // PARA MAESTRO 
					init();
					gen_debris();
					create_box(&win);
				
					draw_ship(ship[0].x, ship[0].y, 1);
					draw_ship(ship[1].x, ship[1].y, 1);
				
					draw_time();

					refresh();
			  		while(1){
			  			sleep(1);
						if(timeCount1 > 10){
							mvaddch(lineTime, 64,' ');
							timeCount1= 0;
							lineTime += 1;
						}
						if(turno_player > 8000){
							turno_player = 0;
						}
						if(debris_turn > 6000){
						debris_turn = 0;
						}

						ch = getch(); 
						if(ch == KEY_DOWN){//HACIA ABAJO
							//printf("Porque no va pa abajo");
							//getchar();
							draw_ship(ship[0].x, ship[0].y, 0);
							move_ship2(0,2);//move_ship(i, direction) 1 arriba / 2 abajo
							draw_ship(ship[0].x, ship[0].y, 1);//draw_ship(x, y, color)
						}
						else if(ch == KEY_UP){//HACIA ARRIBA
							//printf("Porque no va pa arriba");
							//getchar();    
							draw_ship(ship[0].x, ship[0].y, 0);
							move_ship2(0,1);//move_ship(i, direction) 1 arriba / 2 abajo
							draw_ship(ship[0].x, ship[0].y, 1);//draw_ship(x, y, color)
						}

	
						
						//printf("ANtes del while");
						//getchar();
						//while(n == 0);
						//printf("Después del while");
						//getchar();
							
						//sleep(0.05);
						// recibimos lo que envia el esclavo //
						configuracion(fd, 1, 0);
						//sleep(0.2);
						n = read(fd, &dato, sizeof(dato));
						printf("Dato: %c", dato[0]);
						//getchar();
						if(dato[0] == '2'){
							draw_ship(ship[1].x, ship[1].y, 0);
							//printf("Entrando move ship 1");
							move_ship2(1,2);//move_ship(i, direction) 1 arriba / 2 abajo
							//printf("Sali de move ship");
							draw_ship(ship[0].x, ship[0].y, 1);//draw_ship(x, y, color)
							//printf("KEY DOWN DETECTED intervencion 2");
						}
						else if(dato[0] == '1'){
							//printf("Entrando move ship 1");
							draw_ship(ship[1].x, ship[1].y, 0);
							//printf("Sali de move ship 1");
							move_ship2(1,1);//move_ship(i, direction) 1 arriba / 2 abajo
							//printf("Sali de move ship 1");
							draw_ship(ship[1].x, ship[1].y, 1);//draw_ship(x, y, color) 
							//printf("KEY UP DETECTED intervencion 2");
						}

						//////////////////////////////////////
						
						//sleep(1);
						data_pack();
						write(fd, info1, sizeof(info1));
						
						move_debris_mult();
						draw_time();
						draw_score();

                       			
                       			//ENVIAR DATOS AL ESCLAVO
                        			
						if(lineTime == 33){
							char msj[] = {'9'};
							write(fd, msj, sizeof(msj));
							seconds = 0;
							game_over(2);
							flag = 0;
							break;
						}
						seconds ++;
						timeCount1 ++;
						turno_player ++;
						debris_turn ++;
						refresh();

			  		}

			  	}

			  	if (Master == 2){  //PARA ESCLAVO

			  		create_box(&win);
			  		draw_ship(ship[0].x, ship[0].y, 1);
					draw_ship(ship[1].x, ship[1].y, 1);
			  		draw_time();
			  		gen_debris();
			  		move_debris_mult();
			  		//printf("yei");
			  		while (1){

						if(timeCount1 > 100000){
							mvaddch(lineTime, 64,' ');
							timeCount1 = 0;
							lineTime += 1;
						}

			  			ch = getch();
						if(ch == KEY_UP){
							char msj[] = {'2'};
							write(fd, msj, sizeof(msj));
							//printf("Move up send");
						}
						else if(ch == KEY_DOWN){
							char msj[] = {'1'};
							write(fd, msj, sizeof(msj));
							//printf( "Move down send");							
						}
						else{
							char msj[] = {'0'};
							write(fd, msj, sizeof(msj));
							//printf("No move send");
							
						}

						move_debris_mult();
					
						configuracion(fd, 5, 0);
						n = read(fd, &info, sizeof(info)); // Espera a que reciba los 2 bytes
					
						draw_ship(ship[0].x, ship[0].y, 0);
						draw_ship(ship[1].x, ship[1].y, 0);
						desdata_pack();
						
						
						draw_ship(ship[0].x, ship[0].y, 1);
						draw_ship(ship[1].x, ship[1].y, 1);
						draw_score ();
						draw_time();
						
						if(gameover[0] == '9'){
							refresh();
							game_over(2);
							flag = 0;
							break;
						}
						debris_turn ++;
						timeCount1 ++;
					}
			  	}
				close(fd);
				break;
		}
	}
	endwin();
	return(0);
};

void portada(){
	attron(COLOR_PAIR(5));
	mvaddstr(2, 50, "@@@@@  @@@@@    @@@@   @@@@@  @@@@@");
	mvaddstr(3, 50, "@@     @@  @@  @@  @@  @@     @@   ");
	mvaddstr(4, 50, "@@@@@  @@@@@   @@@@@@  @@     @@@  ");
	mvaddstr(5, 50, "   @@  @@      @@  @@  @@     @@   ");
	mvaddstr(6, 50, "@@@@@  @@      @@  @@  @@@@@  @@@@@");

	mvaddstr(8,  52, "   @@@@@    @@@@   @@@@@  @@@@@");
	mvaddstr(9,  52, "   @@  @@  @@  @@  @@     @@   ");
	mvaddstr(10, 52, "   @@@@@   @@@@@@  @@     @@@  ");
	mvaddstr(11, 52, "   @@ @@   @@  @@  @@     @@   ");
	mvaddstr(12, 52, "   @@  @@  @@  @@  @@@@@  @@@@@");

	mvaddstr(20, 45, "Genesis Mendez");
	mvaddstr(22, 45, "Gabriel Rodriguez");
	mvaddstr(24, 45, "Nicolas Alfaro");
	mvaddstr(26, 45, "Prof. Ernesto Rivera");
	mvaddstr(28, 45, "Taller de Sistemas Embebidos");

	attroff(COLOR_PAIR(5)); //Modificar esto porque sale amarillo
}

void configuracion(int serial_port1, int vmin, int vtime){


	// Configuracion del puerto se realiza a traves de termios//
	struct termios tty;
	if(tcgetattr(serial_port1, &tty) != 0){  // Para extraer configuraccion del puerto seria actual y guardar en struct tty 
		printf("Serial port: %i", serial_port1);
		printf("Error %i from tcgetattr: %s\n", errno, strerror(errno));
		//puts("Nel mija");
		getchar();
	}			

	// CONFIG DE BAUDIOS //
	cfsetispeed(&tty, B9600);
	cfsetospeed(&tty, B9600);


	// MODOS DE CONTROL //
	tty.c_cflag &= ~PARENB; // deshabilita el bit de paridad;
	tty.c_cflag &= ~CSTOPB; // Borra bit de parada y Establece unicamente un bit de parada
	tty.c_cflag &= ~CSIZE;  // Limpia todos los bits de tamano
	tty.c_cflag |= CS8;		// Establece una comunicacion de 8 bits por Byte
	tty.c_cflag &= ~CRTSCTS; // Deshabilita el control de flujo por hardware
	tty.c_cflag |= CREAD | CLOCAL; // Enciende READ e ignora las lineas de control

	// MODOS LOCALES //
	tty.c_lflag &= ~ICANON; // Deshabilita el modo canonico (Que es que la entrada se procesa cuando se recibe char de nueva linea)
	tty.c_lflag &= ~ECHO;   // Desahabilita el eco
	tty.c_lflag &= ~ECHOE;
	tty.c_lflag &= ~ECHONL;
	tty.c_lflag &= ~ISIG;   // Deshabilitar caracter de senal

	// MODOS DE ENTRADA //
	tty.c_iflag &= ~(IXON | IXOFF | IXANY); //Deshabilita el control de flujo por software
	tty.c_iflag &= ~(IGNBRK | BRKINT | PARMRK | ISTRIP | INLCR | IGNCR | ICRNL); //Deshabilita el manejo especial de bytes

	//MODOS DE SALIDA //
	tty.c_oflag &= ~OPOST; //Desactiva el porcesamiento especial lde bytes de salida
	tty.c_oflag &= ~ONLCR;

	// Configuracion de bloqueos y esperas de lecturas //
	tty.c_cc[VTIME] = vtime; 
	tty.c_cc[VMIN] = vmin;

	// CAMBIAR ESTO POR VMIN>0 Y VTIME = 0 //
	/*Lo anterior para hacer que read espere a tener la cantidad de bytes especificados por 
	  VMIN, sin tiempo de espera */

	if(tcsetattr(serial_port1, TCSANOW, &tty) != 0 ){
		printf("Error %i from tcsetattr: %s\n", errno, strerror(errno));
		//puts("Nel mija 2");
		getchar();
	}
}
void init_window_p(window *pointer_window){
    pointer_window->height = 33;
    pointer_window->width = 129;
    pointer_window->inity = 0;  
    pointer_window->initx = 0;

    pointer_window->border.leftside = '|';
    pointer_window->border.rightside = '|';
    pointer_window->border.topside = '-';
    pointer_window->border.bottomside = '-';
    pointer_window->border.topleft = '*';
    pointer_window->border.topright = '*';
    pointer_window->border.bottomleft = '*';
    pointer_window->border.bottomright = '*';
} //Inicializa la ventana tamaño, y limites

void create_box(window *pointer_window){   
    int x, y, w, h;

    x = pointer_window->initx;
    y = pointer_window->inity;
    w = pointer_window->width;
    h = pointer_window->height;

    mvaddch(y, x, pointer_window->border.topleft);
    mvaddch(y, x + w, pointer_window->border.topright);
    mvaddch(y + h, x, pointer_window->border.bottomleft);
    mvaddch(y + h, x + w, pointer_window->border.bottomright);
    mvhline(y, x + 1, pointer_window->border.topside, w - 1);
    mvhline(y + h, x + 1, pointer_window->border.bottomside, w - 1);
    mvvline(y + 1, x, pointer_window->border.leftside, h - 1);
    mvvline(y + 1, x + w, pointer_window->border.rightside, h - 1);
                
    refresh();
}

/*
void coordinate_pos(){
    unsigned short i = 0;
    unsigned short pos_y = 0;
    unsigned short pos_x = 0;
    
    for(i = 0; i < 15; i++){
            pos_y = debris[i].y * 127;
            pos_x = debris[i].x;
            if (debris[i].y == 0){
                    debris[i].pos = debris[i].x;
            }
            else if(debris[i].y != 0){
                    debris[i].pos = pos_y + pos_x + 1;
            }
    }
}

void pos_coordinate(){
    unsigned short i = 0;
    unsigned short j = 0;
    
    for(i = 0; i < 15; i++){
        debris[i].y = debris[i].pos / 127;
        debris[i].x = abs(debris[i].y * 127 - debris[i].pos) -1 ;//abs(debris[i].y * 127 - debris[i].pos));
    }
}*/

void data_pack() {  //Funcion para empaquetar datos a enviar //Hay que ver como hago para enviar la ubicacion en y de cada escombroe
    info1[0] = (64*ship[0].y/32)-1 + '0';
    info1[1] = (64*ship[1].y/32)-1 + '0';
    info1[2] = score[0] + '0';
    info1[3] = score[1] + '0';
    info1[4]='P';         
}

void desdata_pack(){   // Funcion para extraer datos del paquete recibido por esclavo
    ship[0].y   =   mapping(info[0] - '0') +1;
    ship[1].y   =   mapping(info[1] - '0') +1;
    score[0]    =   info[2] - '0';
    score[1]    =   info[3] - '0';
}

void portada_selec(unsigned short color, unsigned short modo){
	if(modo == 1){
		attron(COLOR_PAIR(color));
		mvaddstr(16 ,45, "ONE ship (PRESS 1)");
		attroff(COLOR_PAIR(color));
	}
	else if(modo == 2){
		attron(COLOR_PAIR(color));
		mvaddstr(16 ,70, "TWO shipS (PRESS 2)");
		attroff(COLOR_PAIR(color));
	}
	else {
		attron(COLOR_PAIR(color));
		mvaddstr(16 ,45, "ONE ship (PRESS 1)");
		mvaddstr(16 ,70, "TWO shipS (PRESS 2)");
		attroff(COLOR_PAIR(color));
	}
}

void init(){
	
    ship[0].x = 40;
    ship[0].y = mapping(59) + 1;

    ship[1].x = 70;
    ship[1].y = mapping(59) + 1; //Para que la posicion inicia sea igual que en pic
	
	score[0] = 0;
	score[1] = 0;
}

/*void save_old_data(){
    unsigned short i = 0;
    old_ship[0].y = ship[0].y;
    old_ship[1].y = ship[1].y;
    for(i = 0; i < 15; i++){
        old_debris[i].x = debris[i].x;
        old_debris[i].y = debris[i].y;
        old_debris[i].dx = debris[i].dx;
        old_debris[i].dir = debris[i].dir;
    }
}*/

void gen_debris(){
	debris[0].y = mapping(2);
	debris[0].x = 2;
	debris[0].dir = 0;
	debris[1].y = mapping(4);
	debris[1].x = 34;
	debris[1].dir = 1;
	debris[2].y = mapping(50);
	debris[2].x = 50;
	debris[2].dir = 0;
	debris[3].y = mapping(16);
	debris[3].x = 87;
	debris[3].dir = 0;
	debris[4].y = mapping(34);
	debris[4].x = 30;
	debris[4].dir = 1;
	debris[5].y = mapping(12);
	debris[5].x = 120;
	debris[5].dir = 0;
	debris[6].y = mapping(24);
	debris[6].x = 95;
	debris[6].dir = 1;
	debris[7].y = mapping(20);
	debris[7].x = 67;
	debris[7].dir = 1;
	debris[8].y = mapping(30);
	debris[8].x = 93;
	debris[8].dir = 1;
	debris[9].y = mapping(28);
	debris[9].x = 82;
	debris[9].dir = 0;
	debris[10].y = mapping(38);
	debris[10].x = 67;
	debris[10].dir = 1;
	debris[11].y = mapping(42);
	debris[11].x =5;
	debris[11].dir = 0;
	debris[12].y = mapping(46);
	debris[12].x = 10;
	debris[12].dir = 1;
	debris[13].y = mapping(8);
	debris[13].x = 76;
	debris[13].dir = 0;
	debris[14].y = mapping(54);
	debris[14].x = 20;
	debris[14].dir = 1;
}

void draw_time(){
    unsigned short i = lineTime;
    for(i ; i< mapping(64) ; i++){
        mvaddch(i, 64,'|');
    }
}

int mapping(int y){
	int local_y;
	local_y = (32*y)/64;
	return local_y;
}

void move_ship(unsigned short i, unsigned short direction){
    if(turno == 10000){
		//mvprintw(10,100, "jugador: %i", i);
        if(direction == 2){//hacia abajo
            if(ship[i].y >= mapping(57)+ 1){
                ship[i].y = mapping(57) + 1;
            }
            else{
                ship[i].y += 1;
			}
        }
        else if(direction == 1){//hacia arriba
			if(ship[i].y <= mapping(2)+1){
				score[i] += 1;
			
				if(i == 0){
					ship[0].x = 40;
					ship[0].y = mapping(57)+1;
				}
				if(i == 1){
					ship[1].x = 70;
					ship[1].y = mapping(57)+1;
				}
			}
			else{
				ship[i].y -= 2;
			}
        }
    }
}

void draw_score (){

	for (int i=0 ; i<=2; i++){
		if(i == 0){
			mvprintw(1,30, "%i", score[i]);
		}	
		if(i == 1){
			mvprintw(1,90, "%i", score[i]);
		}
	}
}

void draw_ship(unsigned short x, unsigned short y,unsigned short color){
	if (color == 1){
		attron(COLOR_PAIR(1));
		mvaddch(y, x+2, 'X');
		mvaddch(y+1, x+2, 'X');
		mvaddch(y+2, x+4, 'X');
		mvaddch(y+2, x, 'X');
		attroff(COLOR_PAIR(1));
	}
	if(color == 0){
		mvaddch(y, x+2, ' ');
		mvaddch(y+1, x+2, ' ');
		mvaddch(y+2, x+4, ' ');
		mvaddch(y+2, x, ' ');
	}
	
}

void move_ship1(unsigned short i, unsigned short direction){
	if(turno_player > 4000){
		//printf("Entre a move ship");
		//getchar();
		if(direction == 2){//hacia abajo
			if(ship[i].y >= mapping(57)+ 1){
				ship[i].y = mapping(57) + 1;
			}
			else{
				ship[i].y += 1;
			}
		}
		else if(direction == 1){//hacia arriba
			if(ship[i].y <= mapping(2)+1){
				score[i] += 1;
				if(i == 0){
					ship[i].x = 40;
					ship[i].y = mapping(57)+1;
				}
				if(i == 1){
					ship[i].x = 70;
					ship[i].y = mapping(57)+1;
				}
			}
			else{
				ship[i].y -= 2;
			}
		}
	}
}

void move_ship2(unsigned short i, unsigned short direction){

		//printf("Entre a move ship");
		if(direction == 2){//hacia abajo
			if(ship[i].y >= mapping(57)+ 1){
				ship[i].y = mapping(57) + 1;
			}
			else{
				ship[i].y += 1;
			}
		}
		else if(direction == 1){//hacia arriba
			if(ship[i].y <= mapping(2)+1){
				score[i] += 1;
				if(i == 0){
					ship[i].x = 40;
					ship[i].y = mapping(57)+1;
				}
				if(i == 1){
					ship[i].x = 70;
					ship[i].y = mapping(57)+1;
				}
			}
			else{
				ship[i].y -= 2;
			}
		}
}


void move_debris(){
    unsigned short i; //variable para la colision
    unsigned short j;//variable para controlar los escombroes

    if(debris_turn == 8000){

            for(j = 0; j <= 14; j++){
                    if(debris[j].dir == 1){//escombroe moviendose de derecha a izquierda   <-
                    	mvaddch(debris[j].y, debris[j].x, ' ');
			debris[j].x -= 2;
			mvaddch(debris[j].y, debris[j].x, '*');
				
				if(debris[j].x <= 0){
					mvaddch(debris[j].y, debris[j].x, ' ');
                                	debris[j].x = 128;
                            	}
                    }
                    else if(debris[j].dir == 0){//escombroe moviendose de izquierda a derecha -->
                    	mvaddch(debris[j].y, debris[j].x, ' ');
			debris[j].x += 2;
			mvaddch(debris[j].y, debris[j].x, '*');
                       if(debris[j].x >= 128){
				mvaddch(debris[j].y, debris[j].x, ' ');
                               debris[j].x = 0;
                            } 
                    }
                    
                    //Si un asteriode choca con una nave
                    for(i = 0; i < 2; i++){
                            if((debris[j].y >= ship[i].y) && (debris[j].y <= ship[i].y + 3) && (debris[j].x >= ship[i].x) && (debris[j].x <= ship[i].x + 3)){
                                    draw_ship(ship[i].x, ship[i].y,0);
									
                                    if(i == 0){
                                            ship[i].x = 40;
                                            ship[i].y = mapping(59)+1;
                                    }
                                    else if(i == 1){
                                            ship[i].x = 70;
                                            ship[i].y = mapping(59)+1;
                                    }
                                   draw_ship(ship[i].x, ship[i].y,1);
                            }
                    }
            }
	}     
}

void move_debris_mult(){
    unsigned short i; //variable para la colision
    unsigned short j;//variable para controlar los escombroes
    
                for(j = 0; j <= 14; j++){
                    if(debris[j].dir == 1){//escombroe moviendose de derecha a izquierda   <-
                    	mvaddch(debris[j].y, debris[j].x, ' ');
			debris[j].x -= 2;
			mvaddch(debris[j].y, debris[j].x, '*');
				
				if(debris[j].x <= 0){
					mvaddch(debris[j].y, debris[j].x, ' ');
                                	debris[j].x = 128;
                            	}
                    }
                    else if(debris[j].dir == 0){//escombroe moviendose de izquierda a derecha -->
                    	mvaddch(debris[j].y, debris[j].x, ' ');
			debris[j].x += 2;
			mvaddch(debris[j].y, debris[j].x, '*');
                       if(debris[j].x >= 128){
				mvaddch(debris[j].y, debris[j].x, ' ');
                               debris[j].x = 0;
                            } 
                    }
                    
                    //Si un asteriode choca con una nave
                    for(i = 0; i < 2; i++){
                            if((debris[j].y >= ship[i].y) && (debris[j].y <= ship[i].y + 3) && (debris[j].x >= ship[i].x) && (debris[j].x <= ship[i].x + 3)){
                                    draw_ship(ship[i].x, ship[i].y,0);
									
                                    if(i == 0){
                                            ship[i].x = 40;
                                            ship[i].y = mapping(59)+1;
                                    }
                                    else if(i == 1){
                                            ship[i].x = 70;
                                            ship[i].y = mapping(59)+1;
                                    }
                                   draw_ship(ship[i].x, ship[i].y,1);
                            }
                    }
            }
           
           
}

void move_debris_mult1(){
    unsigned short i; //variable para la colision
    unsigned short j;//variable para controlar los escombroes
    if(debris_turn >= 4000){
                for(j = 0; j <= 14; j++){
                    if(debris[j].dir == 1){//escombroe moviendose de derecha a izquierda   <-
                    	mvaddch(debris[j].y, debris[j].x, ' ');
			debris[j].x -= 2;
			mvaddch(debris[j].y, debris[j].x, '*');
				
				if(debris[j].x <= 0){
					mvaddch(debris[j].y, debris[j].x, ' ');
                                	debris[j].x = 128;
                            	}
                    }
                    else if(debris[j].dir == 0){//escombroe moviendose de izquierda a derecha -->
                    	mvaddch(debris[j].y, debris[j].x, ' ');
			debris[j].x += 2;
			mvaddch(debris[j].y, debris[j].x, '*');
                       if(debris[j].x >= 128){
				mvaddch(debris[j].y, debris[j].x, ' ');
                               debris[j].x = 0;
                            } 
                    }
                    
                    //Si un asteriode choca con una nave
                    for(i = 0; i < 2; i++){
                            if((debris[j].y >= ship[i].y) && (debris[j].y <= ship[i].y + 3) && (debris[j].x >= ship[i].x) && (debris[j].x <= ship[i].x + 3)){
                                    draw_ship(ship[i].x, ship[i].y,0);
									
                                    if(i == 0){
                                            ship[i].x = 40;
                                            ship[i].y = mapping(59)+1;
                                    }
                                    else if(i == 1){
                                            ship[i].x = 70;
                                            ship[i].y = mapping(59)+1;
                                    }
                                   draw_ship(ship[i].x, ship[i].y,1);
                            }
                    }
            }
            }
           
}

void move_ia(){
    unsigned short j;
    unsigned short p;
    unsigned short q;
    areaX = ship[1].x;
    areaY = ship[1].y;
    centerShip = ship[1].y;

    //La IA va a tener un rango en los que percibe los escombroes
    //Si detecta un escombroe entrar, if(escombroe.x >= rango)
    //va a ver que pos en y tiene, si esta es arriba de cierto punto va a esperar o a retroceder
    //si es menor que este punto va a moverse hacia adelante, tener en cuenta que debe tender a
    //moverse hacia adelante para que pueda ganar
    //for(q = 0; q <= 5; q++){
    if(turn2 == 10000){
             draw_ship(ship[1].x, ship[1].y, 0);
             move_ship(1,1);
             draw_ship(ship[1].x, ship[1].y, 1);
    }
    if(turno == 10000){

        areaX = areaX - 10;
        areaY = areaY - 4;
        for (j = 0; j <= 14; j++){
            if((debris[j].x >= areaX) && (debris[j].x <= ship[1].x + 10)){
                if((debris[j].y >= areaY) && (debris[j].y <= ship[1].y + 6)){
                    if(debris[j].y <= centerShip){
                        //mover hacia arriba
                        draw_ship(ship[1].x, ship[1].y, 0);
                        move_ship(1,2);
                        draw_ship(ship[1].x, ship[1].y, 1);
                        //Glcd_H_Line(ship[1].x-2,ship[1].x+6,ship[1].y+7,0);
                    }
                    else if(debris[j].y > centerShip){
                        //mover hacia abajo
                        draw_ship(ship[1].x, ship[1].y, 0);
                        move_ship(1,1);
                        draw_ship(ship[1].x, ship[1].y, 1);
                        //Glcd_H_Line(ship[1].x-2,ship[1].x+6,ship[1].y+7,0);
                    }
                }
            }
        }
    }
}

void game_over(unsigned short p){
	if(p == 1){
		if(score[0] > score[1]){
			mvaddstr(16 ,54, "YOU WIN !!! ");
			mvaddstr(18 ,54, "PRESS SPACE TO CONTINUE");
			while(1){
				ch = getch();
				if(ch == 32){ //Quiero volver a la portada como si acabara de encender la consola
					break;
				}
			}
		}
		else if(score[0] < score[1]){
			mvaddstr(16 ,54, "PC WIN !!! ");
			mvaddstr(18 ,54, "PRESS SPACE TO CONTINUE");
			while(1){
				ch = getch();
				if(ch == 32){ //Quiero volver a la portada como si acabara de encender la consola
					break;
				}
			}
		}
		else if(score[0] == score[1]){
			mvaddstr(16 ,54, "TIE !!! ");
			mvaddstr(18 ,54, "PRESS SPACE TO CONTINUE");
			while(1){
				ch = getch();
				 if(ch == 32){ //Quiero volver a la portada como si acabara de encender la consola
					break;
				}
			}
		} 
	}
	if(p == 2){
		if(score[0] > score[1]){
			mvaddstr(16 ,54, "PLAYER 1 WINS !!! ");
			mvaddstr(18 ,54, "PRESS SPACE TO CONTINUE");
			while(1){
				ch = getch();
				if(ch == 32){ //Quiero volver a la portada como si acabara de encender la consola
					break;
				}
			}
		}
		else if(score[0] < score[1]){
			mvaddstr(16 ,54, "PLAYER 2 WINS !!! ");
			mvaddstr(18 ,54, "PRESS SPACE TO CONTINUE");
			while(1){
				ch = getch();
				if(ch == 32){ //Quiero volver a la portada como si acabara de encender la consola
					break;
				}
			}
		}
		else if(score[0] == score[1]){
			mvaddstr(16 ,54, "TIE !!! ");
			mvaddstr(18 ,54, "PRESS SPACE TO CONTINUE");
			while(1){
				ch = getch();
				 if(ch == 32){ //Quiero volver a la portada como si acabara de encender la consola
					break;
				}
			}
		} 
	}
}





	
