//improved(GetBin)
@32
D=A
@SCREEN
A=A+D
M=1

(GetBin)
@0 //should be using counter val here
D=A
@binCounter
M=D
@bin //bin stories the binary value
M=1
M=M+1

@LeaveBin
D;JEQ

(Times2Loop)
@bin
D=M
M=M+D

@binCounter
M=M-1
D=M

@Times2Loop
D;JNE

@LeaveBin
0;JMP

(LeaveBin)
@bin
M=M-1
D=M
@SCREEN
M=D

(OutBin)
@OutBin
0;JMP