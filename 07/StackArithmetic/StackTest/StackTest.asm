@17
D=A
@SP
M=M+1
A=M-1
M=D
@17
D=A
@SP
M=M+1
A=M-1
M=D
@SP
A=M-1
A=A-1
D=M
A=A+1
D=D-M
@TRUE0
D;JEQ
@SP
AM=M-1
A=A-1
M=0
@NEXT0
0;JMP
(TRUE0)
@SP
AM=M-1
A=A-1
M=-1
(NEXT0)
@17
D=A
@SP
M=M+1
A=M-1
M=D
@16
D=A
@SP
M=M+1
A=M-1
M=D
@SP
A=M-1
A=A-1
D=M
A=A+1
D=D-M
@TRUE1
D;JEQ
@SP
AM=M-1
A=A-1
M=0
@NEXT1
0;JMP
(TRUE1)
@SP
AM=M-1
A=A-1
M=-1
(NEXT1)
@16
D=A
@SP
M=M+1
A=M-1
M=D
@17
D=A
@SP
M=M+1
A=M-1
M=D
@SP
A=M-1
A=A-1
D=M
A=A+1
D=D-M
@TRUE2
D;JEQ
@SP
AM=M-1
A=A-1
M=0
@NEXT2
0;JMP
(TRUE2)
@SP
AM=M-1
A=A-1
M=-1
(NEXT2)
@892
D=A
@SP
M=M+1
A=M-1
M=D
@891
D=A
@SP
M=M+1
A=M-1
M=D
@SP
A=M-1
D=M
A=A-1
D=M-D
@TRUE3
D;JLT
@SP
AM=M-1
A=A-1
M=0
@NEXT3
0;JMP
(TRUE3)
@SP
AM=M-1
A=A-1
M=-1
(NEXT3)
@891
D=A
@SP
M=M+1
A=M-1
M=D
@892
D=A
@SP
M=M+1
A=M-1
M=D
@SP
A=M-1
D=M
A=A-1
D=M-D
@TRUE4
D;JLT
@SP
AM=M-1
A=A-1
M=0
@NEXT4
0;JMP
(TRUE4)
@SP
AM=M-1
A=A-1
M=-1
(NEXT4)
@891
D=A
@SP
M=M+1
A=M-1
M=D
@891
D=A
@SP
M=M+1
A=M-1
M=D
@SP
A=M-1
D=M
A=A-1
D=M-D
@TRUE5
D;JLT
@SP
AM=M-1
A=A-1
M=0
@NEXT5
0;JMP
(TRUE5)
@SP
AM=M-1
A=A-1
M=-1
(NEXT5)
@32767
D=A
@SP
M=M+1
A=M-1
M=D
@32766
D=A
@SP
M=M+1
A=M-1
M=D
@SP
A=M-1
D=M
A=A-1
D=M-D
@TRUE6
D;JGT
@SP
AM=M-1
A=A-1
M=0
@NEXT6
0;JMP
(TRUE6)
@SP
AM=M-1
A=A-1
M=-1
(NEXT6)
@32766
D=A
@SP
M=M+1
A=M-1
M=D
@32767
D=A
@SP
M=M+1
A=M-1
M=D
@SP
A=M-1
D=M
A=A-1
D=M-D
@TRUE7
D;JGT
@SP
AM=M-1
A=A-1
M=0
@NEXT7
0;JMP
(TRUE7)
@SP
AM=M-1
A=A-1
M=-1
(NEXT7)
@32766
D=A
@SP
M=M+1
A=M-1
M=D
@32766
D=A
@SP
M=M+1
A=M-1
M=D
@SP
A=M-1
D=M
A=A-1
D=M-D
@TRUE8
D;JGT
@SP
AM=M-1
A=A-1
M=0
@NEXT8
0;JMP
(TRUE8)
@SP
AM=M-1
A=A-1
M=-1
(NEXT8)
@57
D=A
@SP
M=M+1
A=M-1
M=D
@31
D=A
@SP
M=M+1
A=M-1
M=D
@53
D=A
@SP
M=M+1
A=M-1
M=D
@SP
AM=M-1
D=M
A=A-1
M=M+D
@112
D=A
@SP
M=M+1
A=M-1
M=D
@SP
AM=M-1
D=M
A=A-1
M=M-D
@SP
A=M-1
M=-M
@SP
AM=M-1
D=M
A=A-1
M=D&M
@82
D=A
@SP
M=M+1
A=M-1
M=D
@SP
AM=M-1
D=M
A=A-1
M=D|M
@SP
A=M-1
M=!M