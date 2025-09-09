.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	myArr word 1234h, 5678h, 9abch, 0def0h
	lenArr = ($-myArr)/2

.code
	main proc
		mov ecx, lenArr				;loop 4 times
		mov eax, offset myArr		;memory address to first byte in myArr
		mov ebx, 0

		L1:
			mov bl, [eax]					;deference address in eax (mem->reg)
			mov bh, [eax+1]				;(mem->reg)
			mov [eax], bh				;(reg->mem)
			mov [eax+1], bl				;(reg->mem)
			add eax, type word
			loop L1

		INVOKE ExitProcess, 0
	main endp
END main