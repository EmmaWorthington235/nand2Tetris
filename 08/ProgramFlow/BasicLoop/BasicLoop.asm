@0
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
(null$LOOP_START)
@0
D=A
@ARG
A=D+M
D=M
@SP
M=M+1
A=M-1
M=D
@0
D=A
@LCL
A=D+M
D=M
@SP
M=M+1
A=M-1
M=D
@SP
AM=M-1
D=M
A=A-1
M=M+D
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0
D=A
@ARG
A=D+M
D=M
@SP
M=M+1
A=M-1
M=D
@1
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
@ARG
D=M
@0
D=D+A
@R13
M=D
@SP
AM=M-1
D=M
@R13
A=M
M=D
@0
D=A
@ARG
A=D+M
D=M
@SP
M=M+1
A=M-1
M=D
@SP
AM=M-1
D=M
@null$LOOP_START
D;JNE
@0
D=A
@LCL
A=D+M
D=M
@SP
M=M+1
A=M-1
M=D