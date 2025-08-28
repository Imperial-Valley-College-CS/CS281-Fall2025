.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	str1 byte "hulk",0
	lenStr1 = $-str1				;can use lengthof str1
	str2 byte "smash",0	
	lenStr2 = $-str2				;can use lengthof str2
	lenStr3 = lenStr1+lenStr2-1
	str3 byte lenStr3 DUP(0)

.code
	main proc

		mov eax, offset str1
		mov ebx, offset str3
		mov ecx, lenStr1-1

		L1:
			mov dl, [eax]			;dereference address to str1
			mov [ebx], dl		;move character back into memory
			inc eax
			inc ebx
			loop L1

		mov eax, offset str2
		mov ecx, lenStr2

		L2:
			mov dl, [eax]			;dereference address to str2
			mov [ebx], dl		;move character back into memory
			inc eax
			inc ebx
			loop L2
		
		INVOKE ExitProcess, 0
	main endp
END main