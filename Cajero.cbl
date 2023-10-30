      ******************************************************************
      * Author: Erick Stiven Fierro Perdomo                            *
      * Date: 29/10/2023                                               *
      * Purpose:                                                       *
      * Tectonics: cobc                                                *
      ******************************************************************
      * CONTROL DE CAMBIOS: Creacion del programa                      *
      *              FECHA: 29/10/2023                                 *
      ******************************************************************
      * CONTROL DE CAMBIOS: Creacion Menu Principal                    *
      *              FECHA: 30/10/2023                                 *
      ******************************************************************

       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANCO-PROJECT.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OPTIONAL BD-OPCIONES-CAJERO
           ASSIGN TO "..\assets/opciones-cajero.txt"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
           FD BD-OPCIONES-CAJERO.
               01 REGISTRO-OPCION.
                   05 ID-OPCION PIC 99.
                   05 NOMBRE-OPCION PIC X(25).

       WORKING-STORAGE SECTION.
       77 FLAG PIC 9.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 1000-INICIO-PROGRAMA
           PERFORM 2000-PROCESO-PROGRAMA
           PERFORM 3000-FINAL-PROGRAMA.

       1000-INICIO-PROGRAMA.
           .

       2000-PROCESO-PROGRAMA.
           PERFORM MENU
           .

       MENU.
           DISPLAY "***************************************************"
           DISPLAY "*                CAJERO AUTOMATICO                *"
           DISPLAY "***************************************************"
           DISPLAY "* Selecciona una opcion                           *"
           DISPLAY "*                                                 *"
           OPEN INPUT BD-OPCIONES-CAJERO
           PERFORM MOSTRAR-OPCIONES UNTIL FLAG = 1
           CLOSE BD-OPCIONES-CAJERO
           DISPLAY "***************************************************"
           .

       MOSTRAR-OPCIONES.
           READ BD-OPCIONES-CAJERO NEXT RECORD AT END MOVE 1 TO FLAG.
           IF FLAG = 0
               DISPLAY "*     "REGISTRO-OPCION "                 *"
           .

       3000-FINAL-PROGRAMA.
           STOP RUN
           .

       END PROGRAM BANCO-PROJECT.
