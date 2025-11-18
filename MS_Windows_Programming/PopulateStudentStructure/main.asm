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

        push offset roster
        push offset buffer
        call PopulateStudentString          ;populates name of student in Roster

        inc edi                                         ;edi past comma to move to gender
        add esi, size Student.stuName   ;points to gender data field in roster (adds 20 bytes)
        push esi
        push edi
        call PopulateStudentString          ;populates gender of student in Roster

		INVOKE ExitProcess, 0
	main endp

    PopulateStudentString proc
        
        push ebp
        mov ebp, esp
        mov esi, [ebp+12]           ;offset that points to roster
        mov edi, [ebp+8]            ;offset that points to buffer
        push esi                    

        L1:
            cmp byte ptr [edi], 2ch     ;compare to comma
            je doneTraversing 
            cmp byte ptr [edi], 0dh     ;compare to carriage return (reached end of line)
            je doneTraversing
            cmp byte ptr [edi], 0         ;compare to null (end of file)
            je doneTraversing
            mov al, [edi]                       ;copies byte from buffer to register
            mov [esi], al                       ;copies byte from register to roster
            inc esi
            inc edi
            jmp L1

        doneTraversing:
            pop esi
            pop ebp
        ret 8
    PopulateStudentString endp

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