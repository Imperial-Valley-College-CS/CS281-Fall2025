.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	pi = 3		;symbolic constant (does not take up any space in memory)
	myAge byte 37
	initials byte "AO",0
	someNum word 1234h		;number in hexadecimal

.code
	main proc
		mov al, pi
		INVOKE ExitProcess, 0
	main endp
END main