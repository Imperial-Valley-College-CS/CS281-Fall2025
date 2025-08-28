.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

.code
	main proc

		mov bx, 1234h
		movzx eax, bx

		mov dl, -18
		movsx ecx, dl
		
		INVOKE ExitProcess, 0
	main endp
END main