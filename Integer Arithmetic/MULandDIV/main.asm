.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

.code
	main proc
		mov edx, 40h
		mov eax, 2020h
		mov ebx, 100h

		div bx

		mov eax, 0ffffh
		mov ebx, 0ffffh
		mul bx
		
		INVOKE ExitProcess, 0
	main endp
END main