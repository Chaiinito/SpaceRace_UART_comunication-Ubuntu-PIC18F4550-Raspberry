
_draw_player:

;space.c,68 :: 		void draw_player(unsigned short x, unsigned short y,unsigned short color){
;space.c,70 :: 		Glcd_V_Line(y,y+6, x,color);
	MOVF        FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_V_Line_y_start+0 
	MOVLW       6
	ADDWF       FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_V_Line_y_end+0 
	MOVF        FARG_draw_player_x+0, 0 
	MOVWF       FARG_Glcd_V_Line_x_pos+0 
	MOVF        FARG_draw_player_color+0, 0 
	MOVWF       FARG_Glcd_V_Line_color+0 
	CALL        _Glcd_V_Line+0, 0
;space.c,71 :: 		Glcd_V_Line(y,y+6, x+1,color);
	MOVF        FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_V_Line_y_start+0 
	MOVLW       6
	ADDWF       FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_V_Line_y_end+0 
	MOVF        FARG_draw_player_x+0, 0 
	ADDLW       1
	MOVWF       FARG_Glcd_V_Line_x_pos+0 
	MOVF        FARG_draw_player_color+0, 0 
	MOVWF       FARG_Glcd_V_Line_color+0 
	CALL        _Glcd_V_Line+0, 0
;space.c,72 :: 		Glcd_V_Line(y,y+6, x+2,color);
	MOVF        FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_V_Line_y_start+0 
	MOVLW       6
	ADDWF       FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_V_Line_y_end+0 
	MOVLW       2
	ADDWF       FARG_draw_player_x+0, 0 
	MOVWF       FARG_Glcd_V_Line_x_pos+0 
	MOVF        FARG_draw_player_color+0, 0 
	MOVWF       FARG_Glcd_V_Line_color+0 
	CALL        _Glcd_V_Line+0, 0
;space.c,73 :: 		Glcd_V_Line(y,y+6, x+3,color);
	MOVF        FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_V_Line_y_start+0 
	MOVLW       6
	ADDWF       FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_V_Line_y_end+0 
	MOVLW       3
	ADDWF       FARG_draw_player_x+0, 0 
	MOVWF       FARG_Glcd_V_Line_x_pos+0 
	MOVF        FARG_draw_player_color+0, 0 
	MOVWF       FARG_Glcd_V_Line_color+0 
	CALL        _Glcd_V_Line+0, 0
;space.c,74 :: 		Glcd_V_Line(y,y+6, x+4,color);
	MOVF        FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_V_Line_y_start+0 
	MOVLW       6
	ADDWF       FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_V_Line_y_end+0 
	MOVLW       4
	ADDWF       FARG_draw_player_x+0, 0 
	MOVWF       FARG_Glcd_V_Line_x_pos+0 
	MOVF        FARG_draw_player_color+0, 0 
	MOVWF       FARG_Glcd_V_Line_color+0 
	CALL        _Glcd_V_Line+0, 0
;space.c,76 :: 		Glcd_Dot(x-1,y+6, color);
	DECF        FARG_draw_player_x+0, 0 
	MOVWF       FARG_Glcd_Dot_x_pos+0 
	MOVLW       6
	ADDWF       FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_Dot_y_pos+0 
	MOVF        FARG_draw_player_color+0, 0 
	MOVWF       FARG_Glcd_Dot_color+0 
	CALL        _Glcd_Dot+0, 0
;space.c,77 :: 		Glcd_Dot(x-1,y+5, color);
	DECF        FARG_draw_player_x+0, 0 
	MOVWF       FARG_Glcd_Dot_x_pos+0 
	MOVLW       5
	ADDWF       FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_Dot_y_pos+0 
	MOVF        FARG_draw_player_color+0, 0 
	MOVWF       FARG_Glcd_Dot_color+0 
	CALL        _Glcd_Dot+0, 0
;space.c,78 :: 		Glcd_Dot(x-2,y+6, color);
	MOVLW       2
	SUBWF       FARG_draw_player_x+0, 0 
	MOVWF       FARG_Glcd_Dot_x_pos+0 
	MOVLW       6
	ADDWF       FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_Dot_y_pos+0 
	MOVF        FARG_draw_player_color+0, 0 
	MOVWF       FARG_Glcd_Dot_color+0 
	CALL        _Glcd_Dot+0, 0
;space.c,79 :: 		Glcd_Dot(x+5,y+6,color);
	MOVLW       5
	ADDWF       FARG_draw_player_x+0, 0 
	MOVWF       FARG_Glcd_Dot_x_pos+0 
	MOVLW       6
	ADDWF       FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_Dot_y_pos+0 
	MOVF        FARG_draw_player_color+0, 0 
	MOVWF       FARG_Glcd_Dot_color+0 
	CALL        _Glcd_Dot+0, 0
;space.c,80 :: 		Glcd_Dot(x+5,y+5, color);
	MOVLW       5
	ADDWF       FARG_draw_player_x+0, 0 
	MOVWF       FARG_Glcd_Dot_x_pos+0 
	MOVLW       5
	ADDWF       FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_Dot_y_pos+0 
	MOVF        FARG_draw_player_color+0, 0 
	MOVWF       FARG_Glcd_Dot_color+0 
	CALL        _Glcd_Dot+0, 0
;space.c,81 :: 		Glcd_Dot(x+6, y+6, color);
	MOVLW       6
	ADDWF       FARG_draw_player_x+0, 0 
	MOVWF       FARG_Glcd_Dot_x_pos+0 
	MOVLW       6
	ADDWF       FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_Dot_y_pos+0 
	MOVF        FARG_draw_player_color+0, 0 
	MOVWF       FARG_Glcd_Dot_color+0 
	CALL        _Glcd_Dot+0, 0
;space.c,82 :: 		Glcd_Dot(x+5,y+6, color);
	MOVLW       5
	ADDWF       FARG_draw_player_x+0, 0 
	MOVWF       FARG_Glcd_Dot_x_pos+0 
	MOVLW       6
	ADDWF       FARG_draw_player_y+0, 0 
	MOVWF       FARG_Glcd_Dot_y_pos+0 
	MOVF        FARG_draw_player_color+0, 0 
	MOVWF       FARG_Glcd_Dot_color+0 
	CALL        _Glcd_Dot+0, 0
;space.c,83 :: 		}
L_end_draw_player:
	RETURN      0
; end of _draw_player

_draw_time:

;space.c,85 :: 		void draw_time(){
;space.c,86 :: 		Glcd_V_Line(0,minutes,64,0);
	CLRF        FARG_Glcd_V_Line_y_start+0 
	MOVF        _minutes+0, 0 
	MOVWF       FARG_Glcd_V_Line_y_end+0 
	MOVLW       64
	MOVWF       FARG_Glcd_V_Line_x_pos+0 
	CLRF        FARG_Glcd_V_Line_color+0 
	CALL        _Glcd_V_Line+0, 0
;space.c,87 :: 		Glcd_V_Line(64,minutes,64,1);
	MOVLW       64
	MOVWF       FARG_Glcd_V_Line_y_start+0 
	MOVF        _minutes+0, 0 
	MOVWF       FARG_Glcd_V_Line_y_end+0 
	MOVLW       64
	MOVWF       FARG_Glcd_V_Line_x_pos+0 
	MOVLW       1
	MOVWF       FARG_Glcd_V_Line_color+0 
	CALL        _Glcd_V_Line+0, 0
;space.c,88 :: 		}
L_end_draw_time:
	RETURN      0
; end of _draw_time

_move_debris:

;space.c,90 :: 		void move_debris(unsigned short a){
;space.c,94 :: 		if(debris_turn == 3 || a == 1){
	MOVF        _debris_turn+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L__move_debris163
	MOVF        FARG_move_debris_a+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L__move_debris163
	GOTO        L_move_debris2
L__move_debris163:
;space.c,95 :: 		for(j = 0; j <= 14; j++){
	CLRF        move_debris_j_L0+0 
L_move_debris3:
	MOVF        move_debris_j_L0+0, 0 
	SUBLW       14
	BTFSS       STATUS+0, 0 
	GOTO        L_move_debris4
;space.c,96 :: 		if(debris[j].dir == 1){//asteroide moviendose de derecha a izquierda   <--
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_move_debris6
;space.c,97 :: 		Glcd_Dot(debris[j].x,debris[j].y, 0);
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Dot_x_pos+0 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Dot_y_pos+0 
	CLRF        FARG_Glcd_Dot_color+0 
	CALL        _Glcd_Dot+0, 0
;space.c,98 :: 		debris[j].x -= 2;
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVFF       R2, FSR0
	MOVFF       R3, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       2
	SUBWF       R0, 1 
	MOVFF       R2, FSR1
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;space.c,99 :: 		Glcd_Dot(debris[j].x,debris[j].y, 1);
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Dot_x_pos+0 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Dot_y_pos+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Dot_color+0 
	CALL        _Glcd_Dot+0, 0
;space.c,100 :: 		if(debris[j].x <= 0){
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	SUBLW       0
	BTFSS       STATUS+0, 0 
	GOTO        L_move_debris7
;space.c,101 :: 		Glcd_Dot(debris[j].x,debris[j].y, 0);
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Dot_x_pos+0 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Dot_y_pos+0 
	CLRF        FARG_Glcd_Dot_color+0 
	CALL        _Glcd_Dot+0, 0
;space.c,102 :: 		debris[j].x = 128;
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       128
	MOVWF       POSTINC1+0 
;space.c,103 :: 		}
L_move_debris7:
;space.c,104 :: 		}
	GOTO        L_move_debris8
L_move_debris6:
;space.c,105 :: 		else if(debris[j].dir == 2){//asteroide moviendose de izquierda a derecha -->
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_move_debris9
;space.c,106 :: 		Glcd_Dot( debris[j].x,debris[j].y, 0);
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Dot_x_pos+0 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Dot_y_pos+0 
	CLRF        FARG_Glcd_Dot_color+0 
	CALL        _Glcd_Dot+0, 0
;space.c,107 :: 		debris[j].x += 2;
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVFF       R2, FSR0
	MOVFF       R3, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       2
	ADDWF       R0, 1 
	MOVFF       R2, FSR1
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;space.c,108 :: 		Glcd_Dot( debris[j].x,debris[j].y, 1);
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Dot_x_pos+0 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Dot_y_pos+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Dot_color+0 
	CALL        _Glcd_Dot+0, 0
;space.c,109 :: 		if(debris[j].x >= 128){
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       128
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_move_debris10
;space.c,110 :: 		Glcd_Dot(debris[j].x,debris[j].y, 0);
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Dot_x_pos+0 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Glcd_Dot_y_pos+0 
	CLRF        FARG_Glcd_Dot_color+0 
	CALL        _Glcd_Dot+0, 0
;space.c,111 :: 		debris[j].x = 0;
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;space.c,112 :: 		}
L_move_debris10:
;space.c,113 :: 		}
L_move_debris9:
L_move_debris8:
;space.c,116 :: 		for(i = 0; i < 2; i++){
	CLRF        move_debris_i_L0+0 
L_move_debris11:
	MOVLW       2
	SUBWF       move_debris_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_move_debris12
;space.c,117 :: 		if((debris[j].y >= ship[i].y) && (debris[j].y <= ship[i].y + 6) && (debris[j].x >= ship[i].x) && (debris[j].x <= ship[i].x + 6)){
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        move_debris_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_move_debris16
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        move_debris_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVLW       6
	ADDWF       POSTINC0+0, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	ADDWFC      R2, 1 
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__move_debris171
	MOVF        R3, 0 
	SUBWF       R1, 0 
L__move_debris171:
	BTFSS       STATUS+0, 0 
	GOTO        L_move_debris16
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        move_debris_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 0 
	MOVWF       FSR2 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_move_debris16
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_debris_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        move_debris_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       6
	ADDWF       R0, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	ADDWFC      R2, 1 
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__move_debris172
	MOVF        R3, 0 
	SUBWF       R1, 0 
L__move_debris172:
	BTFSS       STATUS+0, 0 
	GOTO        L_move_debris16
L__move_debris162:
;space.c,118 :: 		draw_player(ship[i].x, ship[i].y, 0);
	MOVF        move_debris_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_draw_player_y+0 
	CLRF        FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,119 :: 		if(i == 0){
	MOVF        move_debris_i_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_move_debris17
;space.c,120 :: 		ship[i].x = 40;
	MOVF        move_debris_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       40
	MOVWF       POSTINC1+0 
;space.c,121 :: 		ship[i].y = 57;
	MOVF        move_debris_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       57
	MOVWF       POSTINC1+0 
;space.c,122 :: 		}
	GOTO        L_move_debris18
L_move_debris17:
;space.c,123 :: 		else if(i == 1){
	MOVF        move_debris_i_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_move_debris19
;space.c,124 :: 		ship[i].x = 80;
	MOVF        move_debris_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       80
	MOVWF       POSTINC1+0 
;space.c,125 :: 		ship[i].y = 57;
	MOVF        move_debris_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       57
	MOVWF       POSTINC1+0 
;space.c,126 :: 		}
L_move_debris19:
L_move_debris18:
;space.c,127 :: 		draw_player(ship[i].x, ship[i].y, 1);
	MOVF        move_debris_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,128 :: 		}
L_move_debris16:
;space.c,116 :: 		for(i = 0; i < 2; i++){
	INCF        move_debris_i_L0+0, 1 
;space.c,129 :: 		}
	GOTO        L_move_debris11
L_move_debris12:
;space.c,95 :: 		for(j = 0; j <= 14; j++){
	INCF        move_debris_j_L0+0, 1 
;space.c,130 :: 		}
	GOTO        L_move_debris3
L_move_debris4:
;space.c,131 :: 		}
L_move_debris2:
;space.c,132 :: 		}
L_end_move_debris:
	RETURN      0
; end of _move_debris

_init:

;space.c,134 :: 		void init(){
;space.c,135 :: 		ship[0].x = 40;
	MOVLW       40
	MOVWF       _ship+0 
;space.c,136 :: 		ship[0].y = 57;
	MOVLW       57
	MOVWF       _ship+1 
;space.c,138 :: 		ship[1].x = 80;
	MOVLW       80
	MOVWF       _ship+2 
;space.c,139 :: 		ship[1].y = 57;
	MOVLW       57
	MOVWF       _ship+3 
;space.c,141 :: 		score[0] = 0;
	CLRF        _score+0 
;space.c,142 :: 		score[1] = 0;
	CLRF        _score+1 
;space.c,144 :: 		minutes = 64;
	MOVLW       64
	MOVWF       _minutes+0 
;space.c,146 :: 		draw_player(ship[0].x, ship[0].y, 1);
	MOVLW       40
	MOVWF       FARG_draw_player_x+0 
	MOVLW       57
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,147 :: 		draw_player(ship[1].x, ship[1].y, 1);
	MOVF        _ship+2, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+3, 0 
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,148 :: 		}
L_end_init:
	RETURN      0
; end of _init

_move_player:

;space.c,151 :: 		void move_player(unsigned short i, unsigned short direction,unsigned short a){  // con a = 0 es one player
;space.c,152 :: 		if(turn == 3 || a == 1){                                                //con a = 1 es multiplayer
	MOVF        _turn+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L__move_player164
	MOVF        FARG_move_player_a+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L__move_player164
	GOTO        L_move_player22
L__move_player164:
;space.c,153 :: 		if(direction == 2){//hacia abajo
	MOVF        FARG_move_player_direction+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_move_player23
;space.c,154 :: 		if(ship[i].y >= 57){
	MOVF        FARG_move_player_i+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVLW       57
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_move_player24
;space.c,155 :: 		ship[i].y = 57;
	MOVF        FARG_move_player_i+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       57
	MOVWF       POSTINC1+0 
;space.c,156 :: 		}
	GOTO        L_move_player25
L_move_player24:
;space.c,158 :: 		ship[i].y += 2;
	MOVF        FARG_move_player_i+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVFF       R2, FSR0
	MOVFF       R3, FSR0H
	MOVLW       2
	ADDWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVFF       R2, FSR1
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;space.c,159 :: 		}
L_move_player25:
;space.c,160 :: 		}
	GOTO        L_move_player26
L_move_player23:
;space.c,161 :: 		else if(direction == 1){//hacia arriba
	MOVF        FARG_move_player_direction+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_move_player27
;space.c,162 :: 		if(ship[i].y <= 3){
	MOVF        FARG_move_player_i+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	SUBLW       3
	BTFSS       STATUS+0, 0 
	GOTO        L_move_player28
;space.c,164 :: 		score[i] += 1;
	MOVLW       _score+0
	MOVWF       R1 
	MOVLW       hi_addr(_score+0)
	MOVWF       R2 
	MOVF        FARG_move_player_i+0, 0 
	ADDWF       R1, 1 
	BTFSC       STATUS+0, 0 
	INCF        R2, 1 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVF        POSTINC0+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVFF       R1, FSR1
	MOVFF       R2, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;space.c,165 :: 		draw_player(ship[i].x, ship[i].y, 0);
	MOVF        FARG_move_player_i+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_draw_player_y+0 
	CLRF        FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,166 :: 		if (i==0){
	MOVF        FARG_move_player_i+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_move_player29
;space.c,167 :: 		ship[i].x = 40;
	MOVF        FARG_move_player_i+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       40
	MOVWF       POSTINC1+0 
;space.c,168 :: 		ship[i].y = 57;
	MOVF        FARG_move_player_i+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       57
	MOVWF       POSTINC1+0 
;space.c,169 :: 		}
L_move_player29:
;space.c,170 :: 		if (i==1){
	MOVF        FARG_move_player_i+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_move_player30
;space.c,171 :: 		ship[i].x = 80;
	MOVF        FARG_move_player_i+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       80
	MOVWF       POSTINC1+0 
;space.c,172 :: 		ship[i].y = 57;
	MOVF        FARG_move_player_i+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       57
	MOVWF       POSTINC1+0 
;space.c,173 :: 		}
L_move_player30:
;space.c,174 :: 		}
	GOTO        L_move_player31
L_move_player28:
;space.c,176 :: 		ship[i].y -= 2;
	MOVF        FARG_move_player_i+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _ship+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_ship+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVFF       R2, FSR0
	MOVFF       R3, FSR0H
	MOVLW       2
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVFF       R2, FSR1
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;space.c,177 :: 		}
L_move_player31:
;space.c,178 :: 		}
L_move_player27:
L_move_player26:
;space.c,179 :: 		}
L_move_player22:
;space.c,180 :: 		}
L_end_move_player:
	RETURN      0
; end of _move_player

_move_ia:

;space.c,182 :: 		void move_ia(){
;space.c,186 :: 		areaX = ship[1].x;
	MOVF        _ship+2, 0 
	MOVWF       _areaX+0 
;space.c,187 :: 		areaY = ship[1].y;
	MOVF        _ship+3, 0 
	MOVWF       _areaY+0 
;space.c,188 :: 		centerShip = ship[1].y;
	MOVF        _ship+3, 0 
	MOVWF       _centerShip+0 
;space.c,196 :: 		draw_player(ship[1].x, ship[1].y, 0);
	MOVF        _ship+2, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+3, 0 
	MOVWF       FARG_draw_player_y+0 
	CLRF        FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,197 :: 		move_player(1,1,1);
	MOVLW       1
	MOVWF       FARG_move_player_i+0 
	MOVLW       1
	MOVWF       FARG_move_player_direction+0 
	MOVLW       1
	MOVWF       FARG_move_player_a+0 
	CALL        _move_player+0, 0
;space.c,198 :: 		draw_player(ship[1].x, ship[1].y, 1);
	MOVF        _ship+2, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+3, 0 
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,201 :: 		areaX = areaX - 10;
	MOVLW       10
	SUBWF       _areaX+0, 1 
;space.c,202 :: 		areaY = areaY - 4;
	MOVLW       4
	SUBWF       _areaY+0, 1 
;space.c,203 :: 		for (j = 0; j <= 14; j++){
	CLRF        move_ia_j_L0+0 
L_move_ia32:
	MOVF        move_ia_j_L0+0, 0 
	SUBLW       14
	BTFSS       STATUS+0, 0 
	GOTO        L_move_ia33
;space.c,204 :: 		if((debris[j].x >= areaX) && (debris[j].x <= ship[1].x + 10)){
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_ia_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        _areaX+0, 0 
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_move_ia37
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_ia_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       10
	ADDWF       _ship+2, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	ADDWFC      R2, 1 
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__move_ia176
	MOVF        R3, 0 
	SUBWF       R1, 0 
L__move_ia176:
	BTFSS       STATUS+0, 0 
	GOTO        L_move_ia37
L__move_ia166:
;space.c,205 :: 		if((debris[j].y >= areaY) && (debris[j].y <= ship[1].y + 6)){
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_ia_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        _areaY+0, 0 
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_move_ia40
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_ia_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       6
	ADDWF       _ship+3, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	ADDWFC      R2, 1 
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__move_ia177
	MOVF        R3, 0 
	SUBWF       R1, 0 
L__move_ia177:
	BTFSS       STATUS+0, 0 
	GOTO        L_move_ia40
L__move_ia165:
;space.c,206 :: 		if(debris[j].y <= centerShip){
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_ia_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	SUBWF       _centerShip+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_move_ia41
;space.c,207 :: 		draw_player(ship[1].x, ship[1].y, 0);
	MOVF        _ship+2, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+3, 0 
	MOVWF       FARG_draw_player_y+0 
	CLRF        FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,208 :: 		move_player(1,2,1);
	MOVLW       1
	MOVWF       FARG_move_player_i+0 
	MOVLW       2
	MOVWF       FARG_move_player_direction+0 
	MOVLW       1
	MOVWF       FARG_move_player_a+0 
	CALL        _move_player+0, 0
;space.c,209 :: 		draw_player(ship[1].x, ship[1].y, 1);
	MOVF        _ship+2, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+3, 0 
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,210 :: 		}
	GOTO        L_move_ia42
L_move_ia41:
;space.c,211 :: 		else if(debris[j].y > centerShip){
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        move_ia_j_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	SUBWF       _centerShip+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_move_ia43
;space.c,212 :: 		draw_player(ship[1].x, ship[1].y, 0);
	MOVF        _ship+2, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+3, 0 
	MOVWF       FARG_draw_player_y+0 
	CLRF        FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,213 :: 		move_player(1,1,1);
	MOVLW       1
	MOVWF       FARG_move_player_i+0 
	MOVLW       1
	MOVWF       FARG_move_player_direction+0 
	MOVLW       1
	MOVWF       FARG_move_player_a+0 
	CALL        _move_player+0, 0
;space.c,214 :: 		draw_player(ship[1].x, ship[1].y, 1);
	MOVF        _ship+2, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+3, 0 
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,215 :: 		}
L_move_ia43:
L_move_ia42:
;space.c,216 :: 		}
L_move_ia40:
;space.c,217 :: 		}
L_move_ia37:
;space.c,203 :: 		for (j = 0; j <= 14; j++){
	INCF        move_ia_j_L0+0, 1 
;space.c,218 :: 		}
	GOTO        L_move_ia32
L_move_ia33:
;space.c,220 :: 		}
L_end_move_ia:
	RETURN      0
; end of _move_ia

_game_over:

;space.c,222 :: 		void game_over(){
;space.c,223 :: 		if(score[0] > score[1]){
	MOVF        _score+0, 0 
	SUBWF       _score+1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_game_over44
;space.c,224 :: 		Glcd_Write_Text("YOU WINS",35,0,1);
	MOVLW       ?lstr1_space+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr1_space+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       35
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	CLRF        FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;space.c,225 :: 		delay_ms(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_game_over45:
	DECFSZ      R13, 1, 1
	BRA         L_game_over45
	DECFSZ      R12, 1, 1
	BRA         L_game_over45
	DECFSZ      R11, 1, 1
	BRA         L_game_over45
	NOP
	NOP
;space.c,226 :: 		while(1){
L_game_over46:
;space.c,227 :: 		if(Button(&PORTC,1,1,0)){ //Quiero volver a la portada como si acabara de encender la consola
	MOVLW       PORTC+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_game_over48
;space.c,228 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;space.c,229 :: 		break;
	GOTO        L_game_over47
;space.c,230 :: 		}
L_game_over48:
;space.c,231 :: 		}
	GOTO        L_game_over46
L_game_over47:
;space.c,232 :: 		}
	GOTO        L_game_over49
L_game_over44:
;space.c,233 :: 		else if(score[0] < score[1]){
	MOVF        _score+1, 0 
	SUBWF       _score+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_game_over50
;space.c,234 :: 		Glcd_Write_Text("PC WINS",35,0,1);
	MOVLW       ?lstr2_space+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr2_space+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       35
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	CLRF        FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;space.c,235 :: 		delay_ms(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_game_over51:
	DECFSZ      R13, 1, 1
	BRA         L_game_over51
	DECFSZ      R12, 1, 1
	BRA         L_game_over51
	DECFSZ      R11, 1, 1
	BRA         L_game_over51
	NOP
	NOP
;space.c,237 :: 		while(1){
L_game_over52:
;space.c,238 :: 		if(Button(&PORTC,1,1,0)){ //Quiero volver a la portada como si acabara de encender la consola
	MOVLW       PORTC+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_game_over54
;space.c,239 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;space.c,240 :: 		break;
	GOTO        L_game_over53
;space.c,241 :: 		}
L_game_over54:
;space.c,242 :: 		}
	GOTO        L_game_over52
L_game_over53:
;space.c,243 :: 		}
	GOTO        L_game_over55
L_game_over50:
;space.c,244 :: 		else if(score[0] == score[1]){
	MOVF        _score+0, 0 
	XORWF       _score+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_game_over56
;space.c,245 :: 		Glcd_Write_Text("IT\'S A TIE",35,0,1);
	MOVLW       ?lstr3_space+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr3_space+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       35
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	CLRF        FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;space.c,246 :: 		delay_ms(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_game_over57:
	DECFSZ      R13, 1, 1
	BRA         L_game_over57
	DECFSZ      R12, 1, 1
	BRA         L_game_over57
	DECFSZ      R11, 1, 1
	BRA         L_game_over57
	NOP
	NOP
;space.c,248 :: 		while(1){
L_game_over58:
;space.c,249 :: 		if(Button(&PORTC,1,1,0)){ //Quiero volver a la portada como si acabara de encender la consola
	MOVLW       PORTC+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_game_over60
;space.c,250 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;space.c,251 :: 		break;
	GOTO        L_game_over59
;space.c,252 :: 		}
L_game_over60:
;space.c,253 :: 		}
	GOTO        L_game_over58
L_game_over59:
;space.c,254 :: 		}
L_game_over56:
L_game_over55:
L_game_over49:
;space.c,255 :: 		}
L_end_game_over:
	RETURN      0
; end of _game_over

_game_over_mult:

;space.c,257 :: 		void game_over_mult(){
;space.c,258 :: 		if(score[0] > score[1]){
	MOVF        _score+0, 0 
	SUBWF       _score+1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_game_over_mult61
;space.c,259 :: 		Glcd_Write_Text("PLAYER 1 WINS",35,0,1);
	MOVLW       ?lstr4_space+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr4_space+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       35
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	CLRF        FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;space.c,260 :: 		delay_ms(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_game_over_mult62:
	DECFSZ      R13, 1, 1
	BRA         L_game_over_mult62
	DECFSZ      R12, 1, 1
	BRA         L_game_over_mult62
	DECFSZ      R11, 1, 1
	BRA         L_game_over_mult62
	NOP
	NOP
;space.c,261 :: 		while(1){
L_game_over_mult63:
;space.c,262 :: 		if(Button(&PORTC,1,1,0)){ //Quiero volver a la portada como si acabara de encender la consola
	MOVLW       PORTC+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_game_over_mult65
;space.c,263 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;space.c,264 :: 		break;
	GOTO        L_game_over_mult64
;space.c,265 :: 		}
L_game_over_mult65:
;space.c,266 :: 		}
	GOTO        L_game_over_mult63
L_game_over_mult64:
;space.c,267 :: 		}
	GOTO        L_game_over_mult66
L_game_over_mult61:
;space.c,268 :: 		else if(score[0] < score[1]){
	MOVF        _score+1, 0 
	SUBWF       _score+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_game_over_mult67
;space.c,269 :: 		Glcd_Write_Text("PLAYER 2 WINS",35,0,1);
	MOVLW       ?lstr5_space+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr5_space+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       35
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	CLRF        FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;space.c,270 :: 		delay_ms(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_game_over_mult68:
	DECFSZ      R13, 1, 1
	BRA         L_game_over_mult68
	DECFSZ      R12, 1, 1
	BRA         L_game_over_mult68
	DECFSZ      R11, 1, 1
	BRA         L_game_over_mult68
	NOP
	NOP
;space.c,272 :: 		while(1){
L_game_over_mult69:
;space.c,273 :: 		if(Button(&PORTC,1,1,0)){ //Quiero volver a la portada como si acabara de encender la consola
	MOVLW       PORTC+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_game_over_mult71
;space.c,274 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;space.c,275 :: 		break;
	GOTO        L_game_over_mult70
;space.c,276 :: 		}
L_game_over_mult71:
;space.c,277 :: 		}
	GOTO        L_game_over_mult69
L_game_over_mult70:
;space.c,278 :: 		}
	GOTO        L_game_over_mult72
L_game_over_mult67:
;space.c,279 :: 		else if(score[0] == score[1]){
	MOVF        _score+0, 0 
	XORWF       _score+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_game_over_mult73
;space.c,280 :: 		Glcd_Write_Text("IT\'S A TIE",35,0,1);
	MOVLW       ?lstr6_space+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr6_space+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       35
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	CLRF        FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;space.c,281 :: 		delay_ms(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_game_over_mult74:
	DECFSZ      R13, 1, 1
	BRA         L_game_over_mult74
	DECFSZ      R12, 1, 1
	BRA         L_game_over_mult74
	DECFSZ      R11, 1, 1
	BRA         L_game_over_mult74
	NOP
	NOP
;space.c,283 :: 		while(1){
L_game_over_mult75:
;space.c,284 :: 		if(Button(&PORTC,1,1,0)){ //Quiero volver a la portada como si acabara de encender la consola
	MOVLW       PORTC+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_game_over_mult77
;space.c,285 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;space.c,286 :: 		break;
	GOTO        L_game_over_mult76
;space.c,287 :: 		}
L_game_over_mult77:
;space.c,288 :: 		}
	GOTO        L_game_over_mult75
L_game_over_mult76:
;space.c,289 :: 		}
L_game_over_mult73:
L_game_over_mult72:
L_game_over_mult66:
;space.c,290 :: 		}
L_end_game_over_mult:
	RETURN      0
; end of _game_over_mult

_gen_debris:

;space.c,292 :: 		void gen_debris(){
;space.c,293 :: 		debris[0].y = 2;
	MOVLW       2
	MOVWF       _debris+1 
;space.c,294 :: 		debris[0].x = 2;
	MOVLW       2
	MOVWF       _debris+0 
;space.c,295 :: 		debris[0].dir = 2;
	MOVLW       2
	MOVWF       _debris+3 
;space.c,296 :: 		debris[1].y = 4;
	MOVLW       4
	MOVWF       _debris+7 
;space.c,297 :: 		debris[1].x = 34;
	MOVLW       34
	MOVWF       _debris+6 
;space.c,298 :: 		debris[1].dir = 1;
	MOVLW       1
	MOVWF       _debris+9 
;space.c,299 :: 		debris[2].y = 50;
	MOVLW       50
	MOVWF       _debris+13 
;space.c,300 :: 		debris[2].x = 50;
	MOVLW       50
	MOVWF       _debris+12 
;space.c,301 :: 		debris[2].dir = 2;
	MOVLW       2
	MOVWF       _debris+15 
;space.c,302 :: 		debris[3].y = 16;
	MOVLW       16
	MOVWF       _debris+19 
;space.c,303 :: 		debris[3].x = 87;
	MOVLW       87
	MOVWF       _debris+18 
;space.c,304 :: 		debris[3].dir = 2;
	MOVLW       2
	MOVWF       _debris+21 
;space.c,305 :: 		debris[4].y = 34;
	MOVLW       34
	MOVWF       _debris+25 
;space.c,306 :: 		debris[4].x = 30;
	MOVLW       30
	MOVWF       _debris+24 
;space.c,307 :: 		debris[4].dir = 1;
	MOVLW       1
	MOVWF       _debris+27 
;space.c,308 :: 		debris[5].y = 12;
	MOVLW       12
	MOVWF       _debris+31 
;space.c,309 :: 		debris[5].x = 120;
	MOVLW       120
	MOVWF       _debris+30 
;space.c,310 :: 		debris[5].dir = 2;
	MOVLW       2
	MOVWF       _debris+33 
;space.c,311 :: 		debris[6].y = 24;
	MOVLW       24
	MOVWF       _debris+37 
;space.c,312 :: 		debris[6].x = 95;
	MOVLW       95
	MOVWF       _debris+36 
;space.c,313 :: 		debris[6].dir = 1;
	MOVLW       1
	MOVWF       _debris+39 
;space.c,314 :: 		debris[7].y = 20;
	MOVLW       20
	MOVWF       _debris+43 
;space.c,315 :: 		debris[7].x = 67;
	MOVLW       67
	MOVWF       _debris+42 
;space.c,316 :: 		debris[7].dir = 1;
	MOVLW       1
	MOVWF       _debris+45 
;space.c,317 :: 		debris[8].y = 30;
	MOVLW       30
	MOVWF       _debris+49 
;space.c,318 :: 		debris[8].x = 93;
	MOVLW       93
	MOVWF       _debris+48 
;space.c,319 :: 		debris[8].dir = 1;
	MOVLW       1
	MOVWF       _debris+51 
;space.c,320 :: 		debris[9].y = 28;
	MOVLW       28
	MOVWF       _debris+55 
;space.c,321 :: 		debris[9].x = 82;
	MOVLW       82
	MOVWF       _debris+54 
;space.c,322 :: 		debris[9].dir = 2;
	MOVLW       2
	MOVWF       _debris+57 
;space.c,323 :: 		debris[10].y = 38;
	MOVLW       38
	MOVWF       _debris+61 
;space.c,324 :: 		debris[10].x = 67;
	MOVLW       67
	MOVWF       _debris+60 
;space.c,325 :: 		debris[10].dir = 1;
	MOVLW       1
	MOVWF       _debris+63 
;space.c,326 :: 		debris[11].y = 42;
	MOVLW       42
	MOVWF       _debris+67 
;space.c,327 :: 		debris[11].x =5;
	MOVLW       5
	MOVWF       _debris+66 
;space.c,328 :: 		debris[11].dir = 1;
	MOVLW       1
	MOVWF       _debris+69 
;space.c,329 :: 		debris[12].y = 46;
	MOVLW       46
	MOVWF       _debris+73 
;space.c,330 :: 		debris[12].x = 10;
	MOVLW       10
	MOVWF       _debris+72 
;space.c,331 :: 		debris[12].dir = 1;
	MOVLW       1
	MOVWF       _debris+75 
;space.c,332 :: 		debris[13].y = 8;
	MOVLW       8
	MOVWF       _debris+79 
;space.c,333 :: 		debris[13].x = 76;
	MOVLW       76
	MOVWF       _debris+78 
;space.c,334 :: 		debris[13].dir = 2;
	MOVLW       2
	MOVWF       _debris+81 
;space.c,335 :: 		debris[14].y = 54;
	MOVLW       54
	MOVWF       _debris+85 
;space.c,336 :: 		debris[14].x = 20;
	MOVLW       20
	MOVWF       _debris+84 
;space.c,337 :: 		debris[14].dir = 1;
	MOVLW       1
	MOVWF       _debris+87 
;space.c,339 :: 		}
L_end_gen_debris:
	RETURN      0
; end of _gen_debris

_desdata_pack:

;space.c,341 :: 		void desdata_pack(){   // Funcion para extraer datos del paquete recibido por esclavo
;space.c,342 :: 		ship[0].y   =   info[0] - '0';
	MOVLW       48
	SUBWF       _info+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _ship+1 
;space.c,343 :: 		ship[1].y   =   info[1] - '0';
	MOVLW       48
	SUBWF       _info+1, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _ship+3 
;space.c,344 :: 		score[0]    =   info[2] - '0';
	MOVLW       48
	SUBWF       _info+2, 0 
	MOVWF       _score+0 
;space.c,345 :: 		score[1]    =   info[3] - '0';
	MOVLW       48
	SUBWF       _info+3, 0 
	MOVWF       _score+1 
;space.c,346 :: 		}
L_end_desdata_pack:
	RETURN      0
; end of _desdata_pack

_output_character:

;space.c,348 :: 		void output_character(char charValue){
;space.c,349 :: 		while (UART1_Tx_Idle()!= 1);
L_output_character78:
	CALL        _UART1_Tx_Idle+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_output_character79
	GOTO        L_output_character78
L_output_character79:
;space.c,350 :: 		UART1_Write(charValue);
	MOVF        FARG_output_character_charValue+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;space.c,351 :: 		}
L_end_output_character:
	RETURN      0
; end of _output_character

_input_character:

;space.c,353 :: 		void input_character(char char_dir){
;space.c,354 :: 		while (UART1_Data_Ready() == 0);
L_input_character80:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_input_character81
	GOTO        L_input_character80
L_input_character81:
;space.c,355 :: 		char_dir = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_input_character_char_dir+0 
;space.c,356 :: 		}
L_end_input_character:
	RETURN      0
; end of _input_character

_output_data:

;space.c,358 :: 		void output_data(char *serial_dir){
;space.c,359 :: 		while (UART1_Tx_Idle()!= 1);
L_output_data82:
	CALL        _UART1_Tx_Idle+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_output_data83
	GOTO        L_output_data82
L_output_data83:
;space.c,360 :: 		UART1_Write_Text(serial_dir);
	MOVF        FARG_output_data_serial_dir+0, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVF        FARG_output_data_serial_dir+1, 0 
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;space.c,361 :: 		}
L_end_output_data:
	RETURN      0
; end of _output_data

_data_pack:

;space.c,363 :: 		void data_pack() {  //Funcion para empaquetar datos a enviar     ///serial_pack_data //Hay que ver como hago para enviar la ubicacion en y de cada asteroide
;space.c,365 :: 		info[0] = ship[0].y + '0';
	MOVLW       48
	ADDWF       _ship+1, 0 
	MOVWF       _info+0 
;space.c,366 :: 		info[1] = ship[1].y + '0';
	MOVLW       48
	ADDWF       _ship+3, 0 
	MOVWF       _info+1 
;space.c,367 :: 		info[2] = score[0] + '0';
	MOVLW       48
	ADDWF       _score+0, 0 
	MOVWF       _info+2 
;space.c,368 :: 		info[3] = score[1] + '0';
	MOVLW       48
	ADDWF       _score+1, 0 
	MOVWF       _info+3 
;space.c,369 :: 		info[4] = 'P';
	MOVLW       80
	MOVWF       _info+4 
;space.c,370 :: 		}
L_end_data_pack:
	RETURN      0
; end of _data_pack

_save_old_data:

;space.c,372 :: 		void save_old_data(){
;space.c,373 :: 		unsigned short i = 0;
	CLRF        save_old_data_i_L0+0 
;space.c,374 :: 		old_ship[0].y = ship[0].y;
	MOVF        _ship+1, 0 
	MOVWF       _old_ship+1 
;space.c,375 :: 		old_ship[1].y = ship[1].y;
	MOVF        _ship+3, 0 
	MOVWF       _old_ship+3 
;space.c,376 :: 		for(i = 0; i < 15; i++){
	CLRF        save_old_data_i_L0+0 
L_save_old_data84:
	MOVLW       15
	SUBWF       save_old_data_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_save_old_data85
;space.c,377 :: 		old_debris[i].x = debris[i].x;
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        save_old_data_i_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _old_debris+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_old_debris+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       _debris+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;space.c,378 :: 		old_debris[i].y = debris[i].y;
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        save_old_data_i_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _old_debris+0
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       hi_addr(_old_debris+0)
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVLW       1
	ADDWF       R2, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R3, 0 
	MOVWF       FSR1H 
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;space.c,379 :: 		old_debris[i].dx = debris[i].dx;
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        save_old_data_i_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _old_debris+0
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       hi_addr(_old_debris+0)
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVLW       2
	ADDWF       R2, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R3, 0 
	MOVWF       FSR1H 
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;space.c,380 :: 		old_debris[i].dir = debris[i].dir;
	MOVLW       6
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        save_old_data_i_L0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _old_debris+0
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       hi_addr(_old_debris+0)
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVLW       3
	ADDWF       R2, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R3, 0 
	MOVWF       FSR1H 
	MOVLW       _debris+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_debris+0)
	ADDWFC      R1, 1 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;space.c,376 :: 		for(i = 0; i < 15; i++){
	INCF        save_old_data_i_L0+0, 1 
;space.c,381 :: 		}
	GOTO        L_save_old_data84
L_save_old_data85:
;space.c,382 :: 		}
L_end_save_old_data:
	RETURN      0
; end of _save_old_data

_main:

;space.c,438 :: 		void main(){
;space.c,440 :: 		unsigned short Master = 0;
	CLRF        main_Master_L0+0 
	MOVLW       48
	MOVWF       main_Master_slave_L0+0 
	CLRF        main_move_other_L0+0 
	MOVLW       57
	MOVWF       main_win_L0+0 
;space.c,449 :: 		PORTC = 0;      //Establecemos las entradas en 0 para evitar conflictos
	CLRF        PORTC+0 
;space.c,450 :: 		TRISC.F0 = 1;   //Entrada para el eje y
	BSF         TRISC+0, 0 
;space.c,451 :: 		TRISC.F1 = 1;   // Entrada para el boton del joystick
	BSF         TRISC+0, 1 
;space.c,453 :: 		Glcd_Init();
	CALL        _Glcd_Init+0, 0
;space.c,454 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;space.c,456 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;space.c,457 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main87:
	DECFSZ      R13, 1, 1
	BRA         L_main87
	DECFSZ      R12, 1, 1
	BRA         L_main87
	DECFSZ      R11, 1, 1
	BRA         L_main87
	NOP
	NOP
;space.c,468 :: 		init();
	CALL        _init+0, 0
;space.c,470 :: 		while(1){
L_main88:
;space.c,471 :: 		switch(flag){
	GOTO        L_main90
;space.c,472 :: 		case 0:
L_main92:
;space.c,473 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;space.c,474 :: 		while(1){
L_main93:
;space.c,475 :: 		y = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _y+0 
;space.c,476 :: 		if(y <= 5){
	MOVF        R0, 0 
	SUBLW       5
	BTFSS       STATUS+0, 0 
	GOTO        L_main95
;space.c,477 :: 		Glcd_Write_Text("one player",15,0,1);
	MOVLW       ?lstr7_space+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr7_space+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       15
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	CLRF        FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;space.c,478 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main96:
	DECFSZ      R13, 1, 1
	BRA         L_main96
	DECFSZ      R12, 1, 1
	BRA         L_main96
	DECFSZ      R11, 1, 1
	BRA         L_main96
	NOP
	NOP
;space.c,479 :: 		while(1){
L_main97:
;space.c,480 :: 		y = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _y+0 
;space.c,481 :: 		if(Button(&PORTC,1,1,0)){
	MOVLW       PORTC+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main99
;space.c,482 :: 		flag = 1;
	MOVLW       1
	MOVWF       _flag+0 
;space.c,483 :: 		break;
	GOTO        L_main98
;space.c,484 :: 		}
L_main99:
;space.c,485 :: 		else if(y >= 200){
	MOVLW       200
	SUBWF       _y+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main101
;space.c,486 :: 		break;
	GOTO        L_main98
;space.c,487 :: 		}
L_main101:
;space.c,488 :: 		}Glcd_Fill(0x00);
	GOTO        L_main97
L_main98:
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;space.c,489 :: 		}
	GOTO        L_main102
L_main95:
;space.c,490 :: 		else if(y >= 250){
	MOVLW       250
	SUBWF       _y+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main103
;space.c,491 :: 		Glcd_Write_Text("multiplayer",15,0,1);
	MOVLW       ?lstr8_space+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr8_space+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	MOVLW       15
	MOVWF       FARG_Glcd_Write_Text_x_pos+0 
	CLRF        FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;space.c,492 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main104:
	DECFSZ      R13, 1, 1
	BRA         L_main104
	DECFSZ      R12, 1, 1
	BRA         L_main104
	DECFSZ      R11, 1, 1
	BRA         L_main104
	NOP
	NOP
;space.c,493 :: 		while(1){
L_main105:
;space.c,494 :: 		y = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _y+0 
;space.c,495 :: 		if(Button(&PORTC,1,1,0)){
	MOVLW       PORTC+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main107
;space.c,496 :: 		flag = 2;
	MOVLW       2
	MOVWF       _flag+0 
;space.c,497 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;space.c,498 :: 		break;
	GOTO        L_main106
;space.c,499 :: 		}
L_main107:
;space.c,500 :: 		else if(y <= 20){
	MOVF        _y+0, 0 
	SUBLW       20
	BTFSS       STATUS+0, 0 
	GOTO        L_main109
;space.c,501 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;space.c,502 :: 		break;
	GOTO        L_main106
;space.c,503 :: 		}
L_main109:
;space.c,504 :: 		}
	GOTO        L_main105
L_main106:
;space.c,505 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;space.c,506 :: 		}
	GOTO        L_main110
L_main103:
;space.c,507 :: 		else if(flag == 1 || flag == 2){
	MOVF        _flag+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L__main167
	MOVF        _flag+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L__main167
	GOTO        L_main113
L__main167:
;space.c,508 :: 		break;
	GOTO        L_main94
;space.c,509 :: 		}
L_main113:
L_main110:
L_main102:
;space.c,510 :: 		}
	GOTO        L_main93
L_main94:
;space.c,511 :: 		Master = 0;
	CLRF        main_Master_L0+0 
;space.c,512 :: 		break;
	GOTO        L_main91
;space.c,514 :: 		case 1:
L_main114:
;space.c,515 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main115:
	DECFSZ      R13, 1, 1
	BRA         L_main115
	DECFSZ      R12, 1, 1
	BRA         L_main115
	DECFSZ      R11, 1, 1
	BRA         L_main115
	NOP
;space.c,516 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;space.c,517 :: 		init();
	CALL        _init+0, 0
;space.c,518 :: 		gen_debris();
	CALL        _gen_debris+0, 0
;space.c,519 :: 		while(1){
L_main116:
;space.c,520 :: 		y = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _y+0 
;space.c,522 :: 		if(y >= 250){//HACIA ABAJO
	MOVLW       250
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main118
;space.c,523 :: 		draw_player(ship[0].x, ship[0].y, 0);//erase_player(x,  y,direction) 1 arriba / 2 abajo
	MOVF        _ship+0, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+1, 0 
	MOVWF       FARG_draw_player_y+0 
	CLRF        FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,524 :: 		move_player(0,2,1);//move_player(i, direction) 1 arriba / 2 abajo
	CLRF        FARG_move_player_i+0 
	MOVLW       2
	MOVWF       FARG_move_player_direction+0 
	MOVLW       1
	MOVWF       FARG_move_player_a+0 
	CALL        _move_player+0, 0
;space.c,525 :: 		draw_player(ship[0].x, ship[0].y, 1);//draw_player(x, y, color)
	MOVF        _ship+0, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+1, 0 
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,526 :: 		}
	GOTO        L_main119
L_main118:
;space.c,527 :: 		else if( y <= 20){//HACIA ARRIBA
	MOVF        _y+0, 0 
	SUBLW       20
	BTFSS       STATUS+0, 0 
	GOTO        L_main120
;space.c,528 :: 		draw_player(ship[0].x, ship[0].y, 0);//erase_player(x,  y,direction) 1 arriba / 2 abajo
	MOVF        _ship+0, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+1, 0 
	MOVWF       FARG_draw_player_y+0 
	CLRF        FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,529 :: 		move_player(0,1,1);//move_player(i, direction) 1 arriba / 2 abajo
	CLRF        FARG_move_player_i+0 
	MOVLW       1
	MOVWF       FARG_move_player_direction+0 
	MOVLW       1
	MOVWF       FARG_move_player_a+0 
	CALL        _move_player+0, 0
;space.c,530 :: 		draw_player(ship[0].x, ship[0].y, 1);//draw_player(x, y, color)
	MOVF        _ship+0, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+1, 0 
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,531 :: 		}
L_main120:
L_main119:
;space.c,533 :: 		move_ia();
	CALL        _move_ia+0, 0
;space.c,534 :: 		move_debris(1);
	MOVLW       1
	MOVWF       FARG_move_debris_a+0 
	CALL        _move_debris+0, 0
;space.c,535 :: 		draw_time();
	CALL        _draw_time+0, 0
;space.c,538 :: 		if(seconds > 15){
	MOVF        _seconds+0, 0 
	SUBLW       15
	BTFSC       STATUS+0, 0 
	GOTO        L_main121
;space.c,539 :: 		seconds = 0;
	CLRF        _seconds+0 
;space.c,540 :: 		minutes -=1;
	DECF        _minutes+0, 1 
;space.c,541 :: 		}
L_main121:
;space.c,542 :: 		if(minutes == 0){
	MOVF        _minutes+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main122
;space.c,543 :: 		game_over();
	CALL        _game_over+0, 0
;space.c,544 :: 		flag = 0;
	CLRF        _flag+0 
;space.c,545 :: 		break;
	GOTO        L_main117
;space.c,546 :: 		}
L_main122:
;space.c,547 :: 		seconds ++;
	INCF        _seconds+0, 1 
;space.c,548 :: 		debris_turn ++;
	INCF        _debris_turn+0, 1 
;space.c,549 :: 		turn ++;
	INCF        _turn+0, 1 
;space.c,550 :: 		turn2 ++;
	INCF        _turn2+0, 1 
;space.c,551 :: 		}
	GOTO        L_main116
L_main117:
;space.c,552 :: 		break;
	GOTO        L_main91
;space.c,554 :: 		case 2:
L_main123:
;space.c,555 :: 		init();
	CALL        _init+0, 0
;space.c,556 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main124:
	DECFSZ      R13, 1, 1
	BRA         L_main124
	DECFSZ      R12, 1, 1
	BRA         L_main124
	DECFSZ      R11, 1, 1
	BRA         L_main124
	NOP
;space.c,557 :: 		if(UART1_Data_Ready()==0){//Espera a que se conecte la otra consola
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main125
;space.c,558 :: 		while(1){        //Manda constantemente un 1, siempre y cuando no detecte la otra consola
L_main126:
;space.c,559 :: 		Glcd_Write_Text("Waiting for other player",0,0,1);
	MOVLW       ?lstr9_space+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr9_space+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	CLRF        FARG_Glcd_Write_Text_x_pos+0 
	CLRF        FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;space.c,560 :: 		UART1_Write('1');
	MOVLW       49
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;space.c,561 :: 		if(UART1_Data_Ready() ==1){
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main128
;space.c,562 :: 		break;
	GOTO        L_main127
;space.c,563 :: 		}
L_main128:
;space.c,564 :: 		}
	GOTO        L_main126
L_main127:
;space.c,565 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;space.c,566 :: 		}
	GOTO        L_main129
L_main125:
;space.c,568 :: 		Glcd_Write_Text("Press to start",0,0,1);//Una vez que se conecta,
	MOVLW       ?lstr10_space+0
	MOVWF       FARG_Glcd_Write_Text_text+0 
	MOVLW       hi_addr(?lstr10_space+0)
	MOVWF       FARG_Glcd_Write_Text_text+1 
	CLRF        FARG_Glcd_Write_Text_x_pos+0 
	CLRF        FARG_Glcd_Write_Text_page_num+0 
	MOVLW       1
	MOVWF       FARG_Glcd_Write_Text_color+0 
	CALL        _Glcd_Write_Text+0, 0
;space.c,570 :: 		while(1){
L_main130:
;space.c,571 :: 		UART1_Write('1');
	MOVLW       49
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;space.c,572 :: 		Master_slave = UART1_Read();//Asi el primero que presione, sera el maestro
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       main_Master_slave_L0+0 
;space.c,573 :: 		if(Button(&PORTC,1,1,0)){ //Y el que no presiono se le manda la senal para que
	MOVLW       PORTC+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main132
;space.c,574 :: 		UART1_Write('3');
	MOVLW       51
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;space.c,575 :: 		Master = 1;
	MOVLW       1
	MOVWF       main_Master_L0+0 
;space.c,576 :: 		break;
	GOTO        L_main131
;space.c,577 :: 		}
L_main132:
;space.c,578 :: 		else if(Master_slave == '3'){
	MOVF        main_Master_slave_L0+0, 0 
	XORLW       51
	BTFSS       STATUS+0, 2 
	GOTO        L_main134
;space.c,579 :: 		Master = 2;
	MOVLW       2
	MOVWF       main_Master_L0+0 
;space.c,580 :: 		break;
	GOTO        L_main131
;space.c,581 :: 		}
L_main134:
;space.c,582 :: 		}
	GOTO        L_main130
L_main131:
;space.c,584 :: 		Glcd_Fill(0x00);
	CLRF        FARG_Glcd_Fill_pattern+0 
	CALL        _Glcd_Fill+0, 0
;space.c,585 :: 		}
L_main129:
;space.c,586 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main135:
	DECFSZ      R13, 1, 1
	BRA         L_main135
	DECFSZ      R12, 1, 1
	BRA         L_main135
	DECFSZ      R11, 1, 1
	BRA         L_main135
	NOP
	NOP
;space.c,588 :: 		if(Master == 1){
	MOVF        main_Master_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main136
;space.c,589 :: 		gen_debris();
	CALL        _gen_debris+0, 0
;space.c,590 :: 		draw_player(ship[0].x, ship[0].y, 1);
	MOVF        _ship+0, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+1, 0 
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,591 :: 		draw_player(ship[1].x, ship[1].y, 1);
	MOVF        _ship+2, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+3, 0 
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,592 :: 		while(1){
L_main137:
;space.c,593 :: 		y = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _y+0 
;space.c,595 :: 		if(y >= 250){
	MOVLW       250
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main139
;space.c,596 :: 		draw_player(ship[0].x, ship[0].y, 0); //2 hacia abajo
	MOVF        _ship+0, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+1, 0 
	MOVWF       FARG_draw_player_y+0 
	CLRF        FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,597 :: 		move_player(0,2,1);
	CLRF        FARG_move_player_i+0 
	MOVLW       2
	MOVWF       FARG_move_player_direction+0 
	MOVLW       1
	MOVWF       FARG_move_player_a+0 
	CALL        _move_player+0, 0
;space.c,598 :: 		draw_player(ship[0].x, ship[0].y,1);
	MOVF        _ship+0, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+1, 0 
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,600 :: 		}
	GOTO        L_main140
L_main139:
;space.c,601 :: 		else if(y <= 5){
	MOVF        _y+0, 0 
	SUBLW       5
	BTFSS       STATUS+0, 0 
	GOTO        L_main141
;space.c,602 :: 		draw_player(ship[0].x, ship[0].y, 0); //1 hacia arriba
	MOVF        _ship+0, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+1, 0 
	MOVWF       FARG_draw_player_y+0 
	CLRF        FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,603 :: 		move_player(0,1,1);
	CLRF        FARG_move_player_i+0 
	MOVLW       1
	MOVWF       FARG_move_player_direction+0 
	MOVLW       1
	MOVWF       FARG_move_player_a+0 
	CALL        _move_player+0, 0
;space.c,604 :: 		draw_player(ship[0].x, ship[0].y,1);
	MOVF        _ship+0, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+1, 0 
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,605 :: 		}
L_main141:
L_main140:
;space.c,606 :: 		while(UART1_Data_Ready()==0);
L_main142:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main143
	GOTO        L_main142
L_main143:
;space.c,608 :: 		if(UART1_Read() == '1'){
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_main144
;space.c,609 :: 		draw_player(ship[1].x, ship[1].y, 0); //2 hacia abajo
	MOVF        _ship+2, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+3, 0 
	MOVWF       FARG_draw_player_y+0 
	CLRF        FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,610 :: 		move_player(1,2,1);
	MOVLW       1
	MOVWF       FARG_move_player_i+0 
	MOVLW       2
	MOVWF       FARG_move_player_direction+0 
	MOVLW       1
	MOVWF       FARG_move_player_a+0 
	CALL        _move_player+0, 0
;space.c,611 :: 		draw_player(ship[1].x, ship[1].y,1);
	MOVF        _ship+2, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+3, 0 
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,612 :: 		}
	GOTO        L_main145
L_main144:
;space.c,613 :: 		else if(UART1_Read ()== '2'){
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_main146
;space.c,614 :: 		draw_player(ship[1].x, ship[1].y, 0); //2 hacia abajo
	MOVF        _ship+2, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+3, 0 
	MOVWF       FARG_draw_player_y+0 
	CLRF        FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,615 :: 		move_player(1,1,1);
	MOVLW       1
	MOVWF       FARG_move_player_i+0 
	MOVLW       1
	MOVWF       FARG_move_player_direction+0 
	MOVLW       1
	MOVWF       FARG_move_player_a+0 
	CALL        _move_player+0, 0
;space.c,616 :: 		draw_player(ship[1].x, ship[1].y,1);
	MOVF        _ship+2, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+3, 0 
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,617 :: 		}
L_main146:
L_main145:
;space.c,619 :: 		move_debris(1); //para no usar retrasos
	MOVLW       1
	MOVWF       FARG_move_debris_a+0 
	CALL        _move_debris+0, 0
;space.c,620 :: 		draw_time();
	CALL        _draw_time+0, 0
;space.c,621 :: 		data_pack();
	CALL        _data_pack+0, 0
;space.c,622 :: 		output_data(info);
	MOVLW       _info+0
	MOVWF       FARG_output_data_serial_dir+0 
	MOVLW       hi_addr(_info+0)
	MOVWF       FARG_output_data_serial_dir+1 
	CALL        _output_data+0, 0
;space.c,627 :: 		while (UART1_Tx_Idle() != 1);
L_main147:
	CALL        _UART1_Tx_Idle+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main148
	GOTO        L_main147
L_main148:
;space.c,629 :: 		if(seconds > 5){
	MOVF        _seconds+0, 0 
	SUBLW       5
	BTFSC       STATUS+0, 0 
	GOTO        L_main149
;space.c,630 :: 		seconds = 0;
	CLRF        _seconds+0 
;space.c,631 :: 		minutes -=1;
	DECF        _minutes+0, 1 
;space.c,632 :: 		}
L_main149:
;space.c,633 :: 		if(minutes == 0){
	MOVF        _minutes+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main150
;space.c,634 :: 		output_character(win);
	MOVF        main_win_L0+0, 0 
	MOVWF       FARG_output_character_charValue+0 
	CALL        _output_character+0, 0
;space.c,635 :: 		game_over_mult();
	CALL        _game_over_mult+0, 0
;space.c,636 :: 		flag = 0;
	CLRF        _flag+0 
;space.c,637 :: 		break;
	GOTO        L_main138
;space.c,638 :: 		}
L_main150:
;space.c,639 :: 		seconds ++;
	INCF        _seconds+0, 1 
;space.c,643 :: 		}
	GOTO        L_main137
L_main138:
;space.c,644 :: 		}
L_main136:
;space.c,646 :: 		if(Master == 2){
	MOVF        main_Master_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main151
;space.c,647 :: 		gen_debris();
	CALL        _gen_debris+0, 0
;space.c,648 :: 		while(1){
L_main152:
;space.c,649 :: 		y = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _y+0 
;space.c,650 :: 		save_old_data();
	CALL        _save_old_data+0, 0
;space.c,652 :: 		if(y >= 250){        //Mover hacia abajo
	MOVLW       250
	SUBWF       _y+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main154
;space.c,653 :: 		move_other = '1';
	MOVLW       49
	MOVWF       main_move_other_L0+0 
;space.c,654 :: 		}
	GOTO        L_main155
L_main154:
;space.c,655 :: 		else if(y <= 5){         //Mover hacia arriba
	MOVF        _y+0, 0 
	SUBLW       5
	BTFSS       STATUS+0, 0 
	GOTO        L_main156
;space.c,656 :: 		move_other = '2';
	MOVLW       50
	MOVWF       main_move_other_L0+0 
;space.c,657 :: 		}
	GOTO        L_main157
L_main156:
;space.c,658 :: 		else{move_other = '0';}
	MOVLW       48
	MOVWF       main_move_other_L0+0 
L_main157:
L_main155:
;space.c,660 :: 		if(UART1_Read() == '9'){
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	XORLW       57
	BTFSS       STATUS+0, 2 
	GOTO        L_main158
;space.c,661 :: 		game_over_mult();
	CALL        _game_over_mult+0, 0
;space.c,662 :: 		flag = 0;
	CLRF        _flag+0 
;space.c,663 :: 		break;
	GOTO        L_main153
;space.c,664 :: 		}
L_main158:
;space.c,666 :: 		output_character(move_other);
	MOVF        main_move_other_L0+0, 0 
	MOVWF       FARG_output_character_charValue+0 
	CALL        _output_character+0, 0
;space.c,667 :: 		move_debris(1);
	MOVLW       1
	MOVWF       FARG_move_debris_a+0 
	CALL        _move_debris+0, 0
;space.c,669 :: 		while(UART1_Data_Ready()==0);
L_main159:
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main160
	GOTO        L_main159
L_main160:
;space.c,670 :: 		UART1_Read_Text(info, "P", 255);
	MOVLW       _info+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_info+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       ?lstr11_space+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(?lstr11_space+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       255
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;space.c,672 :: 		draw_player(ship[0].x, ship[0].y, 0);
	MOVF        _ship+0, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+1, 0 
	MOVWF       FARG_draw_player_y+0 
	CLRF        FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,673 :: 		draw_player(ship[1].x, ship[1].y, 0);
	MOVF        _ship+2, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+3, 0 
	MOVWF       FARG_draw_player_y+0 
	CLRF        FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,674 :: 		desdata_pack();
	CALL        _desdata_pack+0, 0
;space.c,675 :: 		draw_player(ship[0].x, ship[0].y, 1);
	MOVF        _ship+0, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+1, 0 
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,676 :: 		draw_player(ship[1].x, ship[1].y, 1);
	MOVF        _ship+2, 0 
	MOVWF       FARG_draw_player_x+0 
	MOVF        _ship+3, 0 
	MOVWF       FARG_draw_player_y+0 
	MOVLW       1
	MOVWF       FARG_draw_player_color+0 
	CALL        _draw_player+0, 0
;space.c,681 :: 		draw_time();
	CALL        _draw_time+0, 0
;space.c,683 :: 		if(seconds > 5){
	MOVF        _seconds+0, 0 
	SUBLW       5
	BTFSC       STATUS+0, 0 
	GOTO        L_main161
;space.c,684 :: 		seconds = 0;
	CLRF        _seconds+0 
;space.c,685 :: 		minutes -=1;
	DECF        _minutes+0, 1 
;space.c,686 :: 		}
L_main161:
;space.c,687 :: 		seconds ++;
	INCF        _seconds+0, 1 
;space.c,688 :: 		}
	GOTO        L_main152
L_main153:
;space.c,689 :: 		}
L_main151:
;space.c,690 :: 		break;
	GOTO        L_main91
;space.c,691 :: 		}
L_main90:
	MOVF        _flag+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_main92
	MOVF        _flag+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main114
	MOVF        _flag+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_main123
L_main91:
;space.c,692 :: 		}
	GOTO        L_main88
;space.c,693 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
