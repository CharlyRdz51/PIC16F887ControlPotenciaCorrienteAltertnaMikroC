
_ver:

;Proyecto Taladro.c,50 :: 		void ver(unsigned char F, const unsigned char txt[])
;Proyecto Taladro.c,53 :: 		for(i=0;i<16;i++)
	CLRF       _i+0
L_ver0:
	MOVLW      16
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_ver1
;Proyecto Taladro.c,55 :: 		Lcd_chr(f,i+1,txt[i]);
	MOVF       FARG_ver_F+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	INCF       _i+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _i+0, 0
	ADDWF      FARG_ver_txt+0, 0
	MOVWF      R0+0
	MOVF       FARG_ver_txt+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Proyecto Taladro.c,53 :: 		for(i=0;i<16;i++)
	INCF       _i+0, 1
;Proyecto Taladro.c,56 :: 		}
	GOTO       L_ver0
L_ver1:
;Proyecto Taladro.c,57 :: 		}
L_end_ver:
	RETURN
; end of _ver

_mostrar:

;Proyecto Taladro.c,59 :: 		void mostrar(){
;Proyecto Taladro.c,60 :: 		Inttostr(digitos,cantidad);
	MOVF       _Digitos+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _Digitos+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _cantidad+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Proyecto Taladro.c,61 :: 		ver(1,txt28);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt28+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt28+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,62 :: 		Lcd_out(2,1,cantidad);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _cantidad+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Proyecto Taladro.c,63 :: 		Lcd_Chr_Cp('%');
	MOVLW      37
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Proyecto Taladro.c,65 :: 		}
L_end_mostrar:
	RETURN
; end of _mostrar

_registro1:

;Proyecto Taladro.c,68 :: 		void registro1()
;Proyecto Taladro.c,70 :: 		buffer = 0;
	CLRF       _buffer+0
;Proyecto Taladro.c,71 :: 		Digitos = 0;
	CLRF       _Digitos+0
	CLRF       _Digitos+1
;Proyecto Taladro.c,72 :: 		while (1)
L_registro13:
;Proyecto Taladro.c,75 :: 		teclado();
	CALL       _teclado+0
;Proyecto Taladro.c,77 :: 		if ((buffer >= '0')&&(buffer <= '9'))
	MOVLW      48
	SUBWF      _buffer+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_registro17
	MOVF       _buffer+0, 0
	SUBLW      57
	BTFSS      STATUS+0, 0
	GOTO       L_registro17
L__registro159:
;Proyecto Taladro.c,79 :: 		Lcd_Chr_Cp(buffer);
	MOVF       _buffer+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Proyecto Taladro.c,80 :: 		Digitos =Digitos*10 + (buffer - 48);
	MOVF       _Digitos+0, 0
	MOVWF      R0+0
	MOVF       _Digitos+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      48
	SUBWF      _buffer+0, 0
	MOVWF      R2+0
	CLRF       R2+1
	BTFSS      STATUS+0, 0
	DECF       R2+1, 1
	MOVF       R2+0, 0
	ADDWF      R0+0, 0
	MOVWF      _Digitos+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 0
	MOVWF      _Digitos+1
;Proyecto Taladro.c,81 :: 		}
L_registro17:
;Proyecto Taladro.c,82 :: 		if(buffer == '*'){
	MOVF       _buffer+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_registro18
;Proyecto Taladro.c,83 :: 		n=1;
	MOVLW      1
	MOVWF      _n+0
;Proyecto Taladro.c,84 :: 		break;
	GOTO       L_registro14
;Proyecto Taladro.c,85 :: 		}
L_registro18:
;Proyecto Taladro.c,86 :: 		}
	GOTO       L_registro13
L_registro14:
;Proyecto Taladro.c,87 :: 		}
L_end_registro1:
	RETURN
; end of _registro1

_Potencia:

;Proyecto Taladro.c,90 :: 		void Potencia()
;Proyecto Taladro.c,92 :: 		if(n == 1)
	MOVF       _n+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Potencia9
;Proyecto Taladro.c,95 :: 		mostrar();
	CALL       _mostrar+0
;Proyecto Taladro.c,96 :: 		PORTD = 0xF0;
	MOVLW      240
	MOVWF      PORTD+0
;Proyecto Taladro.c,97 :: 		while(PORTD==0xF0){
L_Potencia10:
	MOVF       PORTD+0, 0
	XORLW      240
	BTFSS      STATUS+0, 2
	GOTO       L_Potencia11
;Proyecto Taladro.c,98 :: 		while(PORTE.F1==0);
L_Potencia12:
	BTFSC      PORTE+0, 1
	GOTO       L_Potencia13
	GOTO       L_Potencia12
L_Potencia13:
;Proyecto Taladro.c,99 :: 		for(t=100;t>=Digitos;t--)
	MOVLW      100
	MOVWF      _t+0
L_Potencia14:
	MOVF       _Digitos+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Potencia64
	MOVF       _Digitos+0, 0
	SUBWF      _t+0, 0
L__Potencia64:
	BTFSS      STATUS+0, 0
	GOTO       L_Potencia15
;Proyecto Taladro.c,101 :: 		delay_us(34);
	MOVLW      22
	MOVWF      R13+0
L_Potencia17:
	DECFSZ     R13+0, 1
	GOTO       L_Potencia17
	NOP
;Proyecto Taladro.c,99 :: 		for(t=100;t>=Digitos;t--)
	DECF       _t+0, 1
;Proyecto Taladro.c,102 :: 		}
	GOTO       L_Potencia14
L_Potencia15:
;Proyecto Taladro.c,103 :: 		PORTE.F0=1;
	BSF        PORTE+0, 0
;Proyecto Taladro.c,104 :: 		delay_us(5);
	MOVLW      3
	MOVWF      R13+0
L_Potencia18:
	DECFSZ     R13+0, 1
	GOTO       L_Potencia18
;Proyecto Taladro.c,105 :: 		PORTE.F0=0;
	BCF        PORTE+0, 0
;Proyecto Taladro.c,106 :: 		}
	GOTO       L_Potencia10
L_Potencia11:
;Proyecto Taladro.c,107 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto Taladro.c,108 :: 		}
L_Potencia9:
;Proyecto Taladro.c,109 :: 		}
L_end_Potencia:
	RETURN
; end of _Potencia

_teclado:

;Proyecto Taladro.c,111 :: 		void teclado()
;Proyecto Taladro.c,113 :: 		buffer = 0;
	CLRF       _buffer+0
;Proyecto Taladro.c,114 :: 		PORTD = 0xF0;
	MOVLW      240
	MOVWF      PORTD+0
;Proyecto Taladro.c,115 :: 		if (PORTD != 0xF0)
	MOVF       PORTD+0, 0
	XORLW      240
	BTFSC      STATUS+0, 2
	GOTO       L_teclado19
;Proyecto Taladro.c,117 :: 		PORTD = 0xFE;
	MOVLW      254
	MOVWF      PORTD+0
;Proyecto Taladro.c,118 :: 		switch (PORTD)
	GOTO       L_teclado20
;Proyecto Taladro.c,120 :: 		case 0xEE: buffer = '1'; break;
L_teclado22:
	MOVLW      49
	MOVWF      _buffer+0
	GOTO       L_teclado21
;Proyecto Taladro.c,121 :: 		case 0xDE: buffer = '2'; break;
L_teclado23:
	MOVLW      50
	MOVWF      _buffer+0
	GOTO       L_teclado21
;Proyecto Taladro.c,122 :: 		case 0xBE: buffer = '3'; break;
L_teclado24:
	MOVLW      51
	MOVWF      _buffer+0
	GOTO       L_teclado21
;Proyecto Taladro.c,123 :: 		case 0x7E: buffer = 'A'; break;
L_teclado25:
	MOVLW      65
	MOVWF      _buffer+0
	GOTO       L_teclado21
;Proyecto Taladro.c,124 :: 		}
L_teclado20:
	MOVF       PORTD+0, 0
	XORLW      238
	BTFSC      STATUS+0, 2
	GOTO       L_teclado22
	MOVF       PORTD+0, 0
	XORLW      222
	BTFSC      STATUS+0, 2
	GOTO       L_teclado23
	MOVF       PORTD+0, 0
	XORLW      190
	BTFSC      STATUS+0, 2
	GOTO       L_teclado24
	MOVF       PORTD+0, 0
	XORLW      126
	BTFSC      STATUS+0, 2
	GOTO       L_teclado25
L_teclado21:
;Proyecto Taladro.c,125 :: 		PORTD = 0xFD;
	MOVLW      253
	MOVWF      PORTD+0
;Proyecto Taladro.c,126 :: 		switch (PORTD)
	GOTO       L_teclado26
;Proyecto Taladro.c,128 :: 		case 0xED: buffer = '4'; break;
L_teclado28:
	MOVLW      52
	MOVWF      _buffer+0
	GOTO       L_teclado27
;Proyecto Taladro.c,129 :: 		case 0xDD: buffer = '5'; break;
L_teclado29:
	MOVLW      53
	MOVWF      _buffer+0
	GOTO       L_teclado27
;Proyecto Taladro.c,130 :: 		case 0xBD: buffer = '6'; break;
L_teclado30:
	MOVLW      54
	MOVWF      _buffer+0
	GOTO       L_teclado27
;Proyecto Taladro.c,131 :: 		case 0x7D: buffer = 'B'; break;
L_teclado31:
	MOVLW      66
	MOVWF      _buffer+0
	GOTO       L_teclado27
;Proyecto Taladro.c,132 :: 		}
L_teclado26:
	MOVF       PORTD+0, 0
	XORLW      237
	BTFSC      STATUS+0, 2
	GOTO       L_teclado28
	MOVF       PORTD+0, 0
	XORLW      221
	BTFSC      STATUS+0, 2
	GOTO       L_teclado29
	MOVF       PORTD+0, 0
	XORLW      189
	BTFSC      STATUS+0, 2
	GOTO       L_teclado30
	MOVF       PORTD+0, 0
	XORLW      125
	BTFSC      STATUS+0, 2
	GOTO       L_teclado31
L_teclado27:
;Proyecto Taladro.c,133 :: 		PORTD = 0xFB;
	MOVLW      251
	MOVWF      PORTD+0
;Proyecto Taladro.c,134 :: 		switch (PORTD)
	GOTO       L_teclado32
;Proyecto Taladro.c,136 :: 		case 0xEB: buffer = '7'; break;
L_teclado34:
	MOVLW      55
	MOVWF      _buffer+0
	GOTO       L_teclado33
;Proyecto Taladro.c,137 :: 		case 0xDB: buffer = '8'; break;
L_teclado35:
	MOVLW      56
	MOVWF      _buffer+0
	GOTO       L_teclado33
;Proyecto Taladro.c,138 :: 		case 0xBB: buffer = '9'; break;
L_teclado36:
	MOVLW      57
	MOVWF      _buffer+0
	GOTO       L_teclado33
;Proyecto Taladro.c,139 :: 		case 0x7B: buffer = 'C'; break;
L_teclado37:
	MOVLW      67
	MOVWF      _buffer+0
	GOTO       L_teclado33
;Proyecto Taladro.c,140 :: 		}
L_teclado32:
	MOVF       PORTD+0, 0
	XORLW      235
	BTFSC      STATUS+0, 2
	GOTO       L_teclado34
	MOVF       PORTD+0, 0
	XORLW      219
	BTFSC      STATUS+0, 2
	GOTO       L_teclado35
	MOVF       PORTD+0, 0
	XORLW      187
	BTFSC      STATUS+0, 2
	GOTO       L_teclado36
	MOVF       PORTD+0, 0
	XORLW      123
	BTFSC      STATUS+0, 2
	GOTO       L_teclado37
L_teclado33:
;Proyecto Taladro.c,141 :: 		PORTD = 0xF7;
	MOVLW      247
	MOVWF      PORTD+0
;Proyecto Taladro.c,142 :: 		switch (PORTD)
	GOTO       L_teclado38
;Proyecto Taladro.c,144 :: 		case 0xE7: buffer = '*'; break;
L_teclado40:
	MOVLW      42
	MOVWF      _buffer+0
	GOTO       L_teclado39
;Proyecto Taladro.c,145 :: 		case 0xD7: buffer = '0'; break;
L_teclado41:
	MOVLW      48
	MOVWF      _buffer+0
	GOTO       L_teclado39
;Proyecto Taladro.c,146 :: 		case 0xB7: buffer = '#'; break;
L_teclado42:
	MOVLW      35
	MOVWF      _buffer+0
	GOTO       L_teclado39
;Proyecto Taladro.c,147 :: 		case 0x77: buffer = 'D'; break;
L_teclado43:
	MOVLW      68
	MOVWF      _buffer+0
	GOTO       L_teclado39
;Proyecto Taladro.c,148 :: 		}
L_teclado38:
	MOVF       PORTD+0, 0
	XORLW      231
	BTFSC      STATUS+0, 2
	GOTO       L_teclado40
	MOVF       PORTD+0, 0
	XORLW      215
	BTFSC      STATUS+0, 2
	GOTO       L_teclado41
	MOVF       PORTD+0, 0
	XORLW      183
	BTFSC      STATUS+0, 2
	GOTO       L_teclado42
	MOVF       PORTD+0, 0
	XORLW      119
	BTFSC      STATUS+0, 2
	GOTO       L_teclado43
L_teclado39:
;Proyecto Taladro.c,149 :: 		}
L_teclado19:
;Proyecto Taladro.c,150 :: 		PORTD = 0xF0;
	MOVLW      240
	MOVWF      PORTD+0
;Proyecto Taladro.c,151 :: 		while (PORTD != 0xF0);
L_teclado44:
	MOVF       PORTD+0, 0
	XORLW      240
	BTFSC      STATUS+0, 2
	GOTO       L_teclado45
	GOTO       L_teclado44
L_teclado45:
;Proyecto Taladro.c,152 :: 		delay_ms(51);
	MOVLW      133
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_teclado46:
	DECFSZ     R13+0, 1
	GOTO       L_teclado46
	DECFSZ     R12+0, 1
	GOTO       L_teclado46
	NOP
;Proyecto Taladro.c,153 :: 		}
L_end_teclado:
	RETURN
; end of _teclado

_main:

;Proyecto Taladro.c,155 :: 		void main()
;Proyecto Taladro.c,157 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;Proyecto Taladro.c,158 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Proyecto Taladro.c,159 :: 		C1ON_bit = 0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Proyecto Taladro.c,160 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Proyecto Taladro.c,161 :: 		TRISB = 0;
	CLRF       TRISB+0
;Proyecto Taladro.c,162 :: 		PORTB = 0;
	CLRF       PORTB+0
;Proyecto Taladro.c,163 :: 		TRISD = 0xF0;
	MOVLW      240
	MOVWF      TRISD+0
;Proyecto Taladro.c,164 :: 		PORTD = 0xF0;
	MOVLW      240
	MOVWF      PORTD+0
;Proyecto Taladro.c,165 :: 		TRISE = 0x02;
	MOVLW      2
	MOVWF      TRISE+0
;Proyecto Taladro.c,166 :: 		PORTE = 0;
	CLRF       PORTE+0
;Proyecto Taladro.c,167 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Proyecto Taladro.c,168 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto Taladro.c,169 :: 		Lcd_cmd(_Lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto Taladro.c,171 :: 		ver(1,txt1);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt1+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt1+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,172 :: 		ver(2,txt2);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt2+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt2+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,173 :: 		delay_ms(Delay);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main47:
	DECFSZ     R13+0, 1
	GOTO       L_main47
	DECFSZ     R12+0, 1
	GOTO       L_main47
	DECFSZ     R11+0, 1
	GOTO       L_main47
	NOP
	NOP
;Proyecto Taladro.c,174 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto Taladro.c,175 :: 		ver(1,txt3);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt3+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt3+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,176 :: 		ver(2,txt4);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt4+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt4+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,177 :: 		delay_ms(Delay);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main48:
	DECFSZ     R13+0, 1
	GOTO       L_main48
	DECFSZ     R12+0, 1
	GOTO       L_main48
	DECFSZ     R11+0, 1
	GOTO       L_main48
	NOP
	NOP
;Proyecto Taladro.c,178 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto Taladro.c,179 :: 		ver(1,txt5);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt5+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt5+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,180 :: 		ver(2,txt6);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt6+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt6+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,181 :: 		delay_ms(Delay);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main49:
	DECFSZ     R13+0, 1
	GOTO       L_main49
	DECFSZ     R12+0, 1
	GOTO       L_main49
	DECFSZ     R11+0, 1
	GOTO       L_main49
	NOP
	NOP
;Proyecto Taladro.c,182 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto Taladro.c,183 :: 		ver(1,txt7);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt7+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt7+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,184 :: 		delay_ms(Delay);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main50:
	DECFSZ     R13+0, 1
	GOTO       L_main50
	DECFSZ     R12+0, 1
	GOTO       L_main50
	DECFSZ     R11+0, 1
	GOTO       L_main50
	NOP
	NOP
;Proyecto Taladro.c,185 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto Taladro.c,186 :: 		ver(1,txt10);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt10+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt10+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,187 :: 		ver(2,txt11);;
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt11+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt11+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,188 :: 		delay_ms(Delay);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main51:
	DECFSZ     R13+0, 1
	GOTO       L_main51
	DECFSZ     R12+0, 1
	GOTO       L_main51
	DECFSZ     R11+0, 1
	GOTO       L_main51
	NOP
	NOP
;Proyecto Taladro.c,189 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto Taladro.c,190 :: 		ver(1,txt13);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt13+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt13+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,191 :: 		ver(2,txt14);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt14+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt14+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,192 :: 		delay_ms(Delay);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main52:
	DECFSZ     R13+0, 1
	GOTO       L_main52
	DECFSZ     R12+0, 1
	GOTO       L_main52
	DECFSZ     R11+0, 1
	GOTO       L_main52
	NOP
	NOP
;Proyecto Taladro.c,193 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto Taladro.c,194 :: 		ver(1,txt16);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt16+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt16+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,195 :: 		ver(2,txt17);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt17+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt17+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,196 :: 		delay_ms(Delay);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main53:
	DECFSZ     R13+0, 1
	GOTO       L_main53
	DECFSZ     R12+0, 1
	GOTO       L_main53
	DECFSZ     R11+0, 1
	GOTO       L_main53
	NOP
	NOP
;Proyecto Taladro.c,197 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto Taladro.c,198 :: 		ver(1,txt18);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt18+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt18+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,199 :: 		delay_ms(Delay);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main54:
	DECFSZ     R13+0, 1
	GOTO       L_main54
	DECFSZ     R12+0, 1
	GOTO       L_main54
	DECFSZ     R11+0, 1
	GOTO       L_main54
	NOP
	NOP
;Proyecto Taladro.c,200 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto Taladro.c,201 :: 		ver(1,txt19);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt19+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt19+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,202 :: 		ver(2,txt20);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt20+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt20+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,203 :: 		delay_ms(Delay);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main55:
	DECFSZ     R13+0, 1
	GOTO       L_main55
	DECFSZ     R12+0, 1
	GOTO       L_main55
	DECFSZ     R11+0, 1
	GOTO       L_main55
	NOP
	NOP
;Proyecto Taladro.c,204 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto Taladro.c,205 :: 		ver(1,txt22);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt22+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt22+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,206 :: 		ver(2,txt21);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt21+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt21+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,207 :: 		delay_ms(Delay);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main56:
	DECFSZ     R13+0, 1
	GOTO       L_main56
	DECFSZ     R12+0, 1
	GOTO       L_main56
	DECFSZ     R11+0, 1
	GOTO       L_main56
	NOP
	NOP
;Proyecto Taladro.c,208 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto Taladro.c,209 :: 		while(1){
L_main57:
;Proyecto Taladro.c,210 :: 		ver(1,txt23);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt23+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt23+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto Taladro.c,211 :: 		lcd_out(2,5 ,"");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Proyecto_32Taladro+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Proyecto Taladro.c,212 :: 		registro1();
	CALL       _registro1+0
;Proyecto Taladro.c,213 :: 		Lcd_cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto Taladro.c,214 :: 		Potencia();
	CALL       _Potencia+0
;Proyecto Taladro.c,215 :: 		}
	GOTO       L_main57
;Proyecto Taladro.c,216 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
