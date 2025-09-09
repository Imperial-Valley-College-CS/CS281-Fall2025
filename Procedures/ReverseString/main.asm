.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	breakfast byte "burrito",0
	lenStr = $-breakfast
	newStr byte lenStr DUP(0)

.code
	main proc
		mov esi, offset breakfast
		mov edi, offset newStr
		mov ecx, lenStr
		call reverse		
		INVOKE ExitProcess, 0
	main endp

	;Summary: Reverses a string
	;Receives: ESI - offset of string1, EDI - offset string2, ECX - length of string
	;Returns: nothing
	reverse proc
		add esi, ecx
		sub esi, 2
		dec ecx		;loop one less time than null-termination
		L1:
			mov dl, [esi]
			mov [edi], dl
			inc edi
			dec esi
		loop L1
		ret
	reverse endp
END main