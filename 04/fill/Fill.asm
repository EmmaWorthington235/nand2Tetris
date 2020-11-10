//working fill
(Loop) //resets once it gets to last pixel back to start of screen
@SCREEN //screen val
D=A
@address //address changing
M=D

(Skip) //start of loop
@KBD //kbd input
D=M

@Color //skips next step if white
D;JEQ 
D=-1 //if black

(Color)
@address 
A=M //temporarily sets address to the memorry stored in address which is the incromented spot
M=D //memory at the temporary address is d

@address //*to check if finished fling in screen
D=M

@KBD
D=A-D

@Loop
D;JEQ //*

@address //inc spot
M=M+1

@Skip //back to start of inner loop
0;JMP