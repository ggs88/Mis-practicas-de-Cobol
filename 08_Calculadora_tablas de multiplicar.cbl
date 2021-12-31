      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
      * Este programa mostrará las tablas de multiplicar de un numero.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
      *aqui pondremos las variables, tenemos 4:
       01 NUMERO PIC 9(2).
       01 MULTIPLICADOR PIC 9(2).
       01 RESULTADO PIC 9(2).
       01 SALIDA PIC X(5).


       PROCEDURE DIVISION.
      *primera rutina se llamara "inicio"
       INICIO.
           DISPLAY "Para entrar a la calculadora pulsa 'E'".
           DISPLAY "Para salir pulsa 'S'".
           ACCEPT SALIDA.
           IF SALIDA = "S" or "s" GO TO FINALIZAR
               ELSE
                    PERFORM INTRODUCE-NUMERO.
                    PERFORM CALCULOS UNTIL MULTIPLICADOR >10.
      *con perform se ejecutará una detras de la otra (en este mismo orden)

      *segunda rutina se llama finalizar
       FINALIZAR.
           STOP RUN.

      *tercera rutina se llama "Introduce numero"
       INTRODUCE-NUMERO.
           DISPLAY "De que numero quieres la tabla?"
           ACCEPT NUMERO.

      *cuarta rutina se llama "Calculos"
       CALCULOS.
       ADD 1 TO MULTIPLICADOR .
       COMPUTE RESULTADO = NUMERO * MULTIPLICADOR .
       DISPLAY NUMERO "  x " MULTIPLICADOR "  =  " RESULTADO.
           IF MULTIPLICADOR < 10  PERFORM CALCULOS
               ELSE DISPLAY "Vuelve al inicio...".
           GO TO INICIO.


            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.




