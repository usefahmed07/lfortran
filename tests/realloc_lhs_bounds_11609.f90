program realloc_lhs_bounds_11609
  implicit none
  integer, allocatable :: x(:)
  x = f()
  print *, lbound(x), ubound(x)
contains
  function f() result(res)
    integer :: res(-2:2)
    res = [1, 2, 3, 4, 5]
  end function f
end program realloc_lhs_bounds_11609
