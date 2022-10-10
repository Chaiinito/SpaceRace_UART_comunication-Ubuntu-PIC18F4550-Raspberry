//C Headers
#include <stdio.h>
#include <string.h>
#include <ncurses.h>
#include <stdlib.h>

//Linux Headers
#include <fcntl.h> // contiene archivos de control como like O_RDWR
#include <errno.h> // contiene la funcion strerror()
#include <termios.h> //Contiene la terminal POSIX 
#include <unistd.h> // write(), read(), close()



typedef struct players{//Pos inferior izquierda de la nave
    unsigned short x;
    unsigned short y;
}ships;

typedef struct debris{
    unsigned short x;
    unsigned short y;
    signed short dx;
    unsigned short dir;
	unsigned short pos;
}escombro;

typedef struct win_border{
	chtype ls,rs,ts,bs,tl,tr,bl,br;
}WIN_BORDER;

typedef struct win_struct{
	int startx, starty;
	int height, width;
	WIN_BORDER border;
}WIN;

ships ship[2];
escombro debris[14];

ships old_ship[2];
escombro old_debris[14];

char info[9];

unsigned short score[]={0,0};

int main(){
	
	WIN win;
	int ch;
	int player = 0;
	
	initscr();
	start_color();
	cbreak();
	
	init_pair(1, COLOR_RED, COLOR_BLACK);
	init_pair(2, COLOR_CYAN, COLOR_BLACK);
	init_pair(3, COLOR_CYAN, COLOR_WHITE);
	init_pair(4, COLOR_BLUE, COLOR_WHITE);
	init_pair(5, COLOR_YELLOW, COLOR_BLACK);
	
	init_win_params(&win);
	keypad(stdscr, TRUE);
	noecho();    // No muestre en terminal tecla presionada
	curs_set(0); // Para ocultar el cursor
	timeout(0);  // para que no haya bloqueo en espera de entradas
	
	int serial_port;
	char buffer[1];
	int n = 0;
	
	while(1){
		switch(flag){
			case 0:
				serial_port = open("/dev/ttyUSB0", O_RDWR);

				if (serial_port < 0){
					mvprintw(45, 0, "Error %i from open: %s\n", errno, strerror(errno));
				}
				port_game(2, 0);
				create_box(&win);
				refresh();
				portada();
				
				while(1){
					ch = getch();
					if(ch == 49){
						port_game(3,1);
						if(ch == 32){ // press space to confirm
								flag = 1;
								break;
							}
							else if(ch == 50){
								break;
							}
					}
					if(ch == 50){
						port_game(3,2);
						if(ch == 32){ // press space to confirm
								flag = 1;
								break;
							}
							else if(ch == 49){
								break;
							}
					}
				}
				break;
				
			case 1:
				init_counts();
				gen_debris();
				init();
				
				create_box(&win);

				ready();
				
				while(1){
					ch = getch();
					if(debris_turn > 10){
						debris_turn = 0;
					}
					if(turno > 10){
						turno = 0;
					}
					if(turn2 > 20){
						turn2 = 0;
					}
					if(ch == KEY_DOWN){//HACIA ABAJO
						erase_player(ship[0].x, ship[0].y, 2);//erase_player(x,  y,direction) 1 arriba / 2 abajo
						move_player(0,2);//move_player(i, direction) 1 arriba / 2 abajo
						draw_player(ship[0].x, ship[0].y, 1);//draw_player(x, y, color)
					}
					else if(ch == KEY_UP){//HACIA ARRIBA        
						erase_player(ship[0].x, ship[0].y, 1);//erase_player(x,  y,direction) 1 arriba / 2 abajo
						move_player(0,1);//move_player(i, direction) 1 arriba / 2 abajo
						draw_player(ship[0].x, ship[0].y, 1);//draw_player(x, y, color)
					}
					move_ia();
					draw_player(ship[1].x, ship[1].y, 1);
					move_debris();
					draw_time();
					
					if(seconds == 50){
						seconds = 0;
						minutes -=1;
					}
					if(minutes == 0){
						 game_over();
					}
					seconds ++;
					debris_turn ++;
					turno ++;
					turn2 ++;
					
				}
				break;
			
			case 2:
		}
	}
	
	
}

void init(){
    ship[0].x = 40;
    ship[0].y = mapping(59) + 1;

    ship[1].x = 70;
    ship[1].y = mapping(59) + 1;;

    //debris.x = 64;
    //debris.y = 32;
    //debris[].dx = 2;

    draw_player(ship[0].x, ship[0].y, 1);
    draw_player(ship[1].x, ship[1].y, 1);
    //gen_debris();
}

void gen_debris(){
	unsigned short j = 0;
	unsigned short posY = mapping(1)+1;
	for(j = 0; j < 15; j++){
			int posX = rand() % 128;
			debris[j].dir = rand() % 2;
			debris[j].y = posY;
			debris[j].x = posX;
			posY += 3;
	}
}

void port_game(unsigned short c, unsigned short mode){
	if(mode == 1){
		attron(COLOR_PAIR(c));
		mvaddstr(16 ,54, "ONE PLAYER (PRESS 1)");
		attroff(COLOR_PAIR(c));
	}
	else if(mode == 2){
		attron(COLOR_PAIR(c));
		mvaddstr(20 ,54, "TWO PLAYERS (PRESS 2)");
		attroff(COLOR_PAIR(c));
	}
	else {
		attron(COLOR_PAIR(c));
		mvaddstr(16 ,54, "ONE PLAYER (PRESS 1)");
		mvaddstr(20 ,54, "TWO PLAYERS (PRESS 2)");
		attroff(COLOR_PAIR(c));
	}
}

void move_player(unsigned short i, unsigned short direction){
        if(turno == 10){
                if(direction == 2){//hacia abajo
                        if(ship[i].y >= mapping(57) + 1){
                                ship[i].y = mapping(57) + 1;
                        }
                        else{
                                ship[i].y += 1;
                        }
                }
                else if(direction == 1){//hacia arriba
                        if(ship[i].y <= 0){
								draw_player(ship[i].x,ship[i].y);
								//Glcd_H_Line(ship[i].x-2,ship[i].x+6,ship[i].y+6,0);
                                score[i] += 1;
								if(i == 0){
									ship[0].x = 40;
									ship[0].y = mapping(60)+1;
								}
								if(i == 1){
									ship[1].x = 70;
									ship[1].y = mapping(60)+1;
								}
                        }
                        else{
                                ship[i].y -= 2;
                        }
                }
        }
}

void draw_player(unsigned short x, unsigned short y,unsigned short color){
	if (color == 1){
	attron(COLOR_PAIR(1));
	mvaddch(y, x+2, 'X');
	mvaddch(y+1, x+2, 'X');
	mvaddch(y+2, x+4, 'X');
	mvaddch(y+2, x, 'X');
	attroff(COLOR_PAIR(1));
	}
	if(color ==0){
		mvaddch(y, x+2, ' ');
		mvaddch(y+1, x+2, ' ');
		mvaddch(y+2, x+4, ' ');
		mvaddch(y+2, x, ' ');
	}
	
}

int mapping(int y){
	int local_y;

	local_y = (32*y)/64;

	return local_y;
}

void move_ia(){
        unsigned short j;
        unsigned short p;
        unsigned short q;
        areaX = ship[1].x;
        areaY = ship[1].y;
        centerShip = ship[1].y;

        //La IA va a tener un rango en los que percibe los asteroides
        //Si detecta un asteroide entrar, if(asteroide.x >= rango)
        //va a ver que pos en y tiene, si esta es arriba de cierto punto va a esperar o a retroceder
        //si es menor que este punto va a moverse hacia adelante, tener en cuenta que debe tender a
        //moverse hacia adelante para que pueda ganar
        //for(q = 0; q <= 5; q++){
        if(turn2 == 1){
                 draw_player(ship[1].x, ship[1].y, 0);
                 move_player(1,1);
                 draw_player(ship[1].x, ship[1].y, 1);
        }
        if(turno == 10){

            areaX = areaX - 10;
            areaY = areaY - 4;
            for (j = 0; j <= 14; j++){
                if((debris[j].x >= areaX) && (debris[j].x <= ship[1].x + 10)){
                    if((debris[j].y >= areaY) && (debris[j].y <= ship[1].y + 6)){
                        if(debris[j].y <= centerShip){
                            //mover hacia arriba
                            draw_player(ship[1].x, ship[1].y, 0);
                            move_player(1,2);
                            draw_player(ship[1].x, ship[1].y, 1);
                            //Glcd_H_Line(ship[1].x-2,ship[1].x+6,ship[1].y+7,0);
                        }
                        else if(debris[j].y > centerShip){
                            //mover hacia abajo
                            draw_player(ship[1].x, ship[1].y, 0);
                            move_player(1,1);
                            draw_player(ship[1].x, ship[1].y, 1);
                            //Glcd_H_Line(ship[1].x-2,ship[1].x+6,ship[1].y+7,0);
                        }
                    }
                }
            }
        }
}
