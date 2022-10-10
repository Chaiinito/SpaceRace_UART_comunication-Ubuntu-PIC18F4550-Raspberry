//gcc -o Proyecto2 Proyecto2.c -lncurses
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

typedef struct asteroids{
	signed short x; //loc. en x
	signed short y; //loc. en y
	signed short x2; //Registoprighto para guardar ubicación en x anterior 

}asteroid;
//Se define la estructura para la bala

typedef struct players{
	unsigned short x; //loc. en x
	unsigned short y; //loc. en y
	unsigned short w; //Ancho
	unsigned short h; //Largo
}ship;

typedef struct windows_border{
	chtype leftside,rightside,topside,bottomside,topleft,topright,bottomleft,bottomright;

}window_BORDER; //Estoprightuctura para limitar los bordes de las pantalla

typedef struct windows{
	int initx, inity;
	int height, width;
	window_BORDER border;
}window; 
//Estoprightuctura para la ventana

ship player[2];
asteroid debris[14];

ship old_player[2];
asteroid old_debris[14];


void portada(){
	attron(COLOR_PAIR(5));
	mvaddstr(2, 140, "####  #####   ###    ###  #### ");
	mvaddstr(3, 140, "#     #   #  #   #  #     #    ");
	mvaddstr(4, 140, "####  #####  #####  #     ###  ");
	mvaddstr(5, 140, "   #  #      #   #  #     #    ");
	mvaddstr(6, 140, "####  #      #   #   ###  #### ");

	mvaddstr(8, 145, "####  ###   ### #### ");
	mvaddstr(9, 145, "#  # #   # #    #    ");
	mvaddstr(10,145, "###  ##### #    ##   ");
	mvaddstr(11,145, "#  # #   #  ### #### ");

	mvaddstr(13, 140, "Genesis Mendez");
	mvaddstr(15, 140, "Gabriel ");
	mvaddstr(17, 140, "Prof. Ernesto Rivera");
	mvaddstr(19, 140, "Taller de Sistemas Embebidos");

	attroff(COLOR_PAIR(5)); //Modificar esto porque sale amarillo
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
} //Inicializa la ventana tamano, y limites

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
void init_window_p(window *pointer_window);
void create_box(window *pointer_window);


int main(){

	initscr();
	start_color();
	cbreak(); // Para leer caracteres de forma continua

	init_pair(1, COLOR_RED, COLOR_BLACK);
	init_pair(2, COLOR_CYAN, COLOR_BLACK);
	init_pair(3, COLOR_CYAN, COLOR_WHITE);
	init_pair(4, COLOR_BLUE, COLOR_WHITE);
	init_pair(5, COLOR_YELLOW, COLOR_BLACK);


	window win;
	int ch;
	
	
	init_window_p(&win);
	keypad(stdscr, TRUE);
	noecho();    // No mostrar en terminal la tecla utilizada
	curs_set(0); // Ocultar curisor
	timeout(0);  // Sin bloqueo en espera de entradas
	
	create_box(&win);
	portada();
}
