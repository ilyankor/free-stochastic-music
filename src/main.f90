program fsm
    implicit none

    !-----------------------!
    ! VARIABLE DECLARATIONS !
    !-----------------------!

    integer :: modi(7)
    real :: theta(256)
    real :: z1(8), z2(8)

    real :: delta, v3, a10, a20, a17, a30, a35, bf, sqpi, epsi, vitlim, alea, alim
    integer :: kt1, kt2, kw, knl, ktr, kte, kr1
    real :: gtna, gtns
    integer :: nt(12) ! since ktr = 12

    integer :: ktest1, ktest2, ktest3

    ! ktr = 12, j = 12 and j = 50 are arbitrary
    integer :: kts
    real :: hamin(12,50), hamax(12,50), hbmin(12,50), hbmax(12,50), gn(12,50), pn(12,50), spn(12,50)
    real :: e(12,12)
    real :: amax(12)


    ! others, unordered
    real :: vigl(3), alpha(3)
    real :: q(12), s(12)
    real :: h(12, 50)

    integer :: jw, na
    real :: sina
    real :: a

    ! iterators and temporary variables
    integer :: i, j, r, kna, k1, k2, m, m1, m2
    real :: y, x1, x2, upr, ux, tmp, u, da, xlogda, xalog, sr, alfx, beta, qr, xm

    !---------------------------!
    ! READ CONSTANTS AND TABLES !
    !---------------------------!

    call load_input()
    call disp_input()

    ! create modi
    modi = (/ (8 - i, i = 1, 7) /)

    ! compute constants
    r = kte - 1
    a10 = a10 * sqpi
    a20 = a20 * sqpi / r
    a30 = a30 * sqpi

    ! (if alea neq 0, set seed)

    jw = 1
    sina = 0.0

    !----------------------------------------------------------------!
    ! PARTS 1 AND 2. DEFINE SEQUENCE A SECONDS AND CLOUD NA DURING A !
    !----------------------------------------------------------------!

    kna = 0
    k1 = 0
    k2 = 0
    do
        ! choose a
        if (kna .ge. kt2) then
            a = delta
        else
            do
                call random_number(x1)
                a = - delta * log(x1)

                if (a .le. alim) exit

                if (k1 .ge. kt2) then
                    a = 0.5 * alim
                    x1 = 0.0
                    exit
                end if

                k1 = k1 + 1
            end do
        end if

        ! choose u
        if (jw .gt. 1) then
            do
                call random_number(x2)
                call random_number(tmp)

                if (tmp .ge. 0.5) then
                    ux = upr - r * (1.0 - sqrt(x2))
                else
                    ux = upr + r * (1.0 - sqrt(x2))
                end if

                if ((ux .ge. 0.0) .and. (ux .le. r)) exit

                if (k2 .ge. kt2) then
                    ux = r * x2
                    exit
                end if

                k2 = k2 + 1
            end do
        else
            call random_number(x2)
            ux = r * x2
        end if

        u = ux
        da = v3 * exp(u)
        na = int(a * da + 0.5) + 1

        if (gtna .gt. real(na)) then
            upr = u
            exit
        end if

        kna = kna + 1
    end do

    ! debug print
    if (kt1 .ne. 0) then
        call page_break()
        write(*, '(4i8, 3x, 4e18.8, 3x, i8)') jw, kna, k1, k2, x1, x2, a, da, na
        na = kt1
    
        if (ktest3 .ne. 0) then
            write(*, '(//, 2i9, f10.2)') jw, na, a
        end if
    end if

    !------------------------------------------------------------!
    ! PART 3. DEFINE CONSTITUTION OF ORCHESTRA DURING SEQUENCE A !
    !------------------------------------------------------------!

    sina = sina + real(na)
    xlogda = u
    xalog = a20 * xlogda

    m = int(xlogda)

    if ((m + 2) .gt. kte) m = kte - 2

    sr = 0.0
    m1 = m + 1
    m2 = m + 2

    do i = 1, ktr
        alfx = e(i, m1)
        beta = e(i, m2)
        xm = m
        qr = (xlogda - xm) * (beta - alfx) + alfx

        if (kt1 .ne. 0) then
            call page_break
            write(*, '(3f20.8)') xm, alfx, beta
        end if

        q(i) = qr
        sr = sr + qr
        s(i) = sr
    end do

    if (kt1 .ne. 0) then
        call page_break
        write(*, '(12f9.4)') (q(i), s(i), i = 1, ktr)
    end if

    !-------------------------------------------------------!
    ! PART 4. DEFINE INSTANT TA OF EACH POINT IN SEQUENCE A !
    !-------------------------------------------------------!

    
    contains

    ! read input data
    subroutine load_input()

        ! normal distribution
        read(*, '(12f6.6)') (theta(i), i = 1, 256)
        read(*, '(6(f3.2, f9.8), /, f3.2, f9.8, e6.2, f9.8)') (z1(i), z2(i), i = 1, 8)

        ! constants and musical parameters
        read(*, '(f3.0, f3.3, 5f3.1, f2.0, f8.7, f8.8, f4.2, f8.8, f5.2)') &
            delta, v3, a10, a20, a17, a30, a35, bf, sqpi, epsi, vitlim, alea, alim
        read(*, '(5i3, 2i2, 2f6.0, 12i2)') &
            kt1, kt2, kw, knl, ktr, kte, kr1, gtna, gtns, (nt(i), i = 1, ktr)

        ! debugging constants
        read(*, '(5i3)') ktest3, ktest1, ktest2

        ! instruments
        do i = 1, ktr
            kts = nt(i)
            read(*, '(5(5f2.0,f3.3))') &
                (hamin(i,j), hamax(i,j), hbmin(i,j), hbmax(i,j), gn(i,j), pn(i,j), j = 1, kts)
            read(*, '(12f2.2)') (e(i,j), j = 1, kte)
        end do

    end subroutine load_input

    ! display input data
    subroutine disp_input()

        ! normal distribution
        write(*, '( &
            " THE THETA TABLE = ", /, 21(12f10.6, /), 4f10.6, /////, &
            " THE Z1 TABLE = ", /, 7f6.2, e12.3, ///, &
            " THE Z2 TABLE = ", /, 8f14.8, / &
        )') theta, z1, z2

        call page_break()

        ! constants and musical parameters
        write(*, '( &
            " DELTA = ", f4.0, /, " V3 = ", f6.3, /, " A10 = ", f4.1, /, &
            " A20 = ", f4.1, /, " A17 = ", f4.1, /, " A30 = ", f4.1, /, " A35 = ", f4.1, /, &
            " BF = ", f3.0, /, " SQPI = ", f11.8, /, " EPSI = ",f12.8, /, &
            " VITLIM = ", f5.2, /, " ALEA = ", f12.8, /, " ALIM = ", f6.2, /, &
            " KT1 = ", i3, /, " KT2 = ", i3, /, " KW = ", i3, /," KNL = ", i3, /," KTR = ", i3, /, &
            " KTE = ", i2, /, " KR1 = ", i2, /, " GTNA = ", f7.0, /, " GTNS = ", f7.0, /, &
            12(" IN CLASS ", i2, ", THERE ARE ", i2, " INSTRUMENTS.", /) &
        )') delta, v3, a10, a20, a17, a30, a35, bf, sqpi, epsi, vitlim, alea, alim, &
            kt1, kt2, kw, knl, ktr, kte, kr1, gtna, gtns, (i, nt(i), i = 1, ktr)   

        write(*, '( &
            " KTEST3 = ", i3, /, " KTEST1 = ", i3, /, " KTEST2 = ", i3) &
        ') ktest3, ktest1, ktest2

        call page_break()

        ! instruments
        
    end subroutine disp_input

    ! simulate a page break from '1H1'
    subroutine page_break()

        write(*,'(//, a, 10(/), a, //)') &
            "------------------------------------------------------- END PAGE -------------------------------------------------------", &
            "------------------------------------------------------- NEW PAGE -------------------------------------------------------"

    end subroutine page_break

    ! get the current time of day from system clock in milliseconds
    function get_current_time() result(time)

        integer :: hmsms(8)
        integer :: time

        call date_and_time(values=hmsms)
        time = 3600000*hmsms(5) + 60000*hmsms(6) + 1000*hmsms(7) + hmsms(8)

    end function get_current_time

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
