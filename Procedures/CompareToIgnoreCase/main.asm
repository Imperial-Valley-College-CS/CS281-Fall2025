.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	str1 byte "HulK",0
	str2 byte "hawkeye",0
	ans dword 0

.code
	main proc

		pushad
		mov esi, offset str1
		mov edi, offset str2
		call compareToIgnoreCase
		mov ans, eax
		popad

		INVOKE ExitProcess, 0
	main endp

	compareToIgnoreCase proc
		
		mov edx, esi				;get length of first string
		call strLength
		mov ebx, eax

		mov edx, edi				;get length of second string
		call strLength


		
		ret
	compareToIgnoreCase endp

	;Summary: Traverses a string until null is reached. returns length of string
	;Receives: offset str (edx)
	;Returns: length of str (eax)
	strLength proc
		push edx
		push ebx
		mov eax, 0			;length counter
		L1:
			mov bl, [edx]	;move byte to register
			cmp bl, 0
			je done				;jump if byte is zero
			inc edx				;move on to next byte in memory
			inc eax	
			jmp L1

		done:
			pop ebx
			pop edx
			ret
	strLength endp

END main