.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	rows byte 3
	cols byte 4
	arr word 0f000h, 0f000h, 0f000h, 0f000h,
				  0f000h, 0f000h, 0f000h, 0f000h,
				  0f000h, 0f000h, 0f000h, 0f000h
	count byte 0
	sum dword 0

.code
	main proc

		mov eax, offset arr
		mov ebx, 0
		movzx ecx, rows

		L1:
			mov count, cl		;move low byte only
			movzx ecx, cols		;loop counter for inner loop
			L2:
				loop L2
			loop L1

		
		INVOKE ExitProcess, 0
	main endp
END main