! gfortran src/test0.f90 -o test090; ./test090 < ex/input.txt > out090.txt
program fsm
    implicit none

    !-----------------------------!
    !    VARIABLE DELCARATIONS    !                                              
    !-----------------------------!

    integer :: modi(7)
    real    :: teta(256), z1(8), z2(8)

    real    :: delta, v3, a10, a20, a17, a30, a35, bf, sqpi, epsi, vitlim, &
               alea, alim, gtna, gtns, r
    integer :: kt1, kt2, kw, knl, ktr, kte, kr1
    integer :: nt(12) ! since ktr = 12

    integer :: ktest1, ktest2, ktest3

    ! ktr = 12, j = 12, and j = 50 are arbitrary
    real    :: hamin(12,50), hamax(12,50), hbmin(12,50), hbmax(12,50), &
               gn(12,50), pn(12,50), spn(12,50), e(12,12), amax(12)

    ! iterators
    integer :: i, kts

    !---------------------------------!
    !    READ CONSTANTS AND TABLES    !
    !---------------------------------!

    ! load and display input data
    call load_input()
    call disp_input()

    ! assign variables
    modi = (/ (8 - i, i = 1, 7) /)

    r = kte - 1
    a10 = a10 * sqpi
    a20 = a20 * sqpi / r
    a30 = a30 * sqpi

    ! if alea is non-zero, random numbers are generated from a time seed
    ! this means that each run of the program will produce different output
    if (alea .ne. 0.0) call ranfset()
    
    write(*, '(a1)') achar(12)

    ! 



    contains

    ! read input data
    subroutine load_input()

        ! normal distribution
        read(*, '(12f6.6)') (teta(i), i = 1, 256)
        read(*, '(6(f3.2, f9.8), /, f3.2, f9.8, e6.2, f9.8)') &
            (z1(i), z2(i), i = 1, 8)

        ! constants and musical parameters
        read(*, '(f3.0, f3.3, 5f3.1, f2.0, f8.7, f8.8, f4.2, f8.8, f5.2)') &
            delta, v3, a10, a20, a17, a30, a35, &
            bf, sqpi, epsi, vitlim, alea, alim
        read(*, '(5i3, 2i2, 2f6.0, 12i2)') &
            kt1, kt2, kw, knl, ktr, kte, kr1, gtna, gtns, (nt(i), i = 1, ktr)

        ! debugging constants
        read(*, '(5i3)') ktest3, ktest1, ktest2

        ! instruments
        do i = 1, ktr
            kts = nt(i)
            read(*, '(5(5f2.0, f3.3))') ( &
                hamin(i,j), hamax(i,j), hbmin(i,j), hbmax(i,j), &
                gn(i,j), pn(i,j), j = 1, kts)
            read(*, '(12f2.2)') (e(i,j), j = 1, kte)
        end do

    end subroutine load_input

    ! display input data
    subroutine disp_input()

        ! normal distribution
        write(*, '( &
            a1, "  THE TETA TABLE = ", /, 21(12f10.6, /), 4f10.6, /////, &
            "THE Z1 TABLE = ", /, 7f6.2, e12.3, ///, &
            "THE Z2 TABLE = ", /, 8f14.8, / )') &
            achar(12), teta, z1, z2

        ! constants and musical parameters
        write(*, '( &
            a1, "DELTA = ", f4.0, /, "V3 = ", f6.3, /, "A10 = ", f4.1, /, &
            "A20 = ", f4.1, /, "A17 = ", f4.1, /, "A30 = ", f4.1, /, "A35 = ", f4.1, /, &
            "BF = ", f3.0, /, "SQPI = ", f11.8, /, "EPSI = ", f12.8, /, &
            "VITLIM = ", f5.2, /, "ALEA = ", f12.8, /, "ALIM = ", f6.2, /, &
            "KT1 = ", i3, /, "KT2 = ", i3, /, "KW = ", i3, /, "KNL = ", i3, /, "KTR = ", i3, /, &
            "KTE = ", i2, /, "KR1 = ", i2, /, "GTNA = ", f7.0, /, "GTNS = ", f7.0, /, &
            12("IN CLASS ", i2, ", THERE ARE ", i2, " INSTRUMENTS.", /) )') &
            achar(12), delta, v3, a10, a20, a17, a30, a35, bf, sqpi, epsi, vitlim, alea, alim, &
            kt1, kt2, kw, knl, ktr, kte, kr1, gtna, gtns, (i, nt(i), i = 1, ktr)   

        ! debugging controls
        write(*, '("KTEST3 = ", i3, /, "KTEST1 = ", i3, /, "KTEST2 = ", i3) ') &   
            ktest3, ktest1, ktest2
        if (ktest3 .ne. 0) write(*, '(a1)') achar(12)
        
        write(*, '(a1)') achar(12)

        ! instruments
        
    end subroutine disp_input

    ! get system clock time
    function current_time() result(sys_time)

        integer :: clock_count, clock_rate
        real    :: sys_time

        call system_clock(clock_count, clock_rate)
        sys_time = real(clock_count) / real(clock_rate)

    end function current_time

    ! set the seed for random generator based on system clock time
    subroutine ranfset()

        integer :: seed(8)

        seed = transfer(current_time(), 1)
        call random_seed(put=seed)
    
    end subroutine ranfset

end program fsm



































!-----------------------------------------!
! GLOSSARY OF THE PRINCIPAL ABBREVIATIONS !
!-----------------------------------------!

! modi: auxiliary function to interpolate values in the theta table (see part 7)
! theta: erf(x) for x = 0.00, 0.01, ..., 2.56 (rounding errors near end)
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

! ktest1, tav1, etc.: expressions useful in calculating how long the various parts of the program will run

! hamin, hamax, hbmin, hbmax: table of instrument compass limits, depending on timbre class i and instrument j.
!                             test instruction 480 in part 6 determines whether the ha or the hb table is followed.
!                             the number 7 is arbitrary.
! gn: table of the given length of breath for each instrument, depending on class i and instrument j
! pn: table of probability of each instrument of the class i
! e: probabilities of the ktr timbre classes introduced as input data,
!    depending on the class number i = kr and on the power j = u obtained from v3 * exp(u) = da

! C     (AMAX(I),I=1,KTR) TABLE OF AN EXPRESSION ENTERING INTO THE        XEN   16
! C     CALCULATION OF THE NOTE LENGTH IN PART 8                          XEN   17
! C     ALFA(3) - THREE EXPRESSIONS ENTERING INTO THE THREE SPEED VALUES  XEN   13
! C     OF THE SLIDING TONES ( GLISSANDI )                                XEN   14
! C     JW - ORDINAL NUMBER OF THE SEQUENCE COMPUTED.                     XEN   36
! C     SINA - SUM OF THE COMPUTED NOTES IN THE NEW CLOUDS NA, ALWAYS LESSXEN   60
! C     THAN GTNS ( SEE TEST IN PART 10 ).                                XEN   61
! C     A - DURATION OF EACH SEQUENCE IN SECONDS                          XEN    9
! C     NA - NUMBER OF SOUNDS CALCULATED FOR THE SEQUENCE A(NA=DA*A)      XEN   50
! C     (Q(I),I=1,KTR) PROBABILITIES OF THE KTR TIMBRE CLASSES, CONSIDEREDXEN   55
! C     AS LINEAR FUNCTIONS OF THE DENSITY DA.                            XEN   56
! C     (S(I),I=1,KTR) SUM OF THE SUCCESSIVE Q(I) PROBABILITIES, USED TO  XEN   57
! C     CHOOSE THE CLASS KR BY COMPARING IT TO A RANDOM NUMBER X1 (SEE    XEN   58
! C     PART 3, LOOP 380 AND PART 5, LOOP 430).                           XEN   59

! C     TA - SOUND ATTACK TIME ABCISSA.                                   XEN   63
! C     VIGL - GLISSANDO SPEED (VITESSE GLISSANDO), WHICH CAN VARY AS, BE XEN   67
! C     INDEPENDENT OF, OR VARY INVERSELY AS THE DENSITY OF THE SEQUENCE, XEN   68
! C     THE ACTUAL MODE OF VARIATION EMPLOYED REMAINING THE SAME FOR THE  XEN   69
! C     ENTIRE SEQUENCE (SEE PART 7).                                     XEN   70





    ! integer :: ktest1, ktest2, ktest3

    ! ! ktr = 12, j = 12 and j = 50 are arbitrary
    ! integer :: kts
    ! real :: hamin(12,50), hamax(12,50), hbmin(12,50), hbmax(12,50), gn(12,50), pn(12,50), spn(12,50)
    ! real :: e(12,12)
    ! real :: amax(12)


    ! ! others, unordered
    ! real :: vigl(3), alpha(3)
    ! real :: q(12), s(12)
    ! real :: h(12, 50)

    ! integer :: jw, na
    ! real :: sina
    ! real :: a

    ! ! iterators and temporary variables
    ! integer :: i, j, r, kna, k1, k2, m, m1, m2
    ! real :: y, x1, x2, upr, ux, tmp, u, da, xlogda, xalog, sr, alfx, beta, qr, xm