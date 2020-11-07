(Loop)
@SCREEN //screen val
D=A
@address //address changing
M=D

(Skip)
@KBD
D=M
@R0
A=D

@White
D;JEQ
@Black
0;JMP

(Check)
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

(White)
@address
A=M
M=0
@Check
0;JMP

(Black)
@address
A=M
M=-1
@Check
0;JMP