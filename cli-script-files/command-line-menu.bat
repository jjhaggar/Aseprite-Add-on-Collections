:: 
:: INSTRUCTIONS
:: Drag and drop your .ASE file over this .BAT file to execute any task using a Dos menu.
:: 

@ECHO OFF

IF "%~x1"==".ase" (
	GOTO begin
) ELSE (
	ECHO.
	ECHO. YOU NEED TO DRAG AND DROP AN .ASE FILE FOR THIS SCRIPT TO WORK! :D
	ECHO.
	PAUSE
	EXIT
)

:begin
CLS
ECHO.
ECHO. You have dragged and dropped "%~nx1" into this script. 
ECHO. 
ECHO. Availiable tasks:
ECHO. ======================================================
ECHO. 1) Save all visible layer in as numbered png sequence.
ECHO. 2) Option 2
ECHO. 3) Option 3
ECHO. 4) Option 4
ECHO. 0) Exit.
ECHO. ======================================================
SET /p op="-Please type a number and press intro: "
IF "%op%"=="1" GOTO op1
IF "%op%"=="2" GOTO op2
IF "%op%"=="3" GOTO op3
IF "%op%"=="4" GOTO op4
IF "%op%"=="0" GOTO exit

ECHO Please Pick an option: 
GOTO begin

:op1
ECHO. 
ECHO. Creating png sequence(s)...
aseprite -b "%~1" --save-as {layer}_{frame01}.png
ECHO. 
ECHO. DONE! :D
ECHO.
ECHO. Please press any key to choose another option...
set op=99
PAUSE>NUL
GOTO begin

:op2
ECHO you picked option 2
GOTO begin

:op3
ECHO you picked option 3
GOTO begin

:op4
ECHO you picked option 4
GOTO begin

:exit
EXIT