.386
.model flat, stdcall
.stack 4096

;constants
ReadConsole EQU <ReadConsoleA>
STD_INPUT_HANDLE = -10

;prototypes
ExitProcess proto, dwExitCode:dword
GetStdHandle PROTO,         ; get standard handle
    nStdHandle:DWORD        ; type of console handle
ReadConsole PROTO,
    handle:DWORD,                     ; input handle
    lpBuffer:PTR BYTE,                ; pointer to buffer
    nNumberOfCharsToRead:DWORD,       ; number of chars to read
    lpNumberOfCharsRead:PTR DWORD,    ; number of chars read
    lpReserved:PTR DWORD              ; 0 (not used - reserved)

.data
	charsRead dword ?
	selection dword ?

.code
	main proc
		
		call ReadDec
		mov selection, eax
		
		INVOKE ExitProcess, 0
	main endp

	ReadDec proc
		.data
		buffer byte 12 DUP(0)

		.code
		
		;invoke more than 1 windows function to read data from console
		invoke GetStdHandle, STD_INPUT_HANDLE				;returns handle to standard IN in EAX
		invoke ReadConsole, EAX, addr buffer, lengthof buffer, addr charsRead, 0

		movzx eax, buffer

		ret
	ReadDec endp
END main