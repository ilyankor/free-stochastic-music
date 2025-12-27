! gfortran src/test0.f -std=legacy -o test0; ./test0 < ex/input.txt > out0.txt

C                                                                       XEN   76
C     READ CONSTANTS AND TABLES                                         XEN   78
C                                                                       XEN   77
      DIMENSION Q(12),S(12),E(12,12),PN(12,50),SPN(12,50),NT(12),       XEN   79
     *HAMIN(12,50),HAMAX(12,50),HBMIN(12,50),HBMAX(12,50),GN(12,50),H(12XEN   80
     *,50),TETA(256),VIGL(3),MODI(7),Z1(8),Z2(8),ALFA(3),AMAX(12)       XEN   81
C                                                                       XEN   82
C                                                                       XEN   83
C                                                                       XEN   84
      I=1                                                               XEN   85
      DO 10 IX=1,7                                                      XEN   86
      IX8=8-IX                                                          XEN   87
      MODI(IX8)=I                                                       XEN   88
   10 I=I+1                                                             XEN   89
C                                                                       XEN   90
      READ 20,(TETA(I),I=1,256)                                         XEN   91
   20 FORMAT(12F6.6)                                                    XEN   92
      READ 30,(Z1(I),Z2(I),I=1,8)                                       XEN   93
   30 FORMAT(6(F3.2,F9.8)/F3.2,F9.8,E6.2,F9.8)                          XEN   94
      PRINT 40,TETA,Z1,Z2                                               XEN   95
   40 FORMAT('1  THE TETA TABLE = ',/,21(12F10.6,/),4F10.6,/////,       XEN   96
     *' THE Z1 TABLE = ',/,7F6.2,E12.3,///,' THE Z2 TABLE = ',/,8F14.8,/XEN   97
     *,1H1)                                                             XEN   98
      READ 50,DELTA,V3,A10,A20,A17,A30,A35,BF,SQPI,EPSI,VITLIM,ALEA,   AXEN   99
     *LIM                                                               XEN  100
   50 FORMAT(F3.0,F3.3,5F3.1,F2.0,F8.7,F8.8,F4.2,F8.8,F5.2)             XEN  114
      READ 60,KT1,KT2,KW,KNL,KTR,KTE,KR1,GTNA,GTNS,(NT(I),I=1,KTR)      XEN  115
   60 FORMAT(5I3,2I2,2F6.0,12I2)                                        XEN  126
      PRINT 70,DELTA,V3,A10,A20,A17,A30,A35,BF,SQPI,EPSI,VITLIM,ALEA,  AXEN  127
     *LIM,KT1,KT2,KW,KNL,KTR,KTE,KR1,GTNA,GTNS,(I,NT(I),I=1,KTR)        XEN  128
   70 FORMAT('1DELTA = ',F4.0,/,' V3 = ',F6.3,/,' A10 = ',F4.1,/,       XEN  129
     *' A20 = ',F4.1,/,' A17 = ',F4.1,/,' A30 = ',F4.1,/,' A35 = ',F4.1,XEN  130
     */,' BF = ',F3.0,/,' SQPI =',F11.8,/,' EPSI =',F12.8,/,' VITLIM = 'XEN  131
     *,F5.2,/,' ALEA =',F12.8,/,' ALIM = ',F6.2,/,' KT1 = ',I3,/,       XEN  132
     *' KT2 = ',I3,/,' KW = ',I3,/,' KNL = ',I3,/,' KTR = ',I3,/,       XEN  133
     *' KTE = ',I2,/,' KR1 = ',I2,/,' GTNA = ',F7.0,/,' GTNS = ',F7.0,  XEN  134
     */,12(' IN CLASS ',I2,', THERE ARE ',I2,' INSTRUMENTS.',/))        XEN  135
      READ 80,KTEST3,KTEST1,KTEST2                                      XEN  136
   80 FORMAT(5I3)                                                       XEN  141
      PRINT 90,KTEST3,KTEST1,KTEST2                                     XEN  142
   90 FORMAT(' KTEST3 = ',I3,/,' KTEST1 = ',I3,/,' KTEST2 = ',I3)       XEN  143
C                                                                       XEN  144
      IF(KTEST3.NE.0) PRINT 830                                         XEN  145
      R=KTE-1                                                           XEN  146
      A10=A10*SQPI                                                      XEN  147
      A20=A20*SQPI/R                                                    XEN  148
      A30=A30*SQPI                                                      XEN  149
C     IF ALEA IS NON-ZERO,THE RANDOM NUMBER IS GENERATED FROM THE TIME  XEN  150
C     WHEN THE FOLLOWING INSTRUCTION IS EXECUTED. IF ALEA IS NON-ZERO   XEN  151
C     EACH RUN OF THIS PROGRAM WILL PRODUCE DIFFERENT OUTPUT DATA.      XEN  152
      IF(ALEA.NE.0.0) CALL RANFSET(TIMEF(1))                            XEN  153
      PRINT 830                                                         XEN  154
      DO 130 I=1,KTR                                                    XEN  155
      Y=0.0                                                             XEN  156
      KTS=NT(I)                                                         XEN  157
      READ 100,(HAMIN(I,J),HAMAX(I,J),HBMIN(I,J),HBMAX(I,J),GN(I,J),    XEN  158
     *PN(I,J),J=1,KTS)                                                  XEN  159
  100 FORMAT(5(5F2.0,F3.3))                                             XEN  160
      PRINT 110,I,(J,HAMIN(I,J),HAMAX(I,J),HBMIN(I,J),HBMAX(I,J),GN(I,J)XEN  161
     *,PN(I,J),J=1,KTS)                                                 XEN  162
  110 FORMAT(////,' IN CLASS NUMBER ',I2,/,(' FOR INSTRUMENT NO. ',I2,  XEN  163
     *' HAMIN = ',F3.0,',HAMAX = ',F3.0,',HBMIN = ',F3.0,',HBMAX = ',   XEN  164
     * F3.0,',GN = ',F3.0,', AND PN = ',F6.3))                          XEN  165
      DO 120 J=1,KTS                                                    XEN  166
      Y=Y+PN(I,J)                                                       XEN  167
  120 SPN(I,J)=Y                                                        XEN  168
  130 IF(ABSF(Y-1.0).GE.EPSI) CALL EXIT                                 XEN  169
C                                                                       XEN  170
      DO 150 I=1,KTR                                                    XEN  171
      READ 140,(E(I,J),J=1,KTE)                                         XEN  172
  140 FORMAT(12F2.2)                                                    XEN  173
  150 PRINT 160,I,(J,E(I,J),J=1,KTE)                                    XEN  174
  160 FORMAT(//////,' CLASS NUMBER ',I2,/,(' IN DENSITY LEVEL ',I2,     XEN  175
     *' HAS A PROBABILITY OF ',F6.2))                                   XEN  176
      DO 180 J=1,KTE                                                    XEN  177
      Y=0.0                                                             XEN  178
      DO 170 I=1,KTR                                                    XEN  179
  170 Y=Y+E(I,J)                                                        XEN  180
  180 IF(ABSF(Y-1.0).GE.EPSI) CALL EXIT                                 XEN  181
      DO 200 I=1,KTR                                                    XEN  182
      AMAX(I)=1.0/E(I,1)                                                XEN  183
      DO 200 J=2,KTE                                                    XEN  184
      AJ=J-1                                                            XEN  185
      AX=1.0/(E(I,J)*EXPF(AJ))                                          XEN  186
      IF (KT1.NE.0) PRINT 190,AX                                        XEN  187
  190 FORMAT(1H ,9E12.8)                                                XEN  188
  200 IF (AX.GT.AMAX(I)) AMAX(I)=AX                                     XEN  189
      IF (KT1.NE.0) PRINT 210,AMAX                                      XEN  190
  210 FORMAT( 1H ,9E12.8)                                               XEN  191
C                                                                       XEN  192
      JW=1                                                              XEN  193
      SINA=0.0                                                          XEN  194
      IF(KTEST1.NE.0) TAV1=TIMEF(1)                                     XEN  195
  220 NLINE=50                                                          XEN  196
      


  830 FORMAT(1H1)                                                       XEN  413
      END

      REAL FUNCTION TIMEF(I)
      CALL SYSTEM_CLOCK(ICOUNT,IRATE)
      TIMEF = FLOAT(ICOUNT) / FLOAT(IRATE)
      RETURN
      END

      SUBROUTINE RANFSET(T)
      DIMENSION ISEED(8)
      ISEED = TRANSFER(T, 1)
      CALL RANDOM_SEED(PUT=ISEED)
      END

      REAL FUNCTION ABSF(X)
      ABSF = ABS(X)
      RETURN
      END

      REAL FUNCTION EXPF(X)
      EXPF = EXP(X)
      RETURN
      END
