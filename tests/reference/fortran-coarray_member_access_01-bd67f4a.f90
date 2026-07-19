program coarray_member_access_01
implicit none
type :: t
    integer(4) :: val
end type t
type(t) :: x
x%val = this_image()
if (this_image() == 1) then
    print *, x%val
end if
end program coarray_member_access_01
