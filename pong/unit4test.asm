//basic version
@SCREEN
D=A
@spot
M=D

@48
D=A
@counter
M=D

(Loop)
@spot
A=M
M=-1
A=A+1
M=-1
A=A+1
M=-1

@32
D=A
@spot
M=M+D

@counter
M=M-1
D=M
@End
D;JEQ
@Loop
0;JMP

(End)
@End
0;JMP