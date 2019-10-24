package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Salto_Linea;}

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}

/* Tipos de datos */
( byte | int | char | long | float | double ) {lexeme=yytext(); return Tipo_Dato;}

/* Tipo de dato String */
( String ) {lexeme=yytext(); return Cadena;}

/* Palabra reservada package */
( package ) {lexeme=yytext(); return Package;}

/* Palabra reservada Import */
( import ) {lexeme=yytext(); return Import;}

/* Palabra reservada Public */
( public ) {lexeme=yytext(); return Public;}

/* Palabra reservada Private */
( private ) {lexeme=yytext(); return Private;}

/* Palabra reservada Protected */
( protected ) {lexeme=yytext(); return Protected;}

/* Palabra reservada Class */
( class ) {lexeme=yytext(); return Class;}

/* Palabra reservada Extends */
( extends ) {lexeme=yytext(); return Extends;}

/* Palabra reservada Extends */
( package ) {lexeme=yytext(); return Package;}

/* Palabra reservada Static */
( static ) {lexeme=yytext(); return Static;}

/* Palabra reservada Void */
( void ) {lexeme=yytext(); return Void;}

/* Palabra reservada Try */
( try ) {lexeme=yytext(); return Try;}

/* Palabra reservada Catch */
( catch ) {lexeme=yytext(); return Catch;}

/* Palabra reservada System Call */
( System ) {lexeme=yytext(); return sysCall;}

/* Palabra reservada Exception */
( Exception ) {lexeme=yytext(); return Excepcion;}

/* Palabra reservada If */
( if ) {lexeme=yytext(); return If;}

/* Palabra reservada Else */
( else ) {lexeme=yytext(); return Else;}

/* Palabra reservada Do */
( do ) {lexeme=yytext(); return Do;}

/* Palabra reservada While */
( while ) {lexeme=yytext(); return While;}

/* Palabra reservada For */
( for ) {lexeme=yytext(); return For;}

/* Operador Igual */
( "=" ) {lexeme=yytext(); return Igual;}

/* Operador Suma */
( "+" ) {lexeme=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexeme=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexeme=yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexeme=yytext(); return Division;}

/* Operador Punto */
( "." ) {lexeme=yytext(); return Punto;}

/* Operador Coma */
( "," ) {lexeme=yytext(); return Coma;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexeme=yytext(); return Operador_Logico;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme = yytext(); return Operador_Relacional;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexeme = yytext(); return Operador_Atribucion;}

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexeme = yytext(); return Operador_InDec;}

/*Operadores Booleanos*/
(true | false)      {lexeme = yytext(); return Operador_Booleano;}

/* Parentesis de apertura */
( "(" ) {lexeme=yytext(); return Parentesis_Abierto;}

/* Parentesis de cierre */
( ")" ) {lexeme=yytext(); return Parentesis_Cerrado;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return Llave_Abierta;}

/* Llave de cierre */
( "}" ) {lexeme=yytext(); return Llave_Cerrada;}

/* Corchete de apertura */
( "[" ) {lexeme = yytext(); return Corchete_Abierto;}

/* Corchete de cierre */
( "]" ) {lexeme = yytext(); return Corchete_Cerrado;}

/* Marcador de inicio de algoritmo */
( "main" ) {lexeme=yytext(); return Main;}

/* Punto y coma */
( ";" ) {lexeme=yytext(); return PuntoYcoma;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}
