      SUBROUTINE GETGES(IRET)
      COMMON  /STRPOT/ STRS(118,52)
      DATA     AVHGT / 111.0 /
      DATA     CMPERM / 100.0 /
      DATA     CSF / 1.0E+7 /
C     ... WHERE CSF IS TO RESCALE THE GES FIELD STRS (IN CM) INTO       00372600
C     ...     NUMBERS  OF MAGNITUDE GENERATED BY POTEX IN STRS          00372700
C     ...     IT SEEMS TO BE TAKEN OUT AT END BY REDUCX                 00372800
C                                                                       00372900
      IRET = 1
      DO  100  J = 1,52
      DO  100  I = 1,118
      STRS(I,J) = AVHGT * CMPERM * CSF
  100 CONTINUE
      RETURN
      END
