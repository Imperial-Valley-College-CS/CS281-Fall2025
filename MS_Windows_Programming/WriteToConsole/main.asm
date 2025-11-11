.386
.model flat, stdcall
.stack 4096

include constants.inc
include prototypes.inc

;Macro definitions
mWriteChar macro singleChar
    push eax
    mov eax, 0
    mov al, singleChar
    push eax
    call WriteChar
    pop eax
endm

.data
    crlf byte 0dh,0ah
    phrase byte "Happy Thanksgiving",0

.code
	main proc
		
        mWriteChar 'A'

        ;push offset phrase
        ;push lengthof phrase
        ;call WriteString

        push 20
        call WriteInt

		INVOKE ExitProcess, 0
	main endp

    WriteChar proc
        .data
        charsWritten dword ?

        .code
        push ebp
        mov ebp, esp
        add ebp, 8
        invoke GetStdHandle, STD_OUT_HANDLE                ;handle returned in EAX
        invoke WriteConsole, EAX, EBP, 1, offset charsWritten, 0

        pop ebp
        ret 4
    WriteChar endp

    WriteString proc
        .data
        charsWrittens dword ?

        .code
        push ebp
        mov ebp, esp
        mov ebx, [ebp+8]
        add ebp, 12
        invoke GetStdHandle, STD_OUT_HANDLE                ;handle returned in EAX
        invoke WriteConsole, EAX, EBP, EBX, offset charsWrittens, 0

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