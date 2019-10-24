/*
 *  Analizador Sintáctico y Léxico
 *  
 *  Utilizando la interfaz gráfica, elige el archivo y presiona "Analizar".
 *
 */
package codigo;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java_cup.runtime.*;

public class Principal {
    public static void main(String[] args) throws Exception {
        String ruta1 = "/Users/apple/Documents/java/Analexin/src/codigo/Lexer.flex"; // Ruta para windows:"E:/Documentos/NetBeansProjects/AnalizadorLexico/src/codigo/Lexer.flex";
        String ruta2 = "/Users/apple/Documents/java/Analexin/src/codigo/LexerCup.flex";// Ruta para windows: "E:/Documentos/NetBeansProjects/AnalizadorLexico/src/codigo/LexerCup.flex";
        String[] rutaS = {"-parser", "Sintax", "/Users/apple/Documents/java/Analexin/src/codigo/Sintax.cup"};// Ruta para Windows: "E:/Documentos/NetBeansProjects/AnalizadorLexico/src/codigo/Sintax.cup"};
        generar(ruta1, ruta2, rutaS);
    }
    public static void generar(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception{
        File archivo;
        archivo = new File(ruta1);
        jflex.Main.generate(archivo);
        archivo = new File(ruta2);
        jflex.Main.generate(archivo);
        java_cup.Main.main(rutaS);
    
        
        Path rutaSym = Paths.get( "/Users/apple/Documents/java/Analexin/src/codigo/sym.java"); //Ruta para Windows: "E:/Documentos/NetBeansProjects/AnalizadorLexico/src/codigo/sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get("/Users/apple/Documents/java/Analexin/sym.java"),//"E:/Documentos/NetBeansProjects/AnalizadorLexico/sym.java"), 
                Paths.get("/Users/apple/Documents/java/Analexin/src/codigo/sym.java")//"E:/Documentos/NetBeansProjects/AnalizadorLexico/src/codigo/sym.java")
        );
        Path rutaSin = Paths.get("/Users/apple/Documents/java/Analexin/src/codigo/Sintax.java");//"E:/Documentos/NetBeansProjects/AnalizadorLexico/src/codigo/Sintax.java");
        if (Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        Files.move(
                Paths.get("/Users/apple/Documents/java/Analexin/Sintax.java"),//"E:/Documentos/NetBeansProjects/AnalizadorLexico/Sintax.java"), 
                Paths.get("/Users/apple/Documents/java/Analexin/src/codigo/Sintax.java")//"E:/Documentos/NetBeansProjects/AnalizadorLexico/src/codigo/Sintax.java")
        );
       
    }
}
