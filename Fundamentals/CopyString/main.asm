.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	hero byte "hulk",0
	len = $-hero
	cpHero byte len DUP(0)

.code
	main proc
		mov ecx, len
		mov eax, offset hero
		mov ebx, offset cphero
		mov edx, 0

		L1:
			mov dl, [eax]				;move from memory to register
			mov [eax], dh
			mov [ebx], dl			;move from register back to memory
			inc eax						;increment address of hero
			inc ebx						;increment address of cphero
			loop L1
		
		INVOKE ExitProcess, 0
	main endp
END main