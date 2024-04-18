#line 1 "C:/Users/master/Desktop/Proyecto Final/PF/Proyecto FInal.c"
#line 10 "C:/Users/master/Desktop/Proyecto Final/PF/Proyecto FInal.c"
const unsigned char txt1[] = "    SSPPSE      ";
const unsigned char txt2[] = "Ing. Jose Ramos ";
const unsigned char txt3[] = " Carlos Aguilar ";
const unsigned char txt4[] = "   215860049    ";
const unsigned char txt5[] = " PROYECTO FINAL ";
const unsigned char txt6[] = "Control  Taladro";
const unsigned char txt7[] = "   18/Nov/2016  ";
const unsigned char txt10[] = "   Seleccione   ";
const unsigned char txt11[] = " 5 Procentajes  ";
const unsigned char txt13[] = "Para la potencia";
const unsigned char txt14[] = "   Del Taladro  ";
const unsigned char txt16[] = "Y Presione Enter";
const unsigned char txt17[] = "      (*)       ";
const unsigned char txt18[] = "   Iniciando    ";
const unsigned char txt20[] = "   Direccion    ";

const unsigned char txt23[] = "  1er Potencia  ";
const unsigned char txt24[] = "  2da Potencia  ";
const unsigned char txt25[] = "  3ra Potencia  ";
const unsigned char txt26[] = "  4ta Potencia  ";
const unsigned char txt27[] = "  5ta Potencia  ";

sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;

unsigned char buffer,n,i,x;
unsigned int cantidad,cantidad1,cantidad2,Digitos,Digitos1,Digitos2,Digitos3,Digitos4,ciclo,ciclo1;
void teclado();
void CapturarDatos();
void Secuencia();
 void ver(unsigned char F, const unsigned char txt[])
 {
 unsigned char;
 for(i=0;i<16;i++)
 {
 Lcd_chr(f,i+1,txt[i]);
 }
 }
 unsigned char CapturarDatos()
 {
 unsigned char L,key=0;





 }


 void registro1()
 {
 buffer = 0;
 Digitos = 0;
 while (1)
 {
 {
 teclado();
 }
 if ((buffer >= '0')&&(buffer <= '9'))
 {
 Lcd_Chr_Cp(buffer);

 Digitos =Digitos*10 + (buffer - 48);

 }
 if(buffer == '*'){
 n=1;
 break;

 }
 }
 }


 void registro2()
 {
 buffer = 0;
 Digitos1 = 0;
 while (1)
 {
 {
 teclado();
 }
 if ((buffer >= '0')&&(buffer <= '9'))
 {
 Lcd_Chr_Cp(buffer);
 Digitos1 =Digitos1*10 + (buffer - 48);
 }
 if(buffer == '*'){
 n=2;
 break;
 }
 }
 }

 void registro3()
 {
 buffer = 0;
 Digitos2 = 0;
 while (1)
 {
 {
 teclado();
 }
 if ((buffer >= '0')&&(buffer <= '9'))
 {
 Lcd_Chr_Cp(buffer);
 Digitos2 =Digitos2*10 + (buffer - 48);
 }
 if(buffer == '*'){
 n=3;
 break;
 }
 }
 }

 void registro4()
 {
 buffer = 0;
 Digitos3 = 0;
 while (1)
 {
 {
 teclado();
 }
 if ((buffer >= '0')&&(buffer <= '9'))
 {
 Lcd_Chr_Cp(buffer);
 Digitos3 =Digitos3*10 + (buffer - 48);
 }
 if(buffer == '*'){
 n=4;
 break;
 }
 }
 }

 void registro5()
 {
 buffer = 0;
 Digitos4 = 0;
 while (1)
 {
 {
 teclado();
 }
 if ((buffer >= '0')&&(buffer <= '9'))
 {
 Lcd_Chr_Cp(buffer);
 Digitos4 =Digitos4*10 + (buffer - 48);
 }
 if(buffer == '*'){
 n=5;
 break;
 }
 }
 }

 void Secuencia()
 {
 if(n == 5)
 {

 for(x=0;x<=Digitos;x++){
 while(PORTE.F1==0);
 delay_us(88992);
 PORTE.F0=1;
 delay_us(10);
 PORTE.F0=0;
 }
 }
 }


 void teclado()
 {
 buffer = 0;
 PORTD = 0xF0;
 if (PORTD != 0xF0)
 {
 PORTD = 0xFE;
 switch (PORTD)
 {
 case 0xEE: buffer = '1'; break;
 case 0xDE: buffer = '2'; break;
 case 0xBE: buffer = '3'; break;
 case 0x7E: buffer = 'A'; break;
 }
 PORTD = 0xFD;
 switch (PORTD)
 {
 case 0xED: buffer = '4'; break;
 case 0xDD: buffer = '5'; break;
 case 0xBD: buffer = '6'; break;
 case 0x7D: buffer = 'B'; break;
 }
 PORTD = 0xFB;
 switch (PORTD)
 {
 case 0xEB: buffer = '7'; break;
 case 0xDB: buffer = '8'; break;
 case 0xBB: buffer = '9'; break;
 case 0x7B: buffer = 'C'; break;
 }
 PORTD = 0xF7;
 switch (PORTD)
 {
 case 0xE7: buffer = '*'; break;
 case 0xD7: buffer = '0'; break;
 case 0xB7: buffer = '#'; break;
 case 0x77: buffer = 'D'; break;
 }
 }
 PORTD = 0xF0;
 while (PORTD != 0xF0);
 delay_ms(51);
 }

 void main()
 {
 ANSEL = 0;
 ANSELH = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;
 TRISB = 0;
 PORTB = 0;
 TRISD = 0xF0;
 PORTD = 0xF0;
 TRISE = 0x02;
 PORTE = 0;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_cmd(_Lcd_clear);

 ver(1,txt1);
 ver(2,txt2);
 delay_ms( 15 );
 lcd_cmd(_lcd_clear);
 ver(1,txt3);
 ver(2,txt4);
 delay_ms( 15 );
 lcd_cmd(_lcd_clear);
 ver(1,txt5);
 ver(2,txt6);
 delay_ms( 15 );
 lcd_cmd(_lcd_clear);
 ver(1,txt7);
 delay_ms( 15 );
 lcd_cmd(_lcd_clear);
 ver(1,txt10);
 ver(2,txt11);;
 delay_ms( 15 );
 lcd_cmd(_lcd_clear);
 ver(1,txt13);
 ver(2,txt14);
 delay_ms( 15 );
 lcd_cmd(_lcd_clear);
 ver(1,txt16);
 ver(2,txt17);
 delay_ms( 15 );
 lcd_cmd(_lcd_clear);
 while(1){
 lcd_cmd(_lcd_clear);
 ver(1,txt23);
 lcd_out(2,1,"");
 registro1();
 lcd_cmd(_lcd_clear);
 ver(1,txt24);
 lcd_out(2,1,"");
 registro2();
 lcd_cmd(_lcd_clear);
 ver(1,txt25);
 lcd_out(2,1,"");
 registro3();
 lcd_cmd(_lcd_clear);
 ver(1,txt26);
 lcd_out(2,1,"");
 registro4();
 lcd_cmd(_lcd_clear);
 ver(1,txt27);
 lcd_out(2,1,"");
 registro5();
 Lcd_cmd(_LCD_CLEAR);
 Secuencia();
 }
 }
