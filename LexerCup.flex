package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
%unicode
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Comillas */
( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

/* Tipos de datos */
( byte | short | int | long | float | double | bool | char | String) {return new Symbol(sym.Tipo_Dato, yychar, yyline, yytext());}

/* Palabra reservada Package */
( package ) {return new Symbol(sym.Package, yychar, yyline, yytext());}

/* Palabra reservada Import */
( import ) {return new Symbol(sym.Import, yychar, yyline, yytext());}

/* Palabra reservada Public */
( public ) {return new Symbol(sym.Public, yychar, yyline, yytext());}

/* Palabra reservada Private */
( private ) {return new Symbol(sym.Private, yychar, yyline, yytext());}

/* Palabra reservada Protected */
( protected ) {return new Symbol(sym.Protected, yychar, yyline, yytext());}

/* Palabra reservada Class */
( class ) {return new Symbol(sym.Class, yychar, yyline, yytext());}

/* Palabra reservada Extends */
( extends ) {return new Symbol(sym.Extends, yychar, yyline, yytext());}

/* Palabra reservada Static */
( static ) {return new Symbol(sym.Static, yychar, yyline, yytext());}

/* Palabra reservada Void */
( void ) {return new Symbol(sym.Void, yychar, yyline, yytext());}

/* Palabra reservada Try */
( try ) {return new Symbol(sym.Try, yychar, yyline, yytext());}

/* Palabra reservada Catch */
( catch ) {return new Symbol(sym.Catch, yychar, yyline, yytext());}

/* Palabra reservada Llamado al sistema */
( System ) {return new Symbol(sym.sysCall, yychar, yyline, yytext());}

/* Palabra reservada Exception */
( Exception ) {return new Symbol(sym.Excepcion, yychar, yyline, yytext());}

/* Palabra reservada If */
( if ) {return new Symbol(sym.If, yychar, yyline, yytext());}

/* Palabra reservada Else */
( else ) {return new Symbol(sym.Else, yychar, yyline, yytext());}

/* Palabra reservada Do */
( do ) {return new Symbol(sym.Do, yychar, yyline, yytext());}

/* Palabra reservada While */
( while ) {return new Symbol(sym.While, yychar, yyline, yytext());}

/* Palabra reservada For */
( for ) {return new Symbol(sym.For, yychar, yyline, yytext());}

/* This */
 ( this ) {return new Symbol(sym.This, yychar, yyline, yytext());}

/* Operador Igual */
( "=" ) {return new Symbol(sym.Igual, yychar, yyline, yytext());}

/* Operador Suma */
( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());}

/* Operador Resta */
( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());}

/* Operador Multiplicacion */
( "*" ) {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}

/* Operador Division */
( "/" ) {return new Symbol(sym.Division, yychar, yyline, yytext());}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {return new Symbol(sym.Operador_Logico, yychar, yyline, yytext());}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Operador_Relacional, yychar, yyline, yytext());}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" | "=" ) {return new Symbol(sym.Operador_Atribucion, yychar, yyline, yytext());}

/* Operadores Incremento y decremento */
( "++" | "--" ) {return new Symbol(sym.Operador_InDec, yychar, yyline, yytext());}

/*Operadores Booleanos*/
( true | false ) {return new Symbol(sym.Operador_Booleano, yychar, yyline, yytext());}

/* Coma */
 ( , ) {return new Symbol(sym.Coma, yychar, yyline, yytext());}

/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.Parentesis_Abierto, yychar, yyline, yytext());}

/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.Parentesis_Cerrado, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.Llave_Abierta, yychar, yyline, yytext());}

/* Llave de cierre */
( "}" ) {return new Symbol(sym.Llave_Cerrada, yychar, yyline, yytext());}

/* Corchete de apertura */
( "[" ) {return new Symbol(sym.Corchete_Abierto, yychar, yyline, yytext());}

/* Corchete de cierre */
( "]" ) {return new Symbol(sym.Corchete_Cerrado, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "main" ) {return new Symbol(sym.Main, yychar, yyline, yytext());}

/* Punto y coma */
( ";" ) {return new Symbol(sym.PuntoYcoma, yychar, yyline, yytext());}

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}

/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}

/* Punto */
 (".") {return new Symbol(sym.Punto, yychar, yyline, yytext());}

