.386
.model flat, stdcall
.stack 4096

;Constants
GENERIC_WRITE = 40000000h		;write access
GENERIC_READ  = 80000000h		;read access 
DO_NOT_SHARE  = 0						;if 0, file cannot be shared until handle to file is closed
NULL = 0
FILE_ATTRIBUTE_NORMAL	= 80h
OPEN_EXISTING  = 3						;opens file only if it exists

CreateFile EQU <CreateFileA>
 MAX_CHARS_TO_READ = 5000

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

.data
    filename byte "Roster.txt",0
    buffer byte MAX_CHARS_TO_READ DUP(0)
    bytesRead dword ?

.code
	main proc
		
        invoke CreateFile, offset filename, GENERIC_READ, DO_NOT_SHARE, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL       ;returns handle to file in EAX
        invoke ReadFile, eax, offset buffer, MAX_CHARS_TO_READ, offset bytesRead, NULL

		INVOKE ExitProcess, 0
	main endp
END main