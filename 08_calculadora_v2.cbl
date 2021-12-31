      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01  NUMERO1               PIC S9(10)V99 VALUE ZEROS.
       01  NUMERO2               PIC S9(10)V99 VALUE ZEROS.
       01  RESULTADO             PIC -ZZZZZZZZ99.99 VALUE ZEROS.
      * 01  CON z rellenará los espacios de cero en blanco.
       01  ELECCION              PIC A(1).
       01  OPERACION             PIC 9.



      ***************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           INICIO.
           DISPLAY "PARA CALCULAR ALGO PULSA C" ERASE LINE.
           CONTROL "FOREGROUND-COLOR = WHITE".
           DISPLAY "PARA SALIR PULSA S".
           ACCEPT ELECCION.
           IF ELECCION = "C" or "c" PERFORM MENU-CALCULADORA
           ELSE
           IF ELECCION ="S" or "s" PERFORM ACABA-PROGRAMA
           ELSE PERFORM OPCION-INVALIDA.


           MENU-CALCULADORA.
           DISPLAY "Elige que operacion quieres hacer".
           DISPLAY "1 - SUMAR".
           DISPLAY "2 - RESTAR".
           DISPLAY "3 - MULTIPLICAR".
           DISPLAY "4 - DIVIDIR".
           ACCEPT OPERACION.
           IF OPERACION=1 PERFORM SUMAR.
           IF OPERACION=2 PERFORM RESTAR.
           IF OPERACION=3 PERFORM MULTIPLICAR.
           IF OPERACION=4 PERFORM DIVIDIR ELSE PERFORM OPCION-INVALIDA.

           SUMAR.
           DISPLAY "Introduce el primer numero"
           ACCEPT NUMERO1.
           DISPLAY "Introduce el segundo numero".
           ACCEPT NUMERO2.
           ADD NUMERO1 TO NUMERO2 GIVING RESULTADO.
           DISPLAY numero1 " mas " numero2 " es " RESULTADO.
           PERFORM INICIO.

           RESTAR.
           DISPLAY "Introduce el primer numero"
           ACCEPT NUMERO1.
           DISPLAY "Introduce el segundo numero".
           ACCEPT NUMERO2.
           SUBTRACT NUMERO1 FROM NUMERO2 GIVING RESULTADO.
           DISPLAY numero1 " menos " numero2 " es " resultado.
           PERFORM INICIO.

           MULTIPLICAR.
           DISPLAY "Introduce el primer numero"
           ACCEPT NUMERO1.
           DISPLAY "Introduce el segundo numero".
           ACCEPT NUMERO2.
           MULTIPLY NUMERO1 BY NUMERO2 GIVING RESULTADO.
           DISPLAY numero1 " por " numero2 " es " resultado.
           PERFORM INICIO.

           DIVIDIR.
           DISPLAY "Introduce el primer numero"
           ACCEPT NUMERO1.
           DISPLAY "Introduce el segundo numero".
           ACCEPT NUMERO2.
           DIVIDE NUMERO1 BY NUMERO2 GIVING RESULTADO.
           DISPLAY numero1 " entre " numero2 " es " resultado.
           PERFORM INICIO.

           OPCION-INVALIDA.
           DISPLAY "Opcion invalida. ".
           PERFORM INICIO.

           ACABA-PROGRAMA.
           STOP RUN.


            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
