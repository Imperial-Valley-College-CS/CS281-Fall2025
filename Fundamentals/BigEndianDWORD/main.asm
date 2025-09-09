.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode:dword

.data
	myArr dword 12345678h, 0aabbccddh
	lenArr = ($-myArr)/type dword

.code
	main proc
		mov ecx, lenArr
		mov eax, offset myArr
		mov ebx, 0
		mov edx, 0
		 
		L1:
			mov bl, [eax]
			mov bh, [eax+1]
			mov dl, [eax+2]
			mov dh, [eax+3]
			mov [eax], dh
			mov [eax+1], dl
			mov [eax+2], bh
			mov [eax+3], bl
			add eax, type dword
			loop L1

		INVOKE ExitProcess, 0
	main endp
END main