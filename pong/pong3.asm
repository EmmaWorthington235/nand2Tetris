//BROKE START
//WORKING LEFT RIGHT
//time errors and ball problmes
//extra time problem
//Ball freezes
(Start) //start of program
@KBD //gets value of one past last pixel
D=A //sets d = to one more than last pixel
@16 //goes to 16 and subtracts 16 from d
D=D-A //now d is around the bottom of the middle
@R14 //saves value in r14 - r14 is used as start of paddle
M=D //when reffering to the start of the paddle i mean the bottom right
@rl //rl tracks if moving right or left
M=0 //makes sure set to 0 (meaning neither) at the start of the program
@downKey //checks if down key is pressed 
M=0 //0 means down key hasnt been pressed yet

////////////////////////////////////////////////////////////////////////////////////////////////////////////
(NewPaddle) 
//makes a new paddle each time with white on either side as a built in erase
//calls left and right smother paddle movement in this function then it returns to where it was called
// calls move ball after the function

//go to left or right smoother movment
@rl //rl stores if right or left is being pressed
D=M //gets val from rl
@SpmRight //goes to spm(Smother Paddle Movement) right if 
D;JGT //D is greater than 0
@SpmLeft 
D;JLT //goes to left if less than 0
@rl //sets rl back to zero so that next time doesnt go into either right or left in future unless right or left key has been pressed again
M=0

(OutSpm) //after smoother paddle movment is complete

//setting variables to create paddle
@R14 //r14 is where start of paddle is stored (bottom right addy)
D=M //d=start of where paddle needs to go
@R15 //r15 is temp variable so that r14 isnt edited but it changes lines
M=D //initially sets r15 to r14
@3 //3 to count three lines
D=A
@counter //sets counter = to 3
M=D

(CreatePaddle) 
//creates one row
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
//decreases line
@32 //512 bits per line/16 bits per line= 32 busses per line    //change to 29 to check number of lines
D=A //saves 32
@R15 //bc 32 busses per line to get to new line subrtact 32
M=M-D //temp address-32 = new line *the temp address(R15) is not edited when setting the three diff busses
@counter //counter created when starting new paddle
M=M-1 //subtracts one from counter
D=M //sets d= new val of counter
@MoveBall //if has finished creating paddle jumps to move ball
D;JEQ //if d (the counter = 0) starts at three so if has created all three lines-

@CreatePaddle //if counter != 0 repeats to create next 3 part horizontal line of paddle
0;JMP //forces jump
////////////////////////////////////////////////////////////////////////////////////////////////////////////

//KeyBoard Check Function//////////////////////////////////////////////////////////////////////////////////////////////////////////
(CheckKBD)
@downKey //doesnt bother to check if down key is being pressed after first time through
D=M //down key starts at 0 and is switched to a diffrent number after the ball is created 
@OutBall //skips to prevent multiple balls being created in the same game
D;JNE

//checks if down key is being pressed and if it is goes to create ball
@KBD //these 6 lines used to check if down key is being pressed after goes to out ball
D=M //gets value of keyboard stored in m sets d=value of kbd
@133 //ascii val for down key
D=D-A
@CreateBall //creats ball for the first time if d = 0 (d = 0 if kbd ascii val =133)
D;JEQ

(OutBall) //leaves ball function to here
@KBD //gets value of keyboard stored in m
D=M //sets d=value of kbd

//check if left being pressed
@130 //130 is ascii value for left arrow
D=D-A //so if kbd-130 = 0 then left arrow is being pressed
@Left
D;JEQ //jmps to left function if =0

//checks if right being pressed
@2 //goes to 2 bc right key has an ascii value of 132
D=D-A //now a total of 132 has been subtracted from kbd impt
@Right //if kbd - right ascii value = 0 jmp to right funct
D;JEQ

//extra time delay
@TimeDelayExtra // time delay to acount for if not moving left or right
0;JMP // is more to acount for the fact that the other one is called multiple times 
(OutTimeDelayEx) //where the time delay exits too
@ex2 //Time Delay Ex is used at other points in the program ex2 is used to track where it is being called from
D=M //here it is getting the value of ex2 to see if it needs to redirect to other place where it is called
@OutEx2
D;JNE

@MoveBall //moves ball next
0;JMP
////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////
(Left) //left funct
//sets up variables
@rl //sets rl = to -1 so that knows which smoother paddle movemnet function to jump to in create paddle
M=-1
@R14 //r14 is used to mark start of the paddle
M=M-1 //subtracts one from r14 so that paddle starts one to the left

//check if hitting side of screen
D=M //saves loc of start
@31 //adds 31 bc on left this way it is as if on right
D=D+A //adds the 31 to loc
@KBD //one past last pixel
D=A-D //one past last pixel-(loc+31)
@NewPaddle //creates new paddle with new start value if not at the edge ot the screen
D;JNE //D is = too : one past the last pixel - (new paddle spot + 31)

//extra time delay
@R14 //r14 is used to mark start of the paddle
M=M+1 // so if at left of screan adds one to cancel out subtracting 1
@ex2 //Time delay extra called two diff times ex2 checks which it needs to be sent to
M=-1 //if ex2 = -1 then returns to here
@TimeDelayExtra
0;JMP //jumps to time delay no mater what
(OutEx2) //out time delay
@ex2
M=0 //sets ex2 back to 0
@OutSpm //goes to out spm (creates new paddle but skip possibilty of smoother paddle movement so that doesnt create problems when at edge)
0;JMP
////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////
(Right)
//sets up variables 
@rl
M=1
@R14 //r14 is used to mark start of the paddle
M=M+1 //adds one frtoom r14 so that paddle starts one to the right

//checks if hitting edge if not makes new paddle and moves
D=M //saves loc of start
@KBD //last pixel
D=A-D//loc of start-last pixel
@NewPaddle//creates new paddle w updated mem if not at last spot
D;JNE //ment to be JNE//bc d = last pixel-updated spot //JGE JLE

//if at last spot fix start of padd;e
@R14 //r14 is start of the paddle
M=M-1  //subtracts one to cancel out adding one if it is at the end
@OutSpm//NewPaddle //creates new paddle with same start addy
0;JMP
////////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////////////
(TimeDelaySPM) //time delay called in right smoother movment
@1000 //starts at 1000 than j subtracts down to 0
D=A
(TloopSPM) //d=1000 at start
D=D-1 //subtracts 1 from d
@OutTimeDelaySPM //breaks loop and exits to where it was called
D;JEQ
@TloopSPM //repeats inner loop that j subtracts each time till d = 0
0;JMP

(TimeDelaySPM3) //exact same as (TimeDelaySPM) above except used in the left function
@1000
D=A
(TloopSPM3)
D=D-1
@OutTimeDelaySPM3
D;JEQ
@TloopSPM3
0;JMP

(TimeDelayExtra) //time delay
@16000 //starts at 16000 than j subtracts down to 0
D=A
(TloopEx)
D=D-1 //subtracts one from the counter
@OutTimeDelayEx //exits to where it was called
D;JEQ
@TloopEx //repeats inner loop that j subtracts each time till d = 0
0;JMP
////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////
(SpmRight) //smoother paddle movment right
//sets variables
@15
D=A
@spmCount //spm count starts at 15
M=D //this variable is used to c if should leave loop or not based on how many times through
@spmCounter2 //starts at one and counts up by one each loop
M=1 //spmCounter2 is what is passed into our expontial function, to move right starts at 2^n-1 pixels on the right and counts up which is why the counter pased in starts at 1

(SpmInLp) //Internal loop
@R14 //paddel start
D=M
@pTemp //paddle start saved in this variable
M=D

//gets 2^n-1
@GetBin2 //calls loop to get 2^n-1 and return it here
0;JMP
(OutBin2) //could just have put (GetBin2) here but moved it for clarity

//sets right right smoother movment
@bin2 //bin 2 stores 2^n-1 (already set throught GetBin2)
D=M
@pTemp
A=M
M=D //first bus (the right one) M=2^n-1
//sets middle busses black and left bus to number of bits
@bin2
D=0
D=D-M //sets D = to -(2^n-1)
@pTemp //at temp address
A=M-1
M=-1 //sets first middle bus to all black
A=A-1
M=-1 //sets second middle bus to all black
A=A-1
M=D-1 // sets memory of left bus = to -2^n (because d is currently equal to -(2^n-1) its actually = to -2^n+1 so subtracting one and setting it equal to d sets it equal to -2^n)

//switches which line of the paddle
@32 //subtracts 32 from pTemp(tempoary start)
D=A
@pTemp //move up to next row of paddle
M=M-D

//repeats process of setting right and left to specific bits but now on a new line
@bin2 //same as previous but for a diff row
D=M
@pTemp
A=M
M=D
@bin2
D=0
D=D-M
@pTemp
A=M-1
M=-1
A=A-1
M=-1
A=A-1
M=D-1

//switches which line of the paddle
@32 //moves up a line again same way
D=A
@pTemp
M=M-D

//repeats process of setting right and left to specific bits but now on a new line
@bin2 //same as previous but in a new row
D=M
@pTemp
A=M
M=D
@bin2
D=0
D=D-M
@pTemp
A=M-1
M=-1
A=A-1
M=-1
A=A-1
M=D-1

//time delay
@TimeDelaySPM  //calls time delay (could be here but moved for clarity)
0;JMP
(OutTimeDelaySPM)

//checks if needs to exit loop and incriments counters
@spmCounter2 //adds 1 to spmcounter2 (the one used for 2^n loop)
M=M+1
@spmCount //subtracts one from counter that tracks if needs to exit inter loop
M=M-1
D=M
@SpmInLp
D;JNE //repeats loop if loop counter hasnt gone down to 0

@OutSpm//goes back to create paddle
0;JMP //fources jump

(SpmLeft) //vitrual identical to spm right////////////////////////////////////////////////////////////
//same thing except the number sent into 2^n function starts at 15 and counts down

//set variables
@15
D=A
@spmCounter3 //counter starts at 15 and counts down (counter goes into 2^n function and to see if need to break loop)
M=D

//the inner loop (each loop is adding one bit on one side and subtracting one on the pther)
(SpmInLp3)
//set variables
@R14 //paddel start
D=M
@pTemp3 //paddle temp start (increased by 32 each time for new rows)
M=D+1

//get 2 to the n
@GetBin3 //calls getBin gets 2^n-1
0;JMP
(OutBin3) //and returns to same spot

//set right side = 2^n-1
@bin3
D=M
@pTemp3 //sets right side = to 2^n-1
A=M
M=D
@bin3
D=0
D=D-M //D = -(2^n-1) D = -2^n + 1
@pTemp3
A=M-1
M=-1 //sets first middle bus black
A=A-1
M=-1  //sets second middle bus black
A=A-1
M=D-1 // sets left of left = to -2^n (-2^n +1 -1 = -2^n)

//next row of paddle
@32 //increases pTemp3 by 32 (to move up a line and do the next line of paddle)
D=A
@pTemp3
M=M-D

//repeat setting bits on either side
@bin3 //same as previous for a new line
D=M
@pTemp3
A=M
M=D
@bin3
D=0
D=D-M
@pTemp3
A=M-1
M=-1
A=A-1
M=-1
A=A-1
M=D-1

//moves to new row of paddle
@32 // moves up to the final line
D=A
@pTemp3
M=M-D

//repeat setting bits on either side
@bin3 //same as previous
D=M
@pTemp3
A=M
M=D
@bin3
D=0
D=D-M
@pTemp3
A=M-1
M=-1
A=A-1
M=-1
A=A-1
M=D-1

//goes to time delay and come back to same spot
@TimeDelaySPM3 //goes to individual time delay and returns here
0;JMP
(OutTimeDelaySPM3) //time delay moved so that code is more readable but could also just be here

//incs counters and breaks loop if counter at 0
@spmCounter3 //decreases counter by 1
M=M-1
D=M
@SpmInLp3 //repeats loop as long as counter isnt at 0
D;JNE

@OutSpm//goes back to create paddle function
0;JMP
////////////////////////////////////////////////////////////////////////////////////////////////////////////

(GetBin2) //gets 2^n-1
//set counter
@spmCounter2 //counter from outer function (spmCounter2=n)
D=M
D=D-1 //gets counter and subtracts 1

//if n = 1 2^n-1 = 1
@bin2 //sets 2^n-1 function = 1 
M=1
@OutBin2 //if n = 1 return 1
D;JEQ

//if n = 2 2^n-1 = 3
@bin2 //same as what just happend but if counter = 2 return 3
M=M+1 //easier to return the first two spots the way i wrote my code
M=M+1
D=D-1
@OutBin2
D;JEQ

//sets counters and variables
@bin2
M=M-1 //sets bin2 mem to 2 (starts at 2)
@spmCounter2 
D=M
@binCounter2 //creats a temp counter from n
M=D

(Times2Loop2) //inner loop (adds variable to itself n times)
//adds variable to itself
@bin2
D=M //D = memory of variable
M=M+D //so M + D is basically M*2

//decrease counter
@binCounter2 //subtracts one from counter (counter starts with n in it and subtracts down to 0)
M=M-1
D=M

//breaks loop if at 0
@Times2Loop2 //as long as the temp variable which starts at n and decrease by one each loop != 0 then reapeate loop
D;JNE //if does = 0 j leaves loop

//subtracts 1 from variable
@bin2 
M=M-1 //sends back 2^n-1 (m is 2^n so subtracts 1)

//leaves this function
@OutBin2 //goes back to bit by bit loop
0;JMP
////////////////////////////////////////////////////////////////////////////////////////////////////////////

(GetBin3) //same as getBin2 but for the left
//sets variables
@spmCounter3 //gets outter loop counter
D=M
D=D-1

//returns 1 if n = 1
@bin3
M=1
@OutBin3
D;JEQ

// returns 3 if n = 2
@bin3
M=M+1
M=M+1
D=D-1
@OutBin3
D;JEQ

//sets up variables
@bin3 //sets bin 3 = to 2
M=M-1
@spmCounter3 
D=M
@binCounter3 //temp counter
M=D

(Times2Loop3) //inner loop
//adds variable to itself
@bin3
D=M
M=M+D //memory of bin3 (the variable that stores 2^n eventually) = M*2

//changes counter
@binCounter3 //subtracts one from counter
M=M-1
D=M

//checks if needs to break loop
@Times2Loop3 //repeats loop if counter isnt at 0
D;JNE

//subtracts one from 2^n
@bin3
M=M-1 //subtracts one so that returns 2^n-1

//leaves function
@OutBin3 //returns to bit by bit function
0;JMP

//EVERYTHING BELLOW IS THE BALL
////////////////////////////////////////////////////////////////////////////////////////////////////////////
(CreateBall) //creates new ball
//sets variables
@downKey
M=-1 //so that ball is only created once changes variable to negative 1 to track
@upDown
M=0 //sets to down to start

//finds where ball is going to start
@SCREEN
D=A
@15
D=D+A
@topBall //stores top row of ball
M=D
@ball
M=D //start of ball counter is the start bus +15

//sets up a counter to count to make the six lines of ball
@5 //ball counter = 6 (so that ball is 6 pixels tall)
D=A
@ballCounter 
M=D

(Ball) //creates one row
//sets bus = 2016
@2016 //a bus that = 2016 makes middle 6 pixels black
D=A
@ball //sets current bus = to 2016
A=M
M=D

//changes line
@32 //moves down a line to create next row
D=A
@ball
M=M+D

//changes counter and breaks loop if at 0 (created all 6 lines)
@ballCounter 
M=M-1 //subtracts 1 from counter (counter starts at 6 creats 6 row tall ball)
D=M 
@OutBall
D;JEQ //leaves function if gets down to 0 and goes back to middle of kbd check where it called this function
@Ball
0;JMP //else repeats inner loop

(MoveBall) //move ball function - draws new bottom of ball and erases old top
//breaks if down key wasnt pressed yet
@downKey
D=M
@CheckKBD //deosnt move if the down key hasnt been pressed yet
D;JEQ

//sets new row to 2016 (middle 6 black)
@2016 //middle 6 pixels
D=A
@ball //sets current row = to 2016
//M=M+D
A=M
M=D
@topBall
A=M
M=D

@32
D=A
@ball
A=M+D
M=0
@topBall
A=M-D
M=0

@upDown
D=M
@GoUp
D;JNE
//creates new start for the ball
(GoDown)
@32 // is 64 bc is 32 but will automaticaly go into next method so neccisary to cancel
D=A //d=32
@ball
M=M+D //updates address to b one bellow
@topBall
M=M+D //updates address to b one bellow
@After
0;JMP

(GoUp)
@32
D=A //d=32
@ball
M=M-D //updates address to b one bellow
@topBall
M=M-D //updates address to b one bellow

(After)
//updates ball address
//checks if lost game
@KBD
D=A
@ball
D=D-M //D is the diffrence of the end of the screen and the current address
@128
D=D-A //if d < 0 then in the bottom 3 rows of the screen and it didnt hit the paddle so go to end
@NotEnd
D;JGT

@ball
A=M
D=M

@End
D;JNE

@SetUp
0;JMP
(NotEnd)

@CheckKBD
0;JMP //goes to keyboard if isnt at bottom of board or hit the paddle

(SetUp)
//sets up varaibles and switches ball address to the top of the ball
@upDown 
M=-1 //sets up down to -1 (so that in future goes to up loop)
//@224
//D=A
@32
D=A
@ball
M=M-D
@topBall
M=M-D

@NotEnd
0;JMP //switches addres to top now instead of bottom
////////////////////////////////////////////////////////////////////////////////////////////////////////////






//inf loop when lost
(End)
//program freezes when ball gets to top of paddle to avoid paddle complications so ball has to move to bottom here to compinsate

//so that pauses between swithcing lines
@16000
D=A
(FinalLoop)
D=D-1
@FinalLoop
D;JNE

// too draw in second to last line of ball
@KBD 
D=A
@81
D=D-A //gets second to last line of the ball in the final positon
@lastline
M=D
@2016
D=A
@lastline
A=M
M=D //sets = to 2016 (makes middle 6 pixels black)

//deletes top of ball
@192
D=A
@lastline
A=M-D //192 goes up 6 rows
M=0

//so that pauses between swithcing lines
@16000
D=A
(FinalLoop2)
D=D-1
@FinalLoop2
D;JNE

// draws in final bottom of ball
@KBD 
D=A
@49
D=D-A //gets the bottom line of the ball in the last postion
@lastline
M=D
@2016
D=A
@lastline
A=M
M=D //sets middle 6 pixels black using 2016

// erases second to last top of ball
@192
D=A
@lastline
A=M-D //192 goes up 6 rows
M=0

//final inf loop
(EndLoop)
@EndLoop
0;JMP