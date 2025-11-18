.386
.model flat, stdcall
.stack 4096

include constants.inc
include protos.inc
include structures.inc

.data
    filename byte "Roster.txt",0
    buffer byte MAX_CHARS_TO_READ DUP(0)
    bytesRead dword ?
    roster Student numStudents dup(<>)

.code
	main proc

		push offset filename
        push offset buffer
        call ReadFromFile

        mov esi, offset roster

		INVOKE ExitProcess, 0
	main endp

	ReadFromFile proc

        push ebp
        mov ebp, esp

        push eax
        push ecx
        push edx

        ;offset of buffer is at ebp+8
        ;offset of filename is at ebp+12
        invoke CreateFile, [ebp+12], GENERIC_READ, DO_NOT_SHARE, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL       ;returns handle to file in EAX
        invoke ReadFile, eax, [ebp+8], MAX_CHARS_TO_READ, offset bytesRead, NULL

        pop edx
        pop ecx
        pop eax

        pop ebp
        ret 8
    ReadFromFile endp
END main