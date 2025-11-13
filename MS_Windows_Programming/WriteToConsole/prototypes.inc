;MS-Windows Built-in Procedures
CreateFile PROTO,           ; create new file
    pFilename:PTR BYTE,     ; ptr to filename
    accessMode:DWORD,       ; access mode
    shareMode:DWORD,        ; share mode
    lpSecurity:DWORD,       ; can be NULL
    howToCreate:DWORD,      ; how to create the file
    attributes:DWORD,       ; file attributes
    htemplate:DWORD         ; handle to template file
ExitProcess proto, dwExitCode:dword
GetStdHandle PROTO,         ; get standard handle
    nStdHandle:DWORD        ; type of console handle
WriteConsole PROTO,                   ; write a buffer to the console
    handle:DWORD,                     ; output handle
    lpBuffer:PTR BYTE,                ; pointer to buffer
    nNumberOfCharsToWrite:DWORD,      ; size of buffer
    lpNumberOfCharsWritten:PTR DWORD, ; number of chars written
    lpReserved:PTR DWORD              ; 0 (not used)