C
C SUBPROGRAM:   MAIN.BLOCK.DATA   BLOCK DATA FOR MAIN IN FAXMAKR90
C   PRGMMR: KRISHNA KUMAR         ORG: W/NP12    DATE: 1999-08-01
C
C ABSTRACT: THIS IS THE BLOCK DATA STATEMENT FOR MAIN IN FAXMAKR90 CODE
C
C PROGRAM HISTORY LOG:
C   1999-08-01 KRISHNA KUMAR 
C
C USAGE: BLOCK DATA ISCHED
C
C ATTRIBUTES:
C   LANGUAGE: F90
C   MACHINE: IBM
C
        BLOCK DATA ISCHED_DATA
        COMMON /FAXICK/ ISCHED(8,50),INXISCHED
C
      DATA       ISCHED / 165, 0, 0, 1800, X'8000',X'D800',0,0,   ! Initializing ISCHED
     1                    392*0/
      DATA       INXISCHED / 1 /
C
       END BLOCK DATA ISCHED_DATA

