PROG = install
CC = "$$PROGRAMFILES/Autohotkey/Compiler/Ahk2Exe.exe"

${PROG}.exe :: ${PROG}.ahk
	${CC} /in $< 
	mv $@ ../../
