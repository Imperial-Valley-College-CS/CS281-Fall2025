.386
.model flat, stdcall
.stack 4096

WriteConsole EQU <WriteConsoleA>

;MS-Windows Built-in Procedures
ExitProcess proto, dwExitCode:dword
GetStdHandle PROTO,         ; get standard handle
    nStdHandle:DWORD        ; type of console handle
WriteConsole PROTO,                   ; write a buffer to the console
    handle:DWORD,                     ; output handle
    lpBuffer:PTR BYTE,                ; pointer to buffer
    nNumberOfCharsToWrite:DWORD,      ; size of buffer
    lpNumberOfCharsWritten:PTR DWORD, ; number of chars written
    lpReserved:PTR DWORD              ; 0 (not used)

.data
    crlf byte 0dh,0ah

.code
	main proc
		
        mov al, 'A'
        call WriteChar

		INVOKE ExitProcess, 0
	main endp

    WriteChar proc
        .data
        message byte ?
        charsWritten dword ?

        .code
        mov message, al
        invoke GetStdHandle, -11                ;handle returned in EAX
        invoke WriteConsole, EAX, offset message, lengthof message, offset charsWritten, 0
        invoke GetStdHandle, -11                ;handle returned in EAX
        invoke WriteConsole, EAX, offset crlf, lengthof message, offset charsWritten, 0
        ret
    WriteChar endp
END main