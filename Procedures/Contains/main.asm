.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	str1 byte "pajamas",0
	str2 byte "jam",0
	flag byte 0

.code
	main proc
		mov eax, offset str1
		mov ebx, offset str2
		call contains
		mov flag, cl
		
		INVOKE ExitProcess, 0
	main endp

	cotains proc
		ret
	contains endp
END main