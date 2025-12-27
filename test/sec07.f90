program test
    implicit none
    
    ! variable declarations
    integer :: modi(7)
    real :: teta(256)
    real :: z1(8), z2(8)

    integer :: kx, i, ix, j
    real :: x1, xlambda, tx1, tx2

    ! arrays
    modi = [64, 32, 16, 8, 4, 2, 1]
    read(*, '(12f6.6)') (teta(i), i = 1, 256)
    read(*, '(6(f3.2, f9.8), /, f3.2, f9.8, e6.2, f9.8)') (z1(i), z2(i), i = 1, 8)

    ! ------------ START ------------ !
    kx = 1
    ! do j = 1, 10000
    ! call random_number(x1)
    x1 = 0.999992132 
    
    ! find lambda such that theta(lambda) = x1
    find_lambda: block
        if (x1 < 0.9997) then
            ! find the closest value in the teta table, starting at the midpoint
            i = 128
            do ix = 1, 7
                if (teta(i) < x1) then
                    i = i + modi(ix)
                else if (teta(i) > x1) then
                    i = i - modi(ix)
                else
                    xlambda = 0.01 * real(i - 1)
                    exit find_lambda
                end if
            end do

            ! interpolate the lambda value
            if (teta(i) > x1) i = i - 1
            tx1 = teta(i)
            xlambda = 0.01 * (real(i-1) + (x1 - tx1) / (teta(i+1) - tx1))
    
        else if (x1 > 0.9997) then
            ! find the closest value in the z2 table
            do i = 2, 7
                tx1 = z2(i)
                if (x1 < tx1) then
                    tx2 = z1(i)
                    xlambda = tx2 - ((tx1 - x1) / (tx1 - z2(i-1))) * (tx2 - z1(i-1))
                    exit find_lambda    
                else if (x1 == tx1) then
                    xlambda = z1(i)
                    exit find_lambda
                end if
            end do

            ! random number x1 is really close to 1
            i = 8
            tx1 = 1.0
            tx2 = z1(i)
            xlambda = tx2 - ((tx1 - x1) / (tx1 - z2(i-1))) * (tx2 - z1(i-1))

        else
            xlambda = 2.55

        end if
    end block find_lambda

    write (*, *) xlambda
    ! end do
            
end program test
