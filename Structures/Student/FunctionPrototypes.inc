.386
.model flat, stdcall
.stack 4096

;MS-Windows Function Prototypes
ExitProcess proto, dwExitCode:DWORD

;User-defined Function Prototypes
isOlder proto, ptrArrayStus:PTR DWORD, lenArr:DWORD, age:DWORD