program leastsquare
    ! Nicholas Maynard
    ! CSI 501
    ! Lab 7
    ! 03/09/2023
    ! This program performs a least squares calculation for inputted data.
 
    ! Clear out the memory
    implicit none

    ! Declare our Variables
    real :: xAve, yAve, Sxx, Sxy = 0.0
    real :: x, y, m, b
    integer :: n = 200
    integer :: i

    ! Read in the Data File
    open(42,file='LineData.txt')
    open(13,file='Output.txt')

    ! Compute the Linear Least Squares
    do i = 1, n
        read(42,*) x, y
        Sxx = Sxx + ((float(i) - 1)/float(i)) * (x - xAve)**2
        Sxy = Sxy + ((float(i) - 1)/float(i)) * (x - xAve) * (y - yAve)
        xAve = xAve + (x - xAve) / float(i)
        yAve = yAve + (y - yAve) / float(i)
        m = Sxy / Sxx
        b = yAve - m* xAve
    enddo
    
    ! Write our output
    write(13,*) m, b

    ! Close our Folders
    close(42)
    close(13)

 end program leastsquare
 