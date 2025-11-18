;Windows Function Prototypes
CreateFile PROTO,           ; create new file
    pFilename:PTR BYTE,     ; ptr to filename
    accessMode:DWORD,       ; access mode   (GENERIC_READ - 80000000h)
    shareMode:DWORD,        ; share mode    (for share_read - 1)
    lpSecurity:DWORD,       ; can be NULL
    howToCreate:DWORD,      ; how to create the file (Create New if it doesn't exist - 1)
    attributes:DWORD,       ; file attributes (normal - 128)
    htemplate:DWORD         ; handle to template file (random access - 10000000h)

ExitProcess proto, dwExitCode:dword

ReadFile PROTO,           ; read buffer from input file
    fileHandle:DWORD,     ; handle to file
    pBuffer:PTR BYTE,     ; ptr to buffer
    nBufsize:DWORD,       ; number bytes to read
    pBytesRead:PTR DWORD, ; bytes actually read
    pOverlapped:PTR DWORD ; ptr to asynchronous info