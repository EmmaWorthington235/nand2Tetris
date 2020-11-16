//drops ball w key//ERROR IF HITS BOTTOM
(Start) //start of program
@KBD //gets value of one past last pixel
D=A //sets d = to one more than last pixel
@16 //goes to 15 and subtracts 15 from d
D=D-A //now d is around the bottom of the middle
@R14 //saves value in r14 - r14 is used as start of paddle
M=D //when reffering to the start of the paddle i mean the bottom right
@downKey
M=0

(NewPaddle) //starts making a new paddle
@R14 //r14 is where start of paddle is stored (bottom right addy)
D=M //d=start of where paddle needs to go
@R15 //r15 is temp variable so that r14 isnt edited but it changes lines
M=D //initially sets r15 to r14
@3 //3 to count three lines
D=A
@counter //sets counter = to 3
M=D

(CreatePaddle) //creates one row
@R15 //at temp address (initially bottom right then incd)
A=M+1 //sets right of paddle to white(incase moved)
M=0 //sets blank
A=A-1 //sets right bus black
M=-1
A=A-1 //sets middle bus black
M=-1
A=A-1 //sets left bus black
M=-1
A=A-1 //sets left of paddle white
M=0 //*the temp address(R15) is not changed only temporarily

(DecLine)
@32 //512 bits per line/16 bits per line= 32 busses per line    //change to 29 to check number of lines
D=A //saves 32
@R15 //bc 32 busses per line to get to new line subrtact 32
M=M-D //temp address-32 = new line *the temp address(R15) is not edited when setting the three diff busses
@counter //counter created when starting new paddle
M=M-1 //subtracts one from counter
D=M //sets d= new val of counter
@TimeDelay //leaves this loop, next thing it needs to do is delay time so goes there
D;JEQ //if counter = 0 goes to time delay (has run through three times)
@CreatePaddle //if counter != 0 repeats to create next 3 part horizontal line of paddle
0;JMP //forces jump

(CheckKBD) //check kbd checks if arrows r being pressed
@KBD //gets value of keyboard stored in m
D=M //sets d=value of kbd
@133
D=D-A
@CreateBall
D;JEQ
(OutBall)
@KBD //gets value of keyboard stored in m
D=M //sets d=value of kbd
@130 //130 is ascii value for left arrow
D=D-A //so if kbd-130 = 0 then left arrow is being pressed
@Left
D;JEQ //jmps to left function if =0
@2 //goes to 2 bc right key has an ascii value of 132
D=D-A //now a total of 132 has been subtracted from kbd impt
@Right //if kbd - right ascii value = 0 jmp to right funct
D;JEQ
@TimeDelay //leaves this loop, next thing it needs to do is delay time so goes there
0;JMP

(Left) //left funct
@R14 //r14 is used to mark start of the paddle
M=M-1 //subtracts one from r14 so that paddle starts one to the left
D=M //saves loc of start
@31 //adds 31 bc on left this way it is as if on right
D=D+A //adds the 31 to loc
@KBD //last pixel
D=A-D //last pixel-(loc+31)
@NewPaddle //creates new paddle with new start value
D;JNE //if not at left of screen
@R14 //r14 is used to mark start of the paddle
M=M+1 // so if at left of screan adds one to cancel out subtracting 1
@NewPaddle //repeats w same start value
0;JMP

(Right)
@R14 //r14 is used to mark start of the paddle
M=M+1 //adds one frtoom r14 so that paddle starts one to the right
D=M //saves loc of start
@KBD //last pixel
D=A-D //loc of start-last pixel
@NewPaddle//creates new paddle w updated mem if not at last spot
D;JNE //bc d = last pixel-updated spot
@R14 //r14 is start of the paddle
M=M-1  //subtracts one to cancel out adding one if it is at the end
@NewPaddle //creates new paddle with same start addy
0;JMP

(End) //end loop incase i need it
@End
0;JMP

(TimeDelay) //time delay
@MoveBall
0;JMP
(SetCounterTD)
@5000 //starts at 10000 than j subtracts down to 0
D=A
(Tloop)
D=D-1
@CheckKBD //once at 0 goes to kbd check to repeate whole process
D;JEQ
@Tloop //repeats inner loop that j subtracts each time till d = 0
0;JMP

(CreateBall) //creates new ball
@downKey
M=-1
@upDown
M=0
@SCREEN
D=A
@15
D=D+A
@ball
M=D
@6
D=A
@ballCounter 
M=D

(Ball) //creates one row
@2016
D=A
@ball
A=M
M=D

@32
D=A //d=32

@ball
M=M+D

@ballCounter 
M=M-1
D=M
@OutBall
D;JEQ
@Ball
0;JMP

(MoveBall)
@downKey
D=M
@SetCounterTD
D;JEQ

@upDown
D=M
@Up //switch to end to pause
D;JNE

@2016
D=A
@ball
A=M
M=D

@32
D=A //d=32
@ball
M=M+D

@224 //32*7 --> goes back 7 rows, size of ball +1(plus one bc already update addy to b one down), to delete line
D=A
@ball
A=M-D
M=0

@ball
A=M
D=M

@SetCounterTD
D;JEQ

(setUp)
@upDown
M=-1
@224
D=A
@ball
M=M-D
@Up
0;JMP

(Up)
@2016
D=A
@ball
A=M
M=D

@32
D=A //d=32
@ball
M=M-D
@224 //32*7 --> goes back 7 rows, size of ball +1(plus one bc already update addy to b one down), to delete line
D=A
@ball
A=M+D
M=0

@ball
D=M
@SCREEN
D=D-A //how many busses from start (if less than 96 busses)
@96
D=D-A //diff-address if neg then reverse
@setDown
D;JLT

@SetCounterTD
0;JMP

(setDown)
@15
D=A
@SCREEN
A=A+D
M=0
@47
D=A
@SCREEN
A=A+D
M=0
@79
D=A
@SCREEN
A=A+D
M=0
@111
D=A
@SCREEN
A=A+D
M=0
@143
D=A
@SCREEN
A=A+D
M=0
@175
D=A
@SCREEN
A=A+D
M=0
@207
D=A
@SCREEN
A=A+D
M=0
@239
D=A
@SCREEN
A=A+D
M=0
@271
D=A
@SCREEN
A=A+D
M=0

@upDown
M=0
@15
D=A
@SCREEN
D=D+A
@ball
M=D
@SetCounterTD
0;JMP