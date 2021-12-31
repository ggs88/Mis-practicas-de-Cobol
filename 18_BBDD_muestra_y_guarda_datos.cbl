      ******************************************************************
      * Author:
      * Date:
      * Purpose:VAMOS A GUARDAR CIERTOS DATOS EN UN ARCHIVO, MOSTRARLOS Y GRABARLOS .
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.


       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
            FILE-CONTROL.
      *    aqui pondremos los datos del archivo (osea la BBDD)
             SELECT OPTIONAL EMPLEADOS-ARCHIVO ASSIGN TO
                              "C:\Users\Pc\OpenCobolIDE\empleados.txt"
      *                 OJO, "assign" no lleva punto final !!!
              ORGANIZATION IS SEQUENTIAL.



       DATA DIVISION.
      *    Aqui describiremos los campos que tiene el archivo:
       FILE SECTION.
      * nuestro archivo se llama "EMPLEADOS-ARCHIVO" y contiene estos campos;
           FD EMPLEADOS-ARCHIVO.
             01 EMPLEADOS-REGISTRO.
               02 EMPLEADOS-ID PIC 9(3).
               02 EMPLEADOS-NOMBRE PIC A(10).
               02 EMPLEADOS-APELLIDOS PIC A(20).
               02 EMPLEADOS-EDAD PIC 9(2).
               02 EMPLEADOS-TELEFONO PIC 9(9).
               02 EMPLEADOS-DIRECCION PIC X(35).

      
      * aqui van las variables del archivo logico:
       WORKING-STORAGE SECTION.
       01  IDENTIFICADOR PIC X(30) VALUE "Introduce ID empleado ".
       01  NOMBRE        PIC X(30) VALUE "Introduce nombre: ".
       01  APELLIDOS     PIC X(30) VALUE "Introduce los apellidos: ".
       01  EDAD          PIC X(30) VALUE "Introduce la edad: ".
       01  TELEFONO      PIC X(30) VALUE "Introduce un num telf".
       01  DIRECCION     PIC X(30) VALUE "Introduce  direccion: ".

       01 CONFIRMACION   PIC X(1).
       01  RESPUESTA PIC A.
       01  SI-NO PIC A.


       PROCEDURE DIVISION.
     * MAIN-LOGIC SECTION.
      * Queremos que el programa siga estos pasos:
     * 1-EMPIEZA-PROGRAMA.
           PERFORM 2-ABRE-ARCHIVO.
           MOVE "S" TO SI-NO.
           PERFORM 4-AGREGA-REGISTROS UNTIL SI-NO = "N".
           PERFORM 3-CIERRA-ARCHIVO.
           PROGRAM-DONE.
           STOP RUN.

       2-ABRE-ARCHIVO.
           OPEN EXTEND EMPLEADOS-ARCHIVO.

       4-AGREGA-REGISTROS.
       MOVE "N" to RESPUESTA.
       PERFORM 5-PIDE-ID UNTIL RESPUESTA= "S".
       PERFORM 7-GUARDA-REGISTRO.
       PERFORM 8-REINICIA.

       5-PIDE-ID.
           DISPLAY IDENTIFICADOR.
           ACCEPT EMPLEADOS-ID.
           DISPLAY "Has introducido:  "EMPLEADOS-ID " Es correcto? S/N".
           ACCEPT CONFIRMACION.
           IF CONFIRMACION = "S" OR CONFIRMACION = "s"
               PERFORM PIDE-NOMBRE
               ELSE PERFORM 5-PIDE-ID.

       PIDE-NOMBRE.
           DISPLAY NOMBRE.
           ACCEPT EMPLEADOS-NOMBRE.
           DISPLAY "Has introducido: "EMPLEADOS-NOMBRE ",correcto? S/N".
           ACCEPT CONFIRMACION.
           IF CONFIRMACION = "S" OR CONFIRMACION = "s"
               GO TO PIDE-APELLIDOS ELSE PERFORM PIDE-NOMBRE.

       PIDE-APELLIDOS.
           DISPLAY APELLIDOS.
           ACCEPT EMPLEADOS-APELLIDOS.
           DISPLAY "Has introducido:"EMPLEADOS-APELLIDOS",correcto?S/N".
           ACCEPT CONFIRMACION.
           IF CONFIRMACION = "S" OR CONFIRMACION = "s"
               GO TO PIDE-EDAD   ELSE PERFORM PIDE-APELLIDOS.

       PIDE-EDAD.
           DISPLAY EDAD.
           ACCEPT EMPLEADOS-EDAD.
           DISPLAY "Has introducido:"EMPLEADOS-EDAD",correcto?S/N".
           ACCEPT CONFIRMACION.
           IF CONFIRMACION = "S" OR CONFIRMACION = "s"
               GO TO PIDE-TELEFONO   ELSE PERFORM PIDE-EDAD.

       PIDE-TELEFONO.
           DISPLAY TELEFONO.
           ACCEPT EMPLEADOS-TELEFONO.
           DISPLAY "Has introducido:"EMPLEADOS-TELEFONO" ,correcto?S/N".
           ACCEPT CONFIRMACION.
           IF CONFIRMACION = "S" OR CONFIRMACION = "s"
               GO TO PIDE-DIRECCION   ELSE PERFORM PIDE-TELEFONO.

       PIDE-DIRECCION.
           DISPLAY DIRECCION.
           ACCEPT EMPLEADOS-DIRECCION.
           DISPLAY "Has introducido:"EMPLEADOS-DIRECCION",correcto?S/N".
           ACCEPT CONFIRMACION.
           IF CONFIRMACION = "S" OR CONFIRMACION = "s"
               GO TO 7-GUARDA-REGISTRO   ELSE PERFORM PIDE-DIRECCION.

      *     PERFORM 6-CONTINUA.


      *   6-CONTINUA.
      *     MOVE "S" TO RESPUESTA.
      *     IF  EMPLEADOS-NOMBRE = SPACE THEN MOVE "N" TO RESPUESTA.

     * 7-GUARDA-REGISTRO.
       DISPLAY "Pulsa 1 para guadar y salir".
       DISPLAY "Pulsa 2 para guardar y añadir mas empleados".
       ACCEPT CONFIRMACION.
       IF CONFIRMACION = "1" PERFORM CONFIRMACION-GUARDAR END-IF.
       IF CONFIRMACION = "2" PERFORM CONFIRMACION-Y-EMPEZAR
       END-IF.

       CONFIRMACION-GUARDAR.
     * WRITE EMPLEADOS-REGISTRO.
       PERFORM FINAL-PROGRAMA.

       CONFIRMACION-Y-EMPEZAR.
       WRITE EMPLEADOS-REGISTRO.
       PERFORM 5-PIDE-ID.


       3-CIERRA-ARCHIVO.
       CLOSE EMPLEADOS-ARCHIVO.


       8-REINICIA.
       DISPLAY "¿Desea almacenar otro registro en la base de datos?".
       ACCEPT SI-NO.
       IF SI-NO = "s"
       MOVE "S" TO SI-NO.
       IF SI-NO NOT = "S"
       MOVE "N" TO SI-NO.

       FINAL-PROGRAMA.
       STOP RUN.

       END PROGRAM YOUR-PROGRAM-NAME.
