# Simple-racetrack-with-Pygmy-Forth

To have a satisfactory movement with good precision and as few jolts as possible, it is necessary to modify the python primitives that correspond to the movements and rotations. We will set the frequency to 0.01 seconds.

It is also necessary to modify some PygmyForth primitives.

Two new python primitives are installed: MotorAvGl.fth, for forward movement of the left motor, and MotorAvDw.fth, for forward movement of the right motor.

Example of modifications to python primitives.

( primitives Pygmy Forth racetrack )

: turnd 5 FOR FORWARDLEFT NEXT ; (we count 5 loops)


: turng 5 FOR FORWARDRIGHT NEXT ; ( there are 5 loops )


: LEFT 0 ;  : RIGHT 1 ;

: TURN ( n-- ) IF TURNRIGHT ELSE TURNLEFT THEN ; ( use RIGHT TURN LEFT TURN )

: 1= 1 = ;   : BOTH-OFF? AND 0= ;

: GOSTRAIGHT FORWARDLEFT FORWARDRIGHT ; ( this primitive which gives a regular straight line movement )

( application RoundTrip simple )

: RUN BEGIN LEFTSENSOR RIGHTSENSOR BOTH-OFF? IF GOSTRAIGHT THEN LEFTSENSOR TURN RIGHTSENSOR  TURN AGAIN ; ( the line code )

: Z RUN ; ( shortcut )
