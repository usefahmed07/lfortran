C***********************************************************************
C     Regression test for https://github.com/lfortran/lfortran/issues/12283
C     A `.f` file must be parsed as fixed-form by default, with no
C     --fixed-form / --fixed-form-infer flag needed, matching gfortran.
C***********************************************************************
      PROGRAM FIXED_FORM_INFER_DEFAULT_01
      INTEGER A
      A = 1
      IF (A .NE. 1) ERROR STOP
      END
