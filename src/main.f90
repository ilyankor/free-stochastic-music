program fsm
    implicit none

    !-----------------------------------------!
    ! GLOSSARY OF THE PRINCIPAL ABBREVIATIONS !
    !---------------------------------------- !

    ! modi: auxiliary function to interpolate values in the theta table (see part 7)
    ! theta: erf(x) for x = 0.00, 0.01, ... 2.55
    ! z1, z2: z2 = erf(x) for x in z1

    ! delta: the reciprocal of the mean density of sound events during a sequence of duration A
    ! v3: minimum cloud density DA
    ! a10, a20, a17, a30, a35: numbers for glissando calculation
    ! bf: dynamic form number. the list is established independently of this program and is subject to modification
    ! sqpi: square root of pi
    ! epsi: epsilon for accuracy in calculating pn and e(i,j)
    ! vitlim: maximum limiting glissando speed (semitones/second)
    ! alea: parameter used to alter the result of a second run with the same input data
    ! alim: maximum limit of sequence duration A

    ! kt1: 0 if the program is being run, nonzero during debugging
    ! kt2: number of loops, arbitrarily set to 15
    ! kw: maximum number of jw
    ! knl: number of lines per page of the printed result, set to 50
    ! ktr: number of timbre classes
    ! kte: da(max) = v3 * e ** (kte - 1)
    ! kr1: number in the class kr=1 used for percussion or instruments without a definite pitch
    ! gtna: greatest number of notes in the sequence of duration A
    ! gtns: greatest number of notes in kw loops
    ! nt: number of instruments in each of the ktr timbre classes

! C     A - DURATION OF EACH SEQUENCE IN SECONDS                          XEN    9
! C     ALFA(3) - THREE EXPRESSIONS ENTERING INTO THE THREE SPEED VALUES  XEN   13
! C     OF THE SLIDING TONES ( GLISSANDI )                                XEN   14
! C     (AMAX(I),I=1,KTR) TABLE OF AN EXPRESSION ENTERING INTO THE        XEN   16
! C     CALCULATION OF THE NOTE LENGTH IN PART 8                          XEN   17
! C     (E(I,J),I=1,KTR,J=1,KTE) - PROBABILITIES OF THE KTR TIMBRE CLASSESXEN   22
! C     INTRODUCED AS INPUT DATA, DEPENDING ON THE CLASS NUMBER I=KR AND  XEN   23
! C     ON THE POWER J=U OBTAINED FROM V3*EXPF(U)=DA                      XEN   24
! C     (GN(I,J),I=1,KTR,J=1,KTS) - TABLE OF THE GIVEN LENGTH OF BREATH   XEN   27
! C     FOR EACH INSTRUMENT, DEPENDING ON CLASS I AND INSTRUMENT J        XEN   28
! C     (HAMIN(I,J),HAMAX(I,J),HBMIN(I,J),HBMAX(I,J),I=1,KTR,J=1,KTS)     XEN   31
! C     TABLE OF INSTRUMENT COMPASS LIMITS, DEPENDING ON TIMBRE CLASS I   XEN   32
! C     AND INSTRUMENT J. TEST INSTRUCTION 480 IN PART 6 DETERMINES       XEN   33
! C     WHETHER THE HA OR THE HB TABLE IS FOLLOWED. THE NUMBER 7 IS       XEN   34
! C     ARBITRARY.                                                        XEN   35
! C     JW - ORDINAL NUMBER OF THE SEQUENCE COMPUTED.                     XEN   36
! C     KTEST1,TAV1,ETC - EXPRESSIONS USEFUL IN CALCULATING HOW LONG THE  XEN   44
! C     VARIOUS PARTS OF THE PROGRAM WILL RUN.                            XEN   45
! C     NA - NUMBER OF SOUNDS CALCULATED FOR THE SEQUENCE A(NA=DA*A)      XEN   50
! C     (NT(I),I=1,KTR) NUMBER OF INSTRUMENTS ALLOCATED TO EACH OF THE    XEN   51
! C     KTR TIMBRE CLASSES.                                               XEN   52
! C     (PN(I,J),I=1,KTR,J=1,KTS),(KTS=NT(I),I=1,KTR) TABLE OF PROBABILITYXEN   53
! C     OF EACH INSTRUMENT OF THE CLASS I.                                XEN   54
! C     (Q(I),I=1,KTR) PROBABILITIES OF THE KTR TIMBRE CLASSES, CONSIDEREDXEN   55
! C     AS LINEAR FUNCTIONS OF THE DENSITY DA.                            XEN   56
! C     (S(I),I=1,KTR) SUM OF THE SUCCESSIVE Q(I) PROBABILITIES, USED TO  XEN   57
! C     CHOOSE THE CLASS KR BY COMPARING IT TO A RANDOM NUMBER X1 (SEE    XEN   58
! C     PART 3, LOOP 380 AND PART 5, LOOP 430).                           XEN   59
! C     SINA - SUM OF THE COMPUTED NOTES IN THE NEW CLOUDS NA, ALWAYS LESSXEN   60
! C     THAN GTNS ( SEE TEST IN PART 10 ).                                XEN   61
! C     SQPI - SQUARE ROOT OF PI ( 3.14159...)                            XEN   62
! C     TA - SOUND ATTACK TIME ABCISSA.                                   XEN   63
! C     VIGL - GLISSANDO SPEED (VITESSE GLISSANDO), WHICH CAN VARY AS, BE XEN   67
! C     INDEPENDENT OF, OR VARY INVERSELY AS THE DENSITY OF THE SEQUENCE, XEN   68
! C     THE ACTUAL MODE OF VARIATION EMPLOYED REMAINING THE SAME FOR THE  XEN   69
! C     ENTIRE SEQUENCE (SEE PART 7).                                     XEN   70

    !-----------------------!
    ! VARIABLE DECLARATIONS !
    !-----------------------!

    integer :: i
    integer :: r

    integer :: modi(7)
    real :: theta(256)
    real :: z1(8), z2(8)

    real :: delta, v3, a10, a20, a17, a30, a35, bf, sqpi, epsi, vitlim, alea, alim

    integer :: kt1, kt2, kw, knl, ktr, kte, kr1
    real :: gtna, gtns
    integer :: nt(12) ! since ktr = 12

    integer :: ktest1, ktest2, ktest3

    !---------------------------!
    ! READ CONSTANTS AND TABLES !
    !---------------------------!

    ! normal distribution
    modi = (/ (8 - i, i = 1, 7) /)
    read(*, '(12F6.6)') (theta(i), i = 1, 256)
    read(*, '(6(F3.2, F9.8), /, F3.2, F9.8, E6.2, F9.8)') (z1(i), z2(i), i = 1, 8)

!!!!! PRINT THE TABLES
!       PRINT 40,TETA,Z1,Z2                                               XEN   95
!    40 FORMAT('1  THE TETA TABLE = ',/,21(12F10.6,/),4F10.6,/////,       XEN   96
!      *' THE Z1 TABLE = ',/,7F6.2,E12.3,///,' THE Z2 TABLE = ',/,8F14.8,/XEN   97
!      *1H1)                                                              XEN   98

    ! constants and musical parameters
    read(*, '(F3.0, F3.3, 5F3.1, F2.0, F8.7, F8.8, F4.2, F8.8, F5.2)') &
        delta, v3, a10, a20, a17, a30, a35, bf, sqpi, epsi, vitlim, alea, alim
    read(*, '(5I3, 2I2, 2F6.0, 12I2)') &
        kt1, kt2, kw, knl, ktr, kte, kr1, gtna, gtns, (nt(i), i = 1, ktr)

!!!!! PRINT THE CONSTANTS
!       PRINT 70,DELTA,V3,A10,A20,A17,A30,A35,BF,SQPI,EPSI,VITLIM,ALEA,  AXEN  127
!      1LIM,KT1,KT2,KW,KNL,KTR,KTE,KR1,GTNA,GTNS,(I,NT(I),I=1,KTR)        XEN  128
!    70 FORMAT('1DELTA = ',F4.0,/,' V3 = ',F6.3,/,' A10 = ',F4.1,/,       XEN  129
!      *' A20 = ',F4.1,/,' A17 = ',F4.1,/,' A30 = ',F4.1,/,' A35 = ',F4.1,XEN  130
!      */,' BF = ',F3.0,/,' SQPI =',F11.8,/,' EPSI =',F12.8,/,' VITLIM = 'XEN  131
!      *,F5.2,/,' ALEA =',F12.8,/,' ALIM = ',F6.2,/,' KT1 = ',I3,/,       XEN  132
!      *' KT2 = ',I3,/,' KW = ',I3,/,' KNL = ',I3,/,' KTR = ',I3,/,       XEN  133
!      *' KTE = ',I2,/,' KR1 = ',I2,/,' GTNA = ',F7.0,/,' GTNS = ',F7.0,  XEN  134
!      */,12(' IN CLASS ',I2,', THERE ARE ',I2,' INSTRUMENTS.',/))        XEN  135

    ! more constants
    read(*, '(5I3)') ktest3, ktest1, ktest2

!!!!! PRINT THE CONSTANTS
!       PRINT 90,KTEST3,KTEST1,KTEST2                                     XEN  142
!    90 FORMAT(' KTEST3 = ',I3,/,' KTEST1 = ',I3,/,' KTEST2 = ',I3)       XEN  143

!!!!! PRINT NEW PAGE IF KTEST3 NEQ 0
!       IF(KTEST3.NE.0) PRINT 830                                         XEN  145
!  830  FORMAT(1H1)                                                       XEN  413

    r = kte - 1
    a10 = a10 * sqpi
    a20 = a20 * sqpi / r
    a30 = a30 * sqpi

! C     IF ALEA IS NON-ZERO,THE RANDOM NUMBER IS GENERATED FROM THE TIME  XEN  150
! C     WHEN THE FOLLOWING INSTRUCTION IS EXECUTED. IF ALEA IS NON-ZERO   XEN  151
! C     EACH RUN OF THIS PROGRAM WILL PRODUCE DIFFERENT OUTPUT DATA.      XEN  152
    !   IF(ALEA.NE.0.0) CALL RANFSET(TIMEF(1))                            XEN  153



    

end program fsm