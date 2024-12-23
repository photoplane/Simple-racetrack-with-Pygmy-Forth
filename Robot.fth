."  HIPPODROME"  CR
 
: HI ." Bonjour tout le monde" ;

: robot CR ."           _  " CR ."        __|_|__   " CR ."       |  o o  |  " CR
."      [|   !   |]  " CR    ."     __|  <=>  |__  " CR  ."    |  ^^^^^^^^   | " CR  ."    |  | robot |  |  " CR
."    |  |_______|  |    " CR ."    |__|       |__|    " CR
; 
 
robot CR
HI  CR

( my own return stack - ma propre pile de retour R )
VARIABLE R   
: >R  R ! ;
: R> R @ ;

( timer env. 1 sec )
: MS ( n -- n sec ) 34333 * FOR I DROP NEXT ;
: X 100 FOR DROP NEXT ;


CODE PAGE
    print('\033c')
END-CODE

( primitives Python )
" MotorAV.fth" LOAD
" motor_stop.fth" LOAD 
" forward_left.fth" LOAD
" forward_right.fth" LOAD
" sensor_right.fth" LOAD
" sensor_left.fth" LOAD


( primitives Pygmy Forth )
: TURNRIGHT  5 FOR FORWARDLEFT NEXT ;  ( turn RIGHT )
: TURNLEFT  5 FOR FORWARDRIGHT NEXT ;  ( turn LEFT )
: LEFT 0 ;
: RIGHT 1 ;
: TURN ( n-- ) IF TURNRIGHT ELSE TURNLEFT THEN ; ( use RIGHT TURN LEFT TURN )
: 1= 1 = ;   : BOTH-OFF? AND 0= ;
: GOSTRAIGHT FORWARDLEFT FORWARDRIGHT ;

( application )
( RoundTrip simple )
: RUN BEGIN LEFTSENSOR RIGHTSENSOR BOTH-OFF? IF GOSTRAIGHT THEN
LEFTSENSOR TURN RIGHTSENSOR  TURN AGAIN ; 
: Z RUN ;

( controle )
: t LEFTSENSOR  ." LEFTSENSOR" . CR RIGHTSENSOR ." RIGHTSENSOR" . CR ;
: ss SURFACESENSOR . ;

WORDS CR 
