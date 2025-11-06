include FunctionPrototypes.inc
include structures.inc

.data
	students Student <"Octavio Ortiz", "809844662", 36, 3.65>, <"Olivia Marquez", "809451778", 20, 3.73>,
		<"Stephanie Lopez", "809644511", 17, 3.25>, <"Ivonne Lee", "809477135", 19, 3.66>
	
.code
main proc
	
	invoke isOlder, addr students, lengthof students, 18

	INVOKE ExitProcess,0
main endp

isOlder proc, ptrArrayStus:PTR DWORD, lenArr:DWORD, age:DWORD 
	
	mov ecx, lenArr						;number of elements in array (4)
	mov esi, ptrArrayStus				;points to first student in array
	mov eax, 0								;count number of students older than age

	L1:
		movzx ebx, (Student ptr [esi]).age
		cmp ebx, age
		jg countStudent
	resumeL1:
		add esi, type Student					;add 44 bytes to esi (moves to next student)
		loop L1

	ret

	countStudent:
		inc eax
		jmp resumeL1
	
isOlder endp
end