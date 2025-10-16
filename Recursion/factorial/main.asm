.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data

.code
	main proc
		push 6
		call factorial
		INVOKE ExitProcess, 0
	main endp

	factorial proc
		push ebp
		mov ebp, esp			;create base stack pointer
		mov ecx, [ebp+8]		;move argument into register for comparison
		cmp ecx, 1
		jne invokeFactorial
		mov eax, 1
		pop ebp
		ret 4

		invokeFactorial:
			mov edx, [ebp+8]			;grab argument
			dec edx						;decrement by 1 for recursive call
			push edx
			call factorial					;factorial of number returned in eax
			mul word ptr [ebp+8]	;product of argument and return value in eax
			pop ebp
			ret 4
	factorial endp
END main