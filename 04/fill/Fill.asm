(Loop)
@SCREEN //screen val
D=A
@address //address changing
M=D

(Skip)
@KBD
D=M

@Color
D;JEQ
D=-1

(Color)
@address
A=M
M=D

@address
D=M

@KBD
D=A-D
@Loop
D;JEQ

@address
M=M+1

@Skip
0;JMP