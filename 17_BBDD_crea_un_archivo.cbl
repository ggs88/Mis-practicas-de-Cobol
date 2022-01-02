      ******************************************************************
      * Author:
      * Date:
      * Purpose:VAMOS A GUARDAR CIERTOS DATOS EN UN ARCHIVO . Explicacion del FILE-CONTROL //
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
*****************************************************************************************************************
      * Esta division no es obligatoria.
       ENVIRONMENT DIVISION.

           CONFIGURATION SECTION.
              SOURCE-COMPUTER.
              OBJECT-COMPUTER.
              SPECIAL-NAMES.
                 DECIMAL-POINT IS COMMA.
      * por ejemplo, los puntos serán comas :-)


           INPUT-OUTPUT SECTION.
             FILE-CONTROL.
                 SELECT OPTIONAL EMPLEADOS-ARCHIVO
                 ASSIGN TO "C:\Users\Pc\OpenCobolIDE\empleados.dat"
                 ORGANIZATION INDEXED
                 ACCESS MODE DYNAMIC
                 RECORD KEY IS EMPLEADOS-ID
      *          ALTERNATE KEY EMPLEADOS-ID, EMPLEADOS-TELEFONO WITH DUPLICATES
                 STATUS ESTADO-FILE.

      * usamos "optional" para que cree el archivo si no existe.
      * ORGANIZATION puede ser:
      *     - sequential:  los registros se introducen en orden de entrada

      *     - indexed: leera registros en orden secuencial o por su clave
      *                necesita RECORD KEY i/o ALTER RECORD KEY)

      *      - relative: los registros se leen en orden secuencial e indexado.
      *                   es mas rapido.
      *                   los registros se pueden acceder por RELATIVE KEY.
      *                   cuando se borra un registro, sigue ocupando espacio.
      *
      * ACCESS MODE puede ser:
      *     + sequential: se accede de manera secuencial.
      *     + random: se accede de manera directa, sin tener que pasar por los otros registros.
      *     + dynamic: (el mas usado) se accede de manera secuencial o directa.
      * Seguir programa en:
      * https://www.youtube.com/watch?v=eFbPLk5hEMg&list=PLOnNEpCM0EBo4_CJJB-VfjnSWs17xW7Ot&index=12
****************************************************************************************************************
       DATA DIVISION.
      *    Aqui describiremos los campos que tiene el archivo:
       FILE SECTION.
      * nuestro archivo se llama "EMPLEADOS-ARCHIVO" y contiene estos campos;
           FD EMPLEADOS-ARCHIVO.
             01 EMPLEADOS-REGISTRO.
               02 EMPLEADOS-ID                   PIC 9(6).
               02 EMPLEADOS-NOMBRE               PIC A(35).
               02 EMPLEADOS-APELLIDOS.
                   03 EMPLEADOS-APELLIDO-PATERNO PIC A(35).
                   03 EMPLEADOS-APELLIDO-MATERNO PIC A(35).
               02 EMPLEADOS-EDAD                 PIC 9(2).
               02 EMPLEADOS-TELEFONO             PIC 9(9).
               02 EMPLEADOS-DIRECCION            PIC X(35).
      *       66 EMPLEADOS-APELLIDOS-JUNTOS  RENAMES
      *      EMPLEADOS-APELLIDO-PATERNO TRHU EMPLEADOS-APELLIDO-MATERNO.


      * aqui van las variables del archivo logico:
       WORKING-STORAGE SECTION.
       01  IDENTIFICADOR PIC X(30) VALUE "Introduce ID empleado ".
       01  NOMBRE        PIC X(30) VALUE "Introduce nombre: ".
       01  APELLIDOS     PIC X(30) VALUE "Introduce los apellidos: ".
       01  EDAD          PIC X(30) VALUE "Introduce la edad: ".
       01  TELEFONO      PIC X(30) VALUE "Introduce un num telf".
       01  DIRECCION     PIC X(30) VALUE "Introduce  direccion: ".

       01  SI-NO PIC A.
       01  RESPUESTA PIC A.

       01  ESTADO-FILE  PIC XX.

**************************************************************************************************************
       PROCEDURE DIVISION.
      * MAIN-LOGIC SECTION.

       1-EMPIEZA-PROGRAMA.
       PERFORM 2-ABRE-ARCHIVO.
       MOVE "S" TO SI-NO.
       PERFORM 4-AGREGA-REGISTROS UNTIL SI-NO = "N".
       PERFORM 3-CIERRA-ARCHIVO.
       PROGRAM-DONE.
       STOP RUN.

       2-ABRE-ARCHIVO.
       OPEN EXTEND EMPLEADOS-ARCHIVO.

       3-CIERRA-ARCHIVO.
       CLOSE EMPLEADOS-ARCHIVO.

       4-AGREGA-REGISTROS.
       MOVE "N" to RESPUESTA.
       PERFORM 5-MUESTRA-CAMPOS UNTIL RESPUESTA= "S".
       PERFORM 7-GUARDA-REGISTRO.
       PERFORM 8-REINICIA.

       5-MUESTRA-CAMPOS.
           DISPLAY IDENTIFICADOR.
           ACCEPT EMPLEADOS-ID.

           DISPLAY NOMBRE.
           ACCEPT EMPLEADOS-NOMBRE.

           DISPLAY APELLIDOS.
           ACCEPT EMPLEADOS-APELLIDOS.

           DISPLAY EDAD.
           ACCEPT EMPLEADOS-EDAD.

           DISPLAY TELEFONO.
           ACCEPT EMPLEADOS-TELEFONO.

           DISPLAY DIRECCION.
           ACCEPT EMPLEADOS-DIRECCION.

           PERFORM 6-CONTINUA.


       6-CONTINUA.
           MOVE "S" TO RESPUESTA.
           IF  EMPLEADOS-NOMBRE = SPACE THEN MOVE "N" TO RESPUESTA.

       7-GUARDA-REGISTRO.
       WRITE EMPLEADOS-REGISTRO
       IF ESTADO-FILE = "99" GO TO 7-GUARDA-REGISTRO.
       IF ESTADO-FILE > "07" DISPLAY "Error".


       8-REINICIA.
       DISPLAY "¿Desea almacenar otro registro en la base de datos?".
       ACCEPT SI-NO.
       IF SI-NO = "s"
       MOVE "S" TO SI-NO.
       IF SI-NO NOT = "S"
       MOVE "N" TO SI-NO.


       END PROGRAM YOUR-PROGRAM-NAME.
