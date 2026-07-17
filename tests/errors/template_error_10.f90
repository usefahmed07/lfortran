module lt_m
    implicit none
    private
    public :: my_type, lt_my_type

    type my_type
        real :: d
    end type

contains

    impure elemental function lt_my_type(lhs, rhs) result(res)
        type(my_type), intent(in) :: lhs, rhs
        logical :: res
        res = lhs%d < rhs%d
    end function

end module

module template_apply_m
    use lt_m
    implicit none
    private
    public :: apply_t

    requirement op_r(T, U, V, op_func)
        type, deferred :: T
        type, deferred :: U
        type, deferred :: V
        pure elemental function op_func(lhs, rhs) result(res)
            type(T), intent(in) :: lhs
            type(U), intent(in) :: rhs
            type(V) :: res
        end function
    end requirement

    template apply_t(T, lt)
        require :: op_r(T, T, logical, lt)
        private
        public :: apply_lt
    contains
        pure function apply_lt(lhs, rhs) result(res)
            type(T), intent(inout) :: lhs(:)
            type(T), intent(inout) :: rhs(:)
            type(logical) :: res
            res = all ( lt(lhs,rhs) )
        end function
    end template
end module

program template_error_10
    use lt_m
    use template_apply_m

    instantiate apply_t(my_type,lt_my_type), only : my_apply => apply_lt
end program
