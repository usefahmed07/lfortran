program coarray_member_access_01
    implicit none

    type :: t
        integer :: val
    end type

    type(t) :: x[*]
    x%val = this_image()

    if (this_image() == 1) then
        print *, x[1]%val
    end if
end program
