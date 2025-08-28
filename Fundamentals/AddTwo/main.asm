.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	myAge byte 37

.code
	main proc
		mov al, myAge
		INVOKE ExitProcess, 0
	main endp
END main