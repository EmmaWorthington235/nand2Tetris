@R2
M=0

(loop)
@R1
D=M
@end
D;JEQ

@R0
D=M

@R2
M=M+D

@R1
M=M-1

@loop
0; JMP

(End)
//@END
//0;JMP