//////////////////////////////////////////////////////////////////////////////////
// Names: Gabriel Rodriguez, Nicolas Patino, Genesis Mendez
// Professor: Ernesto Rivera A.
// Create Date: 16.10.2022
// Project Name: Space Race - whit one player and multiplayer
//////////////////////////////////////////////////////////////////////////////////

const code char Portada[1024];
unsigned short score[] = {0,0};
unsigned short minutes = 64;
unsigned short seconds = 0; 
unsigned short areaX = 0;
unsigned short areaY = 0;
unsigned short centerShip = 0;
unsigned short debris_turn = 0;
unsigned short turn = 0;
unsigned short flag = 0;
unsigned short y = 0;
unsigned short tiempo = 0;
unsigned short turn2 = 0;
char info[5];

typedef struct players{//Pos inferior izquierda de la nave
    unsigned short x;
    unsigned short y;
}ships;

typedef struct debris{
    unsigned short x;
    unsigned short y;
    signed short dx;
    unsigned short dir;
    int pos;
}escombro;

ships ship[2];
escombro debris[14];

ships old_ship[2];
escombro old_debris[14];


char GLCD_DataPort at PORTD;
sbit GLCD_CS1 at LATB0_bit;
sbit GLCD_CS2 at LATB1_bit;
sbit GLCD_RS  at LATB2_bit;
sbit GLCD_RW  at LATB3_bit;
sbit GLCD_EN  at LATB4_bit;
sbit GLCD_RST at LATB5_bit;

sbit GLCD_CS1_Direction at TRISB0_bit;
sbit GLCD_CS2_Direction at TRISB1_bit;
sbit GLCD_RS_Direction  at TRISB2_bit;
sbit GLCD_RW_Direction  at TRISB3_bit;
sbit GLCD_EN_Direction  at TRISB4_bit;
sbit GLCD_RST_Direction at TRISB5_bit;
/*
void cover(){                //Imprime la portada y queda a la espera de presionar el boton
        Glcd_Image(portada);
        while(1){
                if(Button(&PORTC,1,1,0)){
                        Glcd_Fill(0x00);
                        break;
                }
        }
}
 */
void draw_player(unsigned short x, unsigned short y,unsigned short color){

        Glcd_V_Line(y,y+6, x,color);
        Glcd_V_Line(y,y+6, x+1,color);
        Glcd_V_Line(y,y+6, x+2,color);
        Glcd_V_Line(y,y+6, x+3,color);
        Glcd_V_Line(y,y+6, x+4,color);

        Glcd_Dot(x-1,y+6, color);
        Glcd_Dot(x-1,y+5, color);
        Glcd_Dot(x-2,y+6, color);
        Glcd_Dot(x+5,y+6,color);
        Glcd_Dot(x+5,y+5, color);
        Glcd_Dot(x+6, y+6, color);
        Glcd_Dot(x+5,y+6, color);
}

void draw_time(){
        Glcd_V_Line(0,minutes,64,0);
        Glcd_V_Line(64,minutes,64,1);
}

void move_debris(unsigned short a){
        unsigned short i; //variable para la colision
        unsigned short j;//variable para controlar los asteroides
        
        if(debris_turn == 3 || a == 1){
                for(j = 0; j <= 14; j++){
                        if(debris[j].dir == 1){//asteroide moviendose de derecha a izquierda   <--
                                Glcd_Dot(debris[j].x,debris[j].y, 0);
                                debris[j].x -= 2;
                                Glcd_Dot(debris[j].x,debris[j].y, 1);
                                if(debris[j].x <= 0){
                                     Glcd_Dot(debris[j].x,debris[j].y, 0);
                                     debris[j].x = 128;
                                }
                        }
                        else if(debris[j].dir == 2){//asteroide moviendose de izquierda a derecha -->
                                Glcd_Dot( debris[j].x,debris[j].y, 0);
                                debris[j].x += 2;
                                Glcd_Dot( debris[j].x,debris[j].y, 1);
                                if(debris[j].x >= 128){
                                    Glcd_Dot(debris[j].x,debris[j].y, 0);
                                    debris[j].x = 0;
                                } 
                        }
                        
                        //Si un asteriode choca con una nave
                        for(i = 0; i < 2; i++){
                                if((debris[j].y >= ship[i].y) && (debris[j].y <= ship[i].y + 6) && (debris[j].x >= ship[i].x) && (debris[j].x <= ship[i].x + 6)){
                                        draw_player(ship[i].x, ship[i].y, 0);
                                        if(i == 0){
                                                ship[i].x = 40;
                                                ship[i].y = 57;
                                        }
                                        else if(i == 1){
                                                ship[i].x = 80;
                                                ship[i].y = 57;
                                        }
                                        draw_player(ship[i].x, ship[i].y, 1);
                                }
                        }
                }
        }        
}

void init(){
    ship[0].x = 40;
    ship[0].y = 57;

    ship[1].x = 80;
    ship[1].y = 57;
    
    score[0] = 0;
    score[1] = 0;
    
    minutes = 64;
    
    draw_player(ship[0].x, ship[0].y, 1);
    draw_player(ship[1].x, ship[1].y, 1);
}


void move_player(unsigned short i, unsigned short direction,unsigned short a){  // con a = 0 es one player
        if(turn == 3 || a == 1){                                                //con a = 1 es multiplayer
                if(direction == 2){//hacia abajo
                        if(ship[i].y >= 57){
                             ship[i].y = 57;
                        }
                        else{
                             ship[i].y += 2;
                        }
                }
                else if(direction == 1){//hacia arriba
                        if(ship[i].y <= 3){

                                score[i] += 1;
                                draw_player(ship[i].x, ship[i].y, 0);
                                if (i==0){
                                      ship[i].x = 40;
                                      ship[i].y = 57;
                                }
                                if (i==1){
                                      ship[i].x = 80;
                                      ship[i].y = 57;
                                }
                        }
                        else{
                             ship[i].y -= 2;
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

     //La IA va a tener un rango en los que percibe los asteroides
     //Si detecta un asteroide entrar, if(asteroide.x >= rango)
     //va a ver que pos en y tiene, si esta es arriba de cierto punto va a esperar o a retroceder
     //si es menor que este punto va a moverse hacia adelante, tener en cuenta que debe tender a
     //moverse hacia adelante para que pueda ganar
     //if(turn2 == 2){
              draw_player(ship[1].x, ship[1].y, 0);
              move_player(1,1,1);
              draw_player(ship[1].x, ship[1].y, 1);
     //}
     //if(turn == 3){
         areaX = areaX - 10;
         areaY = areaY - 4;
         for (j = 0; j <= 14; j++){
             if((debris[j].x >= areaX) && (debris[j].x <= ship[1].x + 10)){
                 if((debris[j].y >= areaY) && (debris[j].y <= ship[1].y + 6)){
                      if(debris[j].y <= centerShip){
                           draw_player(ship[1].x, ship[1].y, 0);
                           move_player(1,2,1);
                           draw_player(ship[1].x, ship[1].y, 1);
                      }
                      else if(debris[j].y > centerShip){
                           draw_player(ship[1].x, ship[1].y, 0);
                           move_player(1,1,1);
                           draw_player(ship[1].x, ship[1].y, 1);
                      }
                  }
              }
          }
     //}
}

void game_over(){
        if(score[0] > score[1]){
            Glcd_Write_Text("YOU WINS",35,0,1);
            delay_ms(5000);
            while(1){
                     if(Button(&PORTC,1,1,0)){ //Quiero volver a la portada como si acabara de encender la consola
                          Glcd_Fill(0x00);
                          break;
                     }
            }
        }
        else if(score[0] < score[1]){
                Glcd_Write_Text("PC WINS",35,0,1);
                delay_ms(5000);

            while(1){
                     if(Button(&PORTC,1,1,0)){ //Quiero volver a la portada como si acabara de encender la consola
                            Glcd_Fill(0x00);
                            break;
                     }
            }
        }
        else if(score[0] == score[1]){
                Glcd_Write_Text("IT\'S A TIE",35,0,1);
                delay_ms(5000);

            while(1){
                     if(Button(&PORTC,1,1,0)){ //Quiero volver a la portada como si acabara de encender la consola
                          Glcd_Fill(0x00);
                          break;
                     }
            }
        }        
}

void game_over_mult(){
        if(score[0] > score[1]){
            Glcd_Write_Text("PLAYER 1 WINS",35,0,1);
            delay_ms(5000);
            while(1){
                     if(Button(&PORTC,1,1,0)){ //Quiero volver a la portada como si acabara de encender la consola
                          Glcd_Fill(0x00);
                          break;
                     }
            }
        }
        else if(score[0] < score[1]){
                Glcd_Write_Text("PLAYER 2 WINS",35,0,1);
                delay_ms(5000);

            while(1){
                     if(Button(&PORTC,1,1,0)){ //Quiero volver a la portada como si acabara de encender la consola
                            Glcd_Fill(0x00);
                            break;
                     }
            }
        }
        else if(score[0] == score[1]){
                Glcd_Write_Text("IT\'S A TIE",35,0,1);
                delay_ms(5000);

            while(1){
                 if(Button(&PORTC,1,1,0)){ //Quiero volver a la portada como si acabara de encender la consola
                      Glcd_Fill(0x00);
                      break;
                 }
            }
        }
}

void gen_debris(){
        debris[0].y = 2;
        debris[0].x = 2;
        debris[0].dir = 2;
        debris[1].y = 4;
        debris[1].x = 34;
        debris[1].dir = 1;
        debris[2].y = 50;
        debris[2].x = 50;
        debris[2].dir = 2;
        debris[3].y = 16;
        debris[3].x = 87;
        debris[3].dir = 2;
        debris[4].y = 34;
        debris[4].x = 30;
        debris[4].dir = 1;
        debris[5].y = 12;
        debris[5].x = 120;
        debris[5].dir = 2;
        debris[6].y = 24;
        debris[6].x = 95;
        debris[6].dir = 1;
        debris[7].y = 20;
        debris[7].x = 67;
        debris[7].dir = 1;
        debris[8].y = 30;
        debris[8].x = 93;
        debris[8].dir = 1;
        debris[9].y = 28;
        debris[9].x = 82;
        debris[9].dir = 2;
        debris[10].y = 38;
        debris[10].x = 67;
        debris[10].dir = 1;
        debris[11].y = 42;
        debris[11].x =5;
        debris[11].dir = 1;
        debris[12].y = 46;
        debris[12].x = 10;
        debris[12].dir = 1;
        debris[13].y = 8;
        debris[13].x = 76;
        debris[13].dir = 2;
        debris[14].y = 54;
        debris[14].x = 20;
        debris[14].dir = 1;

}

void desdata_pack(){   // Funcion para extraer datos del paquete recibido por esclavo
     ship[0].y   =   info[0] - '0';
     ship[1].y   =   info[1] - '0';
     score[0]    =   info[2] - '0';
     score[1]    =   info[3] - '0';
}

void output_character(char charValue){   
     while (UART1_Tx_Idle()!= 1);
       UART1_Write(charValue);
}

void input_character(char char_dir){    
      while (UART1_Data_Ready() == 0);
      char_dir = UART1_Read();
}

void output_data(char *serial_dir){     
     while (UART1_Tx_Idle()!= 1);
     UART1_Write_Text(serial_dir);
}

void data_pack() {  //Funcion para empaquetar datos a enviar     ///serial_pack_data //Hay que ver como hago para enviar la ubicacion en y de cada asteroide
      // INFO //
      info[0] = ship[0].y + '0';
      info[1] = ship[1].y + '0';
      info[2] = score[0] + '0';
      info[3] = score[1] + '0';
      info[4] = 'P';
}

void save_old_data(){
     unsigned short i = 0;
     old_ship[0].y = ship[0].y;
     old_ship[1].y = ship[1].y;
     for(i = 0; i < 15; i++){
           old_debris[i].x = debris[i].x;
           old_debris[i].y = debris[i].y;
           old_debris[i].dx = debris[i].dx;
           old_debris[i].dir = debris[i].dir;
     }
}

/*
void draw_score(unsigned short i){//Imprimimos el socre en pantalla
    unsigned short posx = 0;
        if(i == 0){
                posx = 20;
        }
        if(i == 1){
                posx = 107;
        }
        if (score[i] == 0){
                Glcd_Write_Text("0",posx,0,1);
        }
        else if(score[i] == 1){
                Glcd_Write_Text("1",posx,0,1);
        }
        else if(score[i] == 2){
                Glcd_Write_Text("2",posx,0,1);
        }
        else if(score[i] == 3){
                Glcd_Write_Text("3",posx,0,1);
        }
        else if(score[i] == 4){
                Glcd_Write_Text("4",posx,0,1);
        }
        else if(score[i] == 5){
                Glcd_Write_Text("5",posx,0,1);
        }
        else if(score[i] == 6){
                Glcd_Write_Text("6",posx,0,1);
        }
        else if(score[i] == 7){
                Glcd_Write_Text("7",posx,0,1);
        }
        else if(score[i] == 8){
                Glcd_Write_Text("8",posx,0,1);
        }
        else if(score[i] == 9){
                Glcd_Write_Text("9",posx,0,1);
        }
        else if(score[i] == 10){
                Glcd_Write_text("10",posx,0,1);
        }
        else if(score[i] == 11){
                Glcd_Write_text("11",posx,0,1);
        }
        else if(score[i] == 12){
                Glcd_Write_text("12",posx,0,1);
        }
        else if(score[i] == 13){
                Glcd_Write_text("13",posx,0,1);
        }
}

*/
void main(){
        
    unsigned short Master = 0;
    unsigned short counter = 0;
    unsigned short counter2 = 0;
    char Master_slave = '0';
    
    char move_other = 0;
    char game_mult = 0;
    char win = '9';
                
    PORTC = 0;      //Establecemos las entradas en 0 para evitar conflictos
    TRISC.F0 = 1;   //Entrada para el eje y
    TRISC.F1 = 1;   // Entrada para el boton del joystick
        
    Glcd_Init();
    Glcd_Fill(0x00);
    
    UART1_Init(9600);
    Delay_ms(1000);
    //cover();

    //Glcd_Image(portada);
    /*while(1){
         if(Button(&PORTC,1,1,0)){
              Glcd_Fill(0x00);
              break;
         }
    } */
    //delay_ms(6000);
    init();
    
    while(1){
        switch(flag){
            case 0:
                 Glcd_Fill(0x00);
                 while(1){
                         y = ADC_Read(0);
                         if(y <= 5){
                                 Glcd_Write_Text("one player",15,0,1);
                                 delay_ms(1000);
                                 while(1){
                                         y = ADC_Read(0);
                                         if(Button(&PORTC,1,1,0)){
                                                 flag = 1;
                                                 break;
                                         }
                                         else if(y >= 200){
                                                 break;
                                         }
                                 }Glcd_Fill(0x00);
                         }
                         else if(y >= 250){
                                 Glcd_Write_Text("multiplayer",15,0,1);
                                 delay_ms(1000);
                                 while(1){
                                         y = ADC_Read(0);
                                         if(Button(&PORTC,1,1,0)){
                                                 flag = 2;
                                                 Glcd_Fill(0x00);
                                                 break;
                                         }
                                         else if(y <= 20){
                                                 Glcd_Fill(0x00);
                                                 break;
                                         }
                                 }
                                 Glcd_Fill(0x00);
                         }
                         else if(flag == 1 || flag == 2){
                                 break;
                         }
                 }
                 Master = 0;
                 break;

            case 1:
                 delay_ms(100);
                 Glcd_Fill(0x00);
                 init();
                 gen_debris();
                 while(1){
                         y = ADC_Read(0);
                         
                         if(y >= 250){//HACIA ABAJO
                                 draw_player(ship[0].x, ship[0].y, 0);//erase_player(x,  y,direction) 1 arriba / 2 abajo
                                 move_player(0,2,1);//move_player(i, direction) 1 arriba / 2 abajo
                                 draw_player(ship[0].x, ship[0].y, 1);//draw_player(x, y, color)
                         }
                         else if( y <= 20){//HACIA ARRIBA
                                 draw_player(ship[0].x, ship[0].y, 0);//erase_player(x,  y,direction) 1 arriba / 2 abajo
                                 move_player(0,1,1);//move_player(i, direction) 1 arriba / 2 abajo
                                 draw_player(ship[0].x, ship[0].y, 1);//draw_player(x, y, color)
                         }

                         move_ia();
                         move_debris(1);
                         draw_time();
                         //draw_score(0);

                         if(seconds > 15){
                                 seconds = 0;
                                 minutes -=1;
                         }
                         if(minutes == 0){
                                  game_over();
                                  flag = 0;
                                  break;
                         }
                         seconds ++;
                         debris_turn ++;
                         turn ++;
                         turn2 ++;
                 }
                 break;

            case 2:
                 init();
                 delay_ms(100);
                 if(UART1_Data_Ready()==0){//Espera a que se conecte la otra consola
                      while(1){        //Manda constantemente un 1, siempre y cuando no detecte la otra consola
                          Glcd_Write_Text("Waiting for other player",0,0,1);
                          UART1_Write('1');
                          if(UART1_Data_Ready() ==1){
                              break;
                          }
                      }
                      Glcd_Fill(0x00);
                 }
                 else{
                     Glcd_Write_Text("Press to start",0,0,1);//Una vez que se conecta,
                                                                                        // pide que se presione el joystick
                     while(1){
                         UART1_Write('1');
                         Master_slave = UART1_Read();//Asi el primero que presione, sera el maestro
                         if(Button(&PORTC,1,1,0)){ //Y el que no presiono se le manda la senal para que
                                UART1_Write('3');
                                Master = 1;
                                break;
                         }
                         else if(Master_slave == '3'){
                                Master = 2;
                                break;
                         }
                     }
                     Master_slave == '0';
                     Glcd_Fill(0x00);
                 }
                 delay_ms(1000);

                 if(Master == 1){
                         gen_debris();
                         draw_player(ship[0].x, ship[0].y, 1);
                         draw_player(ship[1].x, ship[1].y, 1);
                         while(1){
                                 y = ADC_Read(0);
                                 
                                 if(y >= 250){
                                         draw_player(ship[0].x, ship[0].y, 0); //2 hacia abajo
                                         move_player(0,2,1);
                                         draw_player(ship[0].x, ship[0].y,1);

                                 }
                                 else if(y <= 5){
                                         draw_player(ship[0].x, ship[0].y, 0); //1 hacia arriba
                                         move_player(0,1,1);
                                         draw_player(ship[0].x, ship[0].y,1);
                                 }
                                 while(UART1_Data_Ready()==0);

                                 if(UART1_Read() == '1'){
                                         draw_player(ship[1].x, ship[1].y, 0); //2 hacia abajo
                                         move_player(1,2,1);
                                         draw_player(ship[1].x, ship[1].y,1);
                                 }
                                 else if(UART1_Read ()== '2'){
                                         draw_player(ship[1].x, ship[1].y, 0); //2 hacia abajo
                                         move_player(1,1,1);
                                         draw_player(ship[1].x, ship[1].y,1);
                                 }

                                 move_debris(1); //para no usar retrasos
                                 draw_time();
                                 data_pack();
                                 output_data(info);
                                 //draw_score(0);
                                 //draw_score(1);


                                 while (UART1_Tx_Idle() != 1);

                                 if(seconds > 5){
                                         seconds = 0;
                                         minutes -=1;
                                 }
                                 if(minutes == 0){
                                      output_character(win);
                                      game_over_mult();
                                      flag = 0;
                                      break;
                                 }
                                 seconds ++;
                                 //debris_turn ++;
                                 //turn ++;
                                 //turn2 ++;
                         }
                 }

                 if(Master == 2){
                         gen_debris();
                         while(1){
                                 y = ADC_Read(0);
                                 save_old_data();
                                 
                                 if(y >= 250){        //Mover hacia abajo
                                         move_other = '1';
                                 }
                                 else if(y <= 5){         //Mover hacia arriba
                                         move_other = '2';
                                 }
                                 else{move_other = '0';}

                                 if(UART1_Read() == '9'){
                                      game_over_mult();
                                      flag = 0;
                                      break;
                                 }

                                 output_character(move_other);
                                 move_debris(1);

                                 while(UART1_Data_Ready()==0);
                                 UART1_Read_Text(info, "P", 255);
                                 //input_data();
                                 draw_player(ship[0].x, ship[0].y, 0);
                                 draw_player(ship[1].x, ship[1].y, 0);
                                 desdata_pack();
                                 draw_player(ship[0].x, ship[0].y, 1);
                                 draw_player(ship[1].x, ship[1].y, 1);

                                 //draw_score(0);
                                 //draw_score(1);

                                 draw_time();

                                 if(seconds > 5){
                                         seconds = 0;
                                         minutes -=1;
                                 }
                                 seconds ++;
                         }
                 }
                 break;
        }
    } 
}