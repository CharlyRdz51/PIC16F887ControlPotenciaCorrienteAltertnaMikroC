
_ver:

;Proyecto FInal.c,50 :: 		void ver(unsigned char F, const unsigned char txt[])
;Proyecto FInal.c,53 :: 		for(i=0;i<16;i++)
	CLRF       _i+0
L_ver0:
	MOVLW      16
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_ver1
;Proyecto FInal.c,55 :: 		Lcd_chr(f,i+1,txt[i]);
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
;Proyecto FInal.c,53 :: 		for(i=0;i<16;i++)
	INCF       _i+0, 1
;Proyecto FInal.c,56 :: 		}
	GOTO       L_ver0
L_ver1:
;Proyecto FInal.c,57 :: 		}
L_end_ver:
	RETURN
; end of _ver

_CapturarDatos:

;Proyecto FInal.c,58 :: 		unsigned char CapturarDatos()
;Proyecto FInal.c,60 :: 		unsigned char L,key=0;
;Proyecto FInal.c,66 :: 		}
L_end_CapturarDatos:
	RETURN
; end of _CapturarDatos

_registro1:

;Proyecto FInal.c,69 :: 		void registro1()
;Proyecto FInal.c,71 :: 		buffer = 0;
	CLRF       _buffer+0
;Proyecto FInal.c,72 :: 		Digitos = 0;
	CLRF       _Digitos+0
	CLRF       _Digitos+1
;Proyecto FInal.c,73 :: 		while (1)
L_registro13:
;Proyecto FInal.c,76 :: 		teclado();
	CALL       _teclado+0
;Proyecto FInal.c,78 :: 		if ((buffer >= '0')&&(buffer <= '9'))
	MOVLW      48
	SUBWF      _buffer+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_registro17
	MOVF       _buffer+0, 0
	SUBLW      57
	BTFSS      STATUS+0, 0
	GOTO       L_registro17
L__registro178:
;Proyecto FInal.c,80 :: 		Lcd_Chr_Cp(buffer);
	MOVF       _buffer+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Proyecto FInal.c,82 :: 		Digitos =Digitos*10 + (buffer - 48);
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
;Proyecto FInal.c,84 :: 		}
L_registro17:
;Proyecto FInal.c,85 :: 		if(buffer == '*'){
	MOVF       _buffer+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_registro18
;Proyecto FInal.c,86 :: 		n=1;
	MOVLW      1
	MOVWF      _n+0
;Proyecto FInal.c,87 :: 		break;
	GOTO       L_registro14
;Proyecto FInal.c,89 :: 		}
L_registro18:
;Proyecto FInal.c,90 :: 		}
	GOTO       L_registro13
L_registro14:
;Proyecto FInal.c,91 :: 		}
L_end_registro1:
	RETURN
; end of _registro1

_registro2:

;Proyecto FInal.c,94 :: 		void registro2()
;Proyecto FInal.c,96 :: 		buffer = 0;
	CLRF       _buffer+0
;Proyecto FInal.c,97 :: 		Digitos1 = 0;
	CLRF       _Digitos1+0
	CLRF       _Digitos1+1
;Proyecto FInal.c,98 :: 		while (1)
L_registro29:
;Proyecto FInal.c,101 :: 		teclado();
	CALL       _teclado+0
;Proyecto FInal.c,103 :: 		if ((buffer >= '0')&&(buffer <= '9'))
	MOVLW      48
	SUBWF      _buffer+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_registro213
	MOVF       _buffer+0, 0
	SUBLW      57
	BTFSS      STATUS+0, 0
	GOTO       L_registro213
L__registro279:
;Proyecto FInal.c,105 :: 		Lcd_Chr_Cp(buffer);
	MOVF       _buffer+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Proyecto FInal.c,106 :: 		Digitos1 =Digitos1*10 + (buffer - 48);
	MOVF       _Digitos1+0, 0
	MOVWF      R0+0
	MOVF       _Digitos1+1, 0
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
	MOVWF      _Digitos1+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 0
	MOVWF      _Digitos1+1
;Proyecto FInal.c,107 :: 		}
L_registro213:
;Proyecto FInal.c,108 :: 		if(buffer == '*'){
	MOVF       _buffer+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_registro214
;Proyecto FInal.c,109 :: 		n=2;
	MOVLW      2
	MOVWF      _n+0
;Proyecto FInal.c,110 :: 		break;
	GOTO       L_registro210
;Proyecto FInal.c,111 :: 		}
L_registro214:
;Proyecto FInal.c,112 :: 		}
	GOTO       L_registro29
L_registro210:
;Proyecto FInal.c,113 :: 		}
L_end_registro2:
	RETURN
; end of _registro2

_registro3:

;Proyecto FInal.c,115 :: 		void registro3()
;Proyecto FInal.c,117 :: 		buffer = 0;
	CLRF       _buffer+0
;Proyecto FInal.c,118 :: 		Digitos2 = 0;
	CLRF       _Digitos2+0
	CLRF       _Digitos2+1
;Proyecto FInal.c,119 :: 		while (1)
L_registro315:
;Proyecto FInal.c,122 :: 		teclado();
	CALL       _teclado+0
;Proyecto FInal.c,124 :: 		if ((buffer >= '0')&&(buffer <= '9'))
	MOVLW      48
	SUBWF      _buffer+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_registro319
	MOVF       _buffer+0, 0
	SUBLW      57
	BTFSS      STATUS+0, 0
	GOTO       L_registro319
L__registro380:
;Proyecto FInal.c,126 :: 		Lcd_Chr_Cp(buffer);
	MOVF       _buffer+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Proyecto FInal.c,127 :: 		Digitos2 =Digitos2*10 + (buffer - 48);
	MOVF       _Digitos2+0, 0
	MOVWF      R0+0
	MOVF       _Digitos2+1, 0
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
	MOVWF      _Digitos2+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 0
	MOVWF      _Digitos2+1
;Proyecto FInal.c,128 :: 		}
L_registro319:
;Proyecto FInal.c,129 :: 		if(buffer == '*'){
	MOVF       _buffer+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_registro320
;Proyecto FInal.c,130 :: 		n=3;
	MOVLW      3
	MOVWF      _n+0
;Proyecto FInal.c,131 :: 		break;
	GOTO       L_registro316
;Proyecto FInal.c,132 :: 		}
L_registro320:
;Proyecto FInal.c,133 :: 		}
	GOTO       L_registro315
L_registro316:
;Proyecto FInal.c,134 :: 		}
L_end_registro3:
	RETURN
; end of _registro3

_registro4:

;Proyecto FInal.c,136 :: 		void registro4()
;Proyecto FInal.c,138 :: 		buffer = 0;
	CLRF       _buffer+0
;Proyecto FInal.c,139 :: 		Digitos3 = 0;
	CLRF       _Digitos3+0
	CLRF       _Digitos3+1
;Proyecto FInal.c,140 :: 		while (1)
L_registro421:
;Proyecto FInal.c,143 :: 		teclado();
	CALL       _teclado+0
;Proyecto FInal.c,145 :: 		if ((buffer >= '0')&&(buffer <= '9'))
	MOVLW      48
	SUBWF      _buffer+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_registro425
	MOVF       _buffer+0, 0
	SUBLW      57
	BTFSS      STATUS+0, 0
	GOTO       L_registro425
L__registro481:
;Proyecto FInal.c,147 :: 		Lcd_Chr_Cp(buffer);
	MOVF       _buffer+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Proyecto FInal.c,148 :: 		Digitos3 =Digitos3*10 + (buffer - 48);
	MOVF       _Digitos3+0, 0
	MOVWF      R0+0
	MOVF       _Digitos3+1, 0
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
	MOVWF      _Digitos3+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 0
	MOVWF      _Digitos3+1
;Proyecto FInal.c,149 :: 		}
L_registro425:
;Proyecto FInal.c,150 :: 		if(buffer == '*'){
	MOVF       _buffer+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_registro426
;Proyecto FInal.c,151 :: 		n=4;
	MOVLW      4
	MOVWF      _n+0
;Proyecto FInal.c,152 :: 		break;
	GOTO       L_registro422
;Proyecto FInal.c,153 :: 		}
L_registro426:
;Proyecto FInal.c,154 :: 		}
	GOTO       L_registro421
L_registro422:
;Proyecto FInal.c,155 :: 		}
L_end_registro4:
	RETURN
; end of _registro4

_registro5:

;Proyecto FInal.c,157 :: 		void registro5()
;Proyecto FInal.c,159 :: 		buffer = 0;
	CLRF       _buffer+0
;Proyecto FInal.c,160 :: 		Digitos4 = 0;
	CLRF       _Digitos4+0
	CLRF       _Digitos4+1
;Proyecto FInal.c,161 :: 		while (1)
L_registro527:
;Proyecto FInal.c,164 :: 		teclado();
	CALL       _teclado+0
;Proyecto FInal.c,166 :: 		if ((buffer >= '0')&&(buffer <= '9'))
	MOVLW      48
	SUBWF      _buffer+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_registro531
	MOVF       _buffer+0, 0
	SUBLW      57
	BTFSS      STATUS+0, 0
	GOTO       L_registro531
L__registro582:
;Proyecto FInal.c,168 :: 		Lcd_Chr_Cp(buffer);
	MOVF       _buffer+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Proyecto FInal.c,169 :: 		Digitos4 =Digitos4*10 + (buffer - 48);
	MOVF       _Digitos4+0, 0
	MOVWF      R0+0
	MOVF       _Digitos4+1, 0
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
	MOVWF      _Digitos4+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R2+1, 0
	MOVWF      _Digitos4+1
;Proyecto FInal.c,170 :: 		}
L_registro531:
;Proyecto FInal.c,171 :: 		if(buffer == '*'){
	MOVF       _buffer+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L_registro532
;Proyecto FInal.c,172 :: 		n=5;
	MOVLW      5
	MOVWF      _n+0
;Proyecto FInal.c,173 :: 		break;
	GOTO       L_registro528
;Proyecto FInal.c,174 :: 		}
L_registro532:
;Proyecto FInal.c,175 :: 		}
	GOTO       L_registro527
L_registro528:
;Proyecto FInal.c,176 :: 		}
L_end_registro5:
	RETURN
; end of _registro5

_Secuencia:

;Proyecto FInal.c,178 :: 		void Secuencia()
;Proyecto FInal.c,180 :: 		if(n == 5)
	MOVF       _n+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_Secuencia33
;Proyecto FInal.c,183 :: 		for(x=0;x<=Digitos;x++){
	CLRF       _x+0
L_Secuencia34:
	MOVLW      0
	SUBWF      _Digitos+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Secuencia91
	MOVF       _x+0, 0
	SUBWF      _Digitos+0, 0
L__Secuencia91:
	BTFSS      STATUS+0, 0
	GOTO       L_Secuencia35
;Proyecto FInal.c,184 :: 		while(PORTE.F1==0);
L_Secuencia37:
	BTFSC      PORTE+0, 1
	GOTO       L_Secuencia38
	GOTO       L_Secuencia37
L_Secuencia38:
;Proyecto FInal.c,185 :: 		delay_us(88992);
	MOVLW      232
	MOVWF      R12+0
	MOVLW      36
	MOVWF      R13+0
L_Secuencia39:
	DECFSZ     R13+0, 1
	GOTO       L_Secuencia39
	DECFSZ     R12+0, 1
	GOTO       L_Secuencia39
	NOP
;Proyecto FInal.c,186 :: 		PORTE.F0=1;
	BSF        PORTE+0, 0
;Proyecto FInal.c,187 :: 		delay_us(10);
	MOVLW      6
	MOVWF      R13+0
L_Secuencia40:
	DECFSZ     R13+0, 1
	GOTO       L_Secuencia40
	NOP
;Proyecto FInal.c,188 :: 		PORTE.F0=0;
	BCF        PORTE+0, 0
;Proyecto FInal.c,183 :: 		for(x=0;x<=Digitos;x++){
	INCF       _x+0, 1
;Proyecto FInal.c,189 :: 		}
	GOTO       L_Secuencia34
L_Secuencia35:
;Proyecto FInal.c,190 :: 		}
L_Secuencia33:
;Proyecto FInal.c,191 :: 		}
L_end_Secuencia:
	RETURN
; end of _Secuencia

_teclado:

;Proyecto FInal.c,194 :: 		void teclado()
;Proyecto FInal.c,196 :: 		buffer = 0;
	CLRF       _buffer+0
;Proyecto FInal.c,197 :: 		PORTD = 0xF0;
	MOVLW      240
	MOVWF      PORTD+0
;Proyecto FInal.c,198 :: 		if (PORTD != 0xF0)
	MOVF       PORTD+0, 0
	XORLW      240
	BTFSC      STATUS+0, 2
	GOTO       L_teclado41
;Proyecto FInal.c,200 :: 		PORTD = 0xFE;
	MOVLW      254
	MOVWF      PORTD+0
;Proyecto FInal.c,201 :: 		switch (PORTD)
	GOTO       L_teclado42
;Proyecto FInal.c,203 :: 		case 0xEE: buffer = '1'; break;
L_teclado44:
	MOVLW      49
	MOVWF      _buffer+0
	GOTO       L_teclado43
;Proyecto FInal.c,204 :: 		case 0xDE: buffer = '2'; break;
L_teclado45:
	MOVLW      50
	MOVWF      _buffer+0
	GOTO       L_teclado43
;Proyecto FInal.c,205 :: 		case 0xBE: buffer = '3'; break;
L_teclado46:
	MOVLW      51
	MOVWF      _buffer+0
	GOTO       L_teclado43
;Proyecto FInal.c,206 :: 		case 0x7E: buffer = 'A'; break;
L_teclado47:
	MOVLW      65
	MOVWF      _buffer+0
	GOTO       L_teclado43
;Proyecto FInal.c,207 :: 		}
L_teclado42:
	MOVF       PORTD+0, 0
	XORLW      238
	BTFSC      STATUS+0, 2
	GOTO       L_teclado44
	MOVF       PORTD+0, 0
	XORLW      222
	BTFSC      STATUS+0, 2
	GOTO       L_teclado45
	MOVF       PORTD+0, 0
	XORLW      190
	BTFSC      STATUS+0, 2
	GOTO       L_teclado46
	MOVF       PORTD+0, 0
	XORLW      126
	BTFSC      STATUS+0, 2
	GOTO       L_teclado47
L_teclado43:
;Proyecto FInal.c,208 :: 		PORTD = 0xFD;
	MOVLW      253
	MOVWF      PORTD+0
;Proyecto FInal.c,209 :: 		switch (PORTD)
	GOTO       L_teclado48
;Proyecto FInal.c,211 :: 		case 0xED: buffer = '4'; break;
L_teclado50:
	MOVLW      52
	MOVWF      _buffer+0
	GOTO       L_teclado49
;Proyecto FInal.c,212 :: 		case 0xDD: buffer = '5'; break;
L_teclado51:
	MOVLW      53
	MOVWF      _buffer+0
	GOTO       L_teclado49
;Proyecto FInal.c,213 :: 		case 0xBD: buffer = '6'; break;
L_teclado52:
	MOVLW      54
	MOVWF      _buffer+0
	GOTO       L_teclado49
;Proyecto FInal.c,214 :: 		case 0x7D: buffer = 'B'; break;
L_teclado53:
	MOVLW      66
	MOVWF      _buffer+0
	GOTO       L_teclado49
;Proyecto FInal.c,215 :: 		}
L_teclado48:
	MOVF       PORTD+0, 0
	XORLW      237
	BTFSC      STATUS+0, 2
	GOTO       L_teclado50
	MOVF       PORTD+0, 0
	XORLW      221
	BTFSC      STATUS+0, 2
	GOTO       L_teclado51
	MOVF       PORTD+0, 0
	XORLW      189
	BTFSC      STATUS+0, 2
	GOTO       L_teclado52
	MOVF       PORTD+0, 0
	XORLW      125
	BTFSC      STATUS+0, 2
	GOTO       L_teclado53
L_teclado49:
;Proyecto FInal.c,216 :: 		PORTD = 0xFB;
	MOVLW      251
	MOVWF      PORTD+0
;Proyecto FInal.c,217 :: 		switch (PORTD)
	GOTO       L_teclado54
;Proyecto FInal.c,219 :: 		case 0xEB: buffer = '7'; break;
L_teclado56:
	MOVLW      55
	MOVWF      _buffer+0
	GOTO       L_teclado55
;Proyecto FInal.c,220 :: 		case 0xDB: buffer = '8'; break;
L_teclado57:
	MOVLW      56
	MOVWF      _buffer+0
	GOTO       L_teclado55
;Proyecto FInal.c,221 :: 		case 0xBB: buffer = '9'; break;
L_teclado58:
	MOVLW      57
	MOVWF      _buffer+0
	GOTO       L_teclado55
;Proyecto FInal.c,222 :: 		case 0x7B: buffer = 'C'; break;
L_teclado59:
	MOVLW      67
	MOVWF      _buffer+0
	GOTO       L_teclado55
;Proyecto FInal.c,223 :: 		}
L_teclado54:
	MOVF       PORTD+0, 0
	XORLW      235
	BTFSC      STATUS+0, 2
	GOTO       L_teclado56
	MOVF       PORTD+0, 0
	XORLW      219
	BTFSC      STATUS+0, 2
	GOTO       L_teclado57
	MOVF       PORTD+0, 0
	XORLW      187
	BTFSC      STATUS+0, 2
	GOTO       L_teclado58
	MOVF       PORTD+0, 0
	XORLW      123
	BTFSC      STATUS+0, 2
	GOTO       L_teclado59
L_teclado55:
;Proyecto FInal.c,224 :: 		PORTD = 0xF7;
	MOVLW      247
	MOVWF      PORTD+0
;Proyecto FInal.c,225 :: 		switch (PORTD)
	GOTO       L_teclado60
;Proyecto FInal.c,227 :: 		case 0xE7: buffer = '*'; break;
L_teclado62:
	MOVLW      42
	MOVWF      _buffer+0
	GOTO       L_teclado61
;Proyecto FInal.c,228 :: 		case 0xD7: buffer = '0'; break;
L_teclado63:
	MOVLW      48
	MOVWF      _buffer+0
	GOTO       L_teclado61
;Proyecto FInal.c,229 :: 		case 0xB7: buffer = '#'; break;
L_teclado64:
	MOVLW      35
	MOVWF      _buffer+0
	GOTO       L_teclado61
;Proyecto FInal.c,230 :: 		case 0x77: buffer = 'D'; break;
L_teclado65:
	MOVLW      68
	MOVWF      _buffer+0
	GOTO       L_teclado61
;Proyecto FInal.c,231 :: 		}
L_teclado60:
	MOVF       PORTD+0, 0
	XORLW      231
	BTFSC      STATUS+0, 2
	GOTO       L_teclado62
	MOVF       PORTD+0, 0
	XORLW      215
	BTFSC      STATUS+0, 2
	GOTO       L_teclado63
	MOVF       PORTD+0, 0
	XORLW      183
	BTFSC      STATUS+0, 2
	GOTO       L_teclado64
	MOVF       PORTD+0, 0
	XORLW      119
	BTFSC      STATUS+0, 2
	GOTO       L_teclado65
L_teclado61:
;Proyecto FInal.c,232 :: 		}
L_teclado41:
;Proyecto FInal.c,233 :: 		PORTD = 0xF0;
	MOVLW      240
	MOVWF      PORTD+0
;Proyecto FInal.c,234 :: 		while (PORTD != 0xF0);
L_teclado66:
	MOVF       PORTD+0, 0
	XORLW      240
	BTFSC      STATUS+0, 2
	GOTO       L_teclado67
	GOTO       L_teclado66
L_teclado67:
;Proyecto FInal.c,235 :: 		delay_ms(51);
	MOVLW      133
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_teclado68:
	DECFSZ     R13+0, 1
	GOTO       L_teclado68
	DECFSZ     R12+0, 1
	GOTO       L_teclado68
	NOP
;Proyecto FInal.c,236 :: 		}
L_end_teclado:
	RETURN
; end of _teclado

_main:

;Proyecto FInal.c,238 :: 		void main()
;Proyecto FInal.c,240 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;Proyecto FInal.c,241 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Proyecto FInal.c,242 :: 		C1ON_bit = 0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Proyecto FInal.c,243 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Proyecto FInal.c,244 :: 		TRISB = 0;
	CLRF       TRISB+0
;Proyecto FInal.c,245 :: 		PORTB = 0;
	CLRF       PORTB+0
;Proyecto FInal.c,246 :: 		TRISD = 0xF0;
	MOVLW      240
	MOVWF      TRISD+0
;Proyecto FInal.c,247 :: 		PORTD = 0xF0;
	MOVLW      240
	MOVWF      PORTD+0
;Proyecto FInal.c,248 :: 		TRISE = 0x02;
	MOVLW      2
	MOVWF      TRISE+0
;Proyecto FInal.c,249 :: 		PORTE = 0;
	CLRF       PORTE+0
;Proyecto FInal.c,250 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Proyecto FInal.c,251 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto FInal.c,252 :: 		Lcd_cmd(_Lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto FInal.c,254 :: 		ver(1,txt1);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt1+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt1+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,255 :: 		ver(2,txt2);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt2+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt2+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,256 :: 		delay_ms(Delay);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main69:
	DECFSZ     R13+0, 1
	GOTO       L_main69
	DECFSZ     R12+0, 1
	GOTO       L_main69
;Proyecto FInal.c,257 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto FInal.c,258 :: 		ver(1,txt3);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt3+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt3+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,259 :: 		ver(2,txt4);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt4+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt4+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,260 :: 		delay_ms(Delay);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main70:
	DECFSZ     R13+0, 1
	GOTO       L_main70
	DECFSZ     R12+0, 1
	GOTO       L_main70
;Proyecto FInal.c,261 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto FInal.c,262 :: 		ver(1,txt5);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt5+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt5+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,263 :: 		ver(2,txt6);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt6+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt6+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,264 :: 		delay_ms(Delay);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main71:
	DECFSZ     R13+0, 1
	GOTO       L_main71
	DECFSZ     R12+0, 1
	GOTO       L_main71
;Proyecto FInal.c,265 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto FInal.c,266 :: 		ver(1,txt7);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt7+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt7+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,267 :: 		delay_ms(Delay);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main72:
	DECFSZ     R13+0, 1
	GOTO       L_main72
	DECFSZ     R12+0, 1
	GOTO       L_main72
;Proyecto FInal.c,268 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto FInal.c,269 :: 		ver(1,txt10);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt10+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt10+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,270 :: 		ver(2,txt11);;
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt11+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt11+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,271 :: 		delay_ms(Delay);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main73:
	DECFSZ     R13+0, 1
	GOTO       L_main73
	DECFSZ     R12+0, 1
	GOTO       L_main73
;Proyecto FInal.c,272 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto FInal.c,273 :: 		ver(1,txt13);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt13+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt13+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,274 :: 		ver(2,txt14);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt14+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt14+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,275 :: 		delay_ms(Delay);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main74:
	DECFSZ     R13+0, 1
	GOTO       L_main74
	DECFSZ     R12+0, 1
	GOTO       L_main74
;Proyecto FInal.c,276 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto FInal.c,277 :: 		ver(1,txt16);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt16+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt16+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,278 :: 		ver(2,txt17);
	MOVLW      2
	MOVWF      FARG_ver_F+0
	MOVLW      _txt17+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt17+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,279 :: 		delay_ms(Delay);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_main75:
	DECFSZ     R13+0, 1
	GOTO       L_main75
	DECFSZ     R12+0, 1
	GOTO       L_main75
;Proyecto FInal.c,280 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto FInal.c,281 :: 		while(1){
L_main76:
;Proyecto FInal.c,282 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto FInal.c,283 :: 		ver(1,txt23);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt23+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt23+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,284 :: 		lcd_out(2,1,"");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Proyecto_32FInal+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Proyecto FInal.c,285 :: 		registro1();
	CALL       _registro1+0
;Proyecto FInal.c,286 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto FInal.c,287 :: 		ver(1,txt24);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt24+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt24+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,288 :: 		lcd_out(2,1,"");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Proyecto_32FInal+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Proyecto FInal.c,289 :: 		registro2();
	CALL       _registro2+0
;Proyecto FInal.c,290 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto FInal.c,291 :: 		ver(1,txt25);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt25+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt25+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,292 :: 		lcd_out(2,1,"");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Proyecto_32FInal+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Proyecto FInal.c,293 :: 		registro3();
	CALL       _registro3+0
;Proyecto FInal.c,294 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto FInal.c,295 :: 		ver(1,txt26);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt26+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt26+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,296 :: 		lcd_out(2,1,"");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Proyecto_32FInal+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Proyecto FInal.c,297 :: 		registro4();
	CALL       _registro4+0
;Proyecto FInal.c,298 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto FInal.c,299 :: 		ver(1,txt27);
	MOVLW      1
	MOVWF      FARG_ver_F+0
	MOVLW      _txt27+0
	MOVWF      FARG_ver_txt+0
	MOVLW      hi_addr(_txt27+0)
	MOVWF      FARG_ver_txt+1
	CALL       _ver+0
;Proyecto FInal.c,300 :: 		lcd_out(2,1,"");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_Proyecto_32FInal+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Proyecto FInal.c,301 :: 		registro5();
	CALL       _registro5+0
;Proyecto FInal.c,302 :: 		Lcd_cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Proyecto FInal.c,303 :: 		Secuencia();
	CALL       _Secuencia+0
;Proyecto FInal.c,304 :: 		}
	GOTO       L_main76
;Proyecto FInal.c,305 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
