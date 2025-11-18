;Constants
GENERIC_WRITE = 40000000h		;write access
GENERIC_READ  = 80000000h		;read access 
DO_NOT_SHARE  = 0						;if 0, file cannot be shared until handle to file is closed
NULL = 0
FILE_ATTRIBUTE_NORMAL	= 80h
OPEN_EXISTING  = 3						;opens file only if it exists

CreateFile EQU <CreateFileA>
 MAX_CHARS_TO_READ = 5000