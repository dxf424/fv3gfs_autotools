      SUBROUTINE CLOSEY(Z,IMAX,JMAX,S,A,B,M,JUP,IX,JY,LOX,
     X                  ITABMB,ITABFL,MXITR,LPLMI,IFF)
C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C                .      .    .                                       .
C SUBPROGRAM:    CLOSEY      DESCRIPTIVE TITLE NOT PAST COL 70
C   PRGMMR: KRISHNA KUMAR          ORG: W/NP12   DATE: 1999-08-01
C
C ABSTRACT: LABELS CONTOURS ABOVE A GIVEN CENTER POINT ALONG
C   A FIXED I AND INCREASING J VALUES.  FINDS ALL CONTOURS
C   WITHIN JUP GRID INTERVALS OF THE GIVEN CENTER.
C
C PROGRAM HISTORY LOG:
C   ??-??-??  DICK SCHURR
C   93-04-07  LILLY         CONVERT SUBROUTINE TO FORTRAN 77
C   96-10-03  LUKE LIN      CONVERT IT TO CFT-77.
C 1999-08-01  KRISHNA KUMAR CONVERTED THIS CODE FROM CRAY TO IBM RS/6000.
C                           ASSIGNED PROPER VALUE TO INDEFF USING RANGE FUNCTION
C                           FOR IBM RS/6000 FOR COMPILE OPTIONS
C                           xlf -qintsize=8 -qrealsize=8
C
C USAGE:    CALL CLOSEY( Z, IMAX, JMAX, S, A, B, M, JUP,IX,JY, LOX,
C                        ITABMB, ITABFL, MXITR, LPLMI, IFF )
C   INPUT ARGUMENT LIST:
C     INARG1   - GENERIC DESCRIPTION, INCLUDING CONTENT, UNITS,
C     INARG2   - TYPE.  EXPLAIN FUNCTION IF CONTROL VARIABLE.
C
C   OUTPUT ARGUMENT LIST:      (INCLUDING WORK ARRAYS)
C     WRKARG   - GENERIC DESCRIPTION, ETC., AS ABOVE.
C     OUTARG1  - EXPLAIN COMPLETELY IF ERROR RETURN
C     ERRFLAG  - EVEN IF MANY LINES ARE NEEDED
C
C   INPUT FILES:   (DELETE IF NO INPUT FILES IN SUBPROGRAM)
C     DDNAME1  - GENERIC NAME & CONTENT
C
C   OUTPUT FILES:  (DELETE IF NO OUTPUT FILES IN SUBPROGRAM)
C     DDNAME2  - GENERIC NAME & CONTENT AS ABOVE
C     FT06F001 - INCLUDE IF ANY PRINTOUT
C
C REMARKS: LIST CAVEATS, OTHER HELPFUL HINTS OR INFORMATION
C
C ATTRIBUTES:
C   LANGUAGE: FORTRAN 90
C   MACHINE:  IBM
C
C$$$
C
      COMMON   /PUTARG/PUTHGT,PUTANG,IPRPUT(2),ITAPUT
      COMMON /ADJ1/ICOR,JCOR
C
      REAL      Z(IMAX,JMAX)
      INTEGER   ITABMB(MXITR)
      INTEGER   ITABFL(MXITR)
      CHARACTER*8 IFF(5)
      DIMENSION ITEXT(3),JTEXT(3)
C
      INTEGER      M(2)

C
      CHARACTER*12 LTEXT
      CHARACTER*12 MTEXT
      CHARACTER*4  LPLMI
C
      REAL    INDEF,IDEF,KDEF1,KDEF2,KDEF3,KDEF4
C
      DATA  INDEF   /1.0E307 /
C
      DATA ITEXT/3*0/
C
C///  EQUIVALENCE(LTEXT,ITEXT(1))
C///  EQUIVALENCE(MTEXT,JTEXT(1))
C
      KCON4=20
 7    KBEG=JY
      KLIM=JY+JUP
      IJFIX=IX
      Q=S*20.
      REM=1.
      Q1=1./(2.*Q*Q)
      Q2=(Q+1.)/2.
      Q3=1./Q
      N=10
      KLAST=0
      KSTART=KBEG
      DO 16 K=KBEG,KLIM
      IDEF=Z(IJFIX,K)
      IF(IDEF.NE.INDEF) GO TO 17
      KSTART=KSTART+1
  16  CONTINUE
      GO TO 500
  17  L=Z(IJFIX,KSTART)+10000.
      KCON6=FLOAT(IJFIX-1)*Q*3
      ICAL1=KCON6+ICOR
C     ...THIS ICAL1 IS THE FIXED I VALUE IN DOTS...
      DO 200 K=KSTART,KLIM
      Q4=REM/2.
      Q5=1.-REM
      X=Q-Q5
      IINC=X
      REM=X-FLOAT(IINC)
      KCON7=FLOAT(K-1)*Q*3
C
C     CHECK FOR IMBEDDED GRID
C
      KDEF1=Z(IJFIX,K)
      KDEF2=Z(IJFIX,K+1)
      KDEF3=Z(IJFIX,K-1)
      KDEF4=Z(IJFIX,K+2)
      YD2=0
      IF((KDEF1.EQ.INDEF).OR.(KDEF2.EQ.INDEF).OR.(KDEF3.EQ.INDEF).OR.
     X(KDEF4.EQ.INDEF)) GO TO 31
      YD2=(Z(IJFIX,K+2)-Z(IJFIX,K+1)-Z(IJFIX,K)+Z(IJFIX,K-1))*Q1
  31  IF((KDEF1.EQ.INDEF).OR.(KDEF2.EQ.INDEF)) GO TO 200
      YD1=(Z(IJFIX,K+1)-Z(IJFIX,K))*Q3-(Q2*YD2)+Q5*YD2
      YVAL=Z(IJFIX,K)+Q5*Q4*YD1+10000.
      DO 130 KK=1,IINC
      MM=YVAL
      IF((MM - L) .EQ. 0) GO TO 125
C
C     COMPUTE A LABEL
C
      XVAL=MM-10000
      IF((IABS(MM)-IABS(L)).LT.0) XVAL=L-10000
      KCON1=(KK-1)*3
      ICAL = KCON7 + KCON1 + JCOR
C     ...THIS IS THE J - VALUE IN DOTS...
      HOLD = B * (XVAL + A)
      ITEXT(1) = SIGN((ABS(HOLD) + 0.05),HOLD)
      KPOSX=KCON4
      IF((ICAL-KLAST).LT.KPOSX) GO TO 125
      KLAST=ICAL
      IF(LOX.EQ.1) GO TO 109
  50  INTG=ITEXT(1)
      NCHAR=M(2)
C
C     FORMAT STRIP LABEL FROM CENTER POSITION
C
      CALL BIN2EB(INTG,MTEXT,NCHAR,LPLMI)
      N=12
C///  WRITE(LTEXT,FMT=IFF)JTEXT(1)
      WRITE(LTEXT,FMT=IFF)MTEXT
C
      PRINT *,' CLOSEy: INTG=',INTG,' NCH=',NCHAR,' LTEXT=',LTEXT
      CALL PUTLAB(ICAL1,ICAL,PUTHGT,LTEXT,PUTANG,N,IPRPUT,ITAPUT)
      GO TO 125
C
C     USE INDIRECT LABELS
C
 109  CONTINUE
      DO 110 ITR=1,MXITR
      ITSAVE=ITR
      IF(ITABMB(ITR).EQ.ITEXT(1)) GO TO 112
 110  CONTINUE
      GO TO 125
 112  KLAST=ICAL
      ITEXT(1)=ITABFL(ITSAVE)
      GO TO 50
 125  L=MM
      YD1=YD1+YD2
      YVAL=YVAL+YD1
 130  CONTINUE
 200  CONTINUE
 500  RETURN
      END
