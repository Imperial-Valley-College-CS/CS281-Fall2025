.386
.model flat, stdcall
.stack 4096

include constants.inc
include prototypes.inc
include macros.inc


.data
    crlf byte 0dh,0ah
    phrase byte "Happy Thanksgivings",0
    charsWritten dword ?

.code
	main proc
		
        mWriteChar 'A'

        push offset phrase
        push lengthof phrase
        call WriteString

        push 20
        call WriteInt

		INVOKE ExitProcess, 0
	main endp

    WriteChar proc

        .code
        push ebp
        mov ebp, esp

        push eax
        push ecx
        push edx

        add ebp, 8
        invoke GetStdHandle, STD_OUT_HANDLE                ;handle returned in EAX
        invoke WriteConsole, eax, ebp, 1, offset charsWritten, 0

        pop edx
        pop ecx
        pop eax
        pop ebp
        ret 4
    WriteChar endp

    WriteString proc

        .code
        push ebp
        mov ebp, esp

        push ecx
        mov ecx, [ebp+8]            ;length of string
        add ebp, 12
        invoke GetStdHandle, STD_OUT_HANDLE                ;handle returned in EAX
        invoke WriteConsole, eax, [ebp], ecx, offset charsWritten, 0

        pop ecx
        pop ebp
        ret 8
    WriteString endp

    WriteInt proc
        .data
        intAsString byte 20 DUP(0)

        .code
            push ebp
            mov ebp, esp
            mov eax, [ebp+8]            ;integer to write to console (single byte)
            push eax
            push offset intAsString
            call convertIntToString

            push offset intAsString
            push lengthof intAsString
            call WriteString

            pop ebp
        ret 4
    WriteInt endp

    convertIntToString proc
        push ebp
        mov ebp, esp

        mov esi, [ebp+8]
        mov byte ptr [esi], 'a'
        mov byte ptr [esi+1], 'b'
        mov byte ptr [esi+2], 'c'

        pop ebp
        ret 8
    convertIntToString endp
END main