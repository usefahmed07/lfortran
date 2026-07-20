C***********************************************************************
C     Comment lines that begin with a comment indicator (C, c, or *)
C     immediately followed by more of the same or other characters
C     (no space required) must still be recognized as full-line
C     comments in fixed form.
C***********************************************************************
c-------------------------------------------------------------------
*     A line starting with '*' is also a comment line.
      PROGRAM FIXED_FORM_COMMENT_02
      INTEGER A
      A = 1
      IF (A .NE. 1) ERROR STOP
      END
