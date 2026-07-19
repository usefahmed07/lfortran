program coarray_member_access_multi_image_01
    implicit none
    type :: t
        integer :: val
    end type
    type(t) :: x[*]

    x%val = 42
    if (this_image() == 1) then
        print *, x[1]%val
    end if
end program
