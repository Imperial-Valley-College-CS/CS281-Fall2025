.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	arr byte 3, 4, 8, 16, 20, 32, 40, 64, 86
	lenArr = $-arr
	val dword 32
	ind dword  -1

.code
	main proc

		push offset arr
		push val
		push 0					;low index
		push lenArr-1		;high index
		call binSearch
		mov ind, eax		;return value in eax

		INVOKE ExitProcess, 0
	main endp

	binSearch proc
		push ebp
		mov ebp, esp				;create a base-stack pointer (ebp)

		mov esi, [ebp+20]			;move offset of array into esi
		mov ebx, [ebp+16]		;mov val into ebx
		mov eax, [ebp+12]			;low index
		mov edx, [ebp+8]			;high index

		cmp eax, edx				;compare low to high
		jle findMid
		pop ebp							;val is not in arr
		mov eax, -1
		ret 16

		findMid:
			add eax, edx				;adds low and high
			shr eax, 1					;divide sum by 2 with a shift right

			add esi, eax				;add mid to offset of array
			cmp bl, byte ptr [esi]		;compare mid element to val
			jg upperHalf
			jl lowerHalf
			pop ebp
			ret 16

		upperHalf:
			push [ebp+20]
			push ebx
			push eax+1
			push edx
			call binSearch

		lowerHalf:

		pop ebp
		ret 16
	binSearch endp

END main