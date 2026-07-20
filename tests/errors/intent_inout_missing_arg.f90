module caller_mod
    implicit none
    type :: caller_t
        integer :: id
    end type caller_t
contains
    subroutine set_caller(this, caller)
        type(caller_t), intent(inout) :: this
        type(caller_t), intent(in) :: caller
        this%id = caller%id
    end subroutine set_caller
end module caller_mod

program intent_inout_missing_arg
    use caller_mod
    type(caller_t) :: upper_caller
    call set_caller(upper_caller)
end program intent_inout_missing_arg
