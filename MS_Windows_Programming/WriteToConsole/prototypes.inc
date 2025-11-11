.386
.model flat, stdcall
.stack 4096

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