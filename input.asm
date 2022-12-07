section .bss
    buf resb 1
  
section	.text
	global _start       ;must be declared for using gcc
	
_start:                     ;tell linker entry point
	mov	edx, len    ;message length
	mov	ecx, msg    ;message to write
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int 0x80
	mov edx, 2      ; max length
    mov ecx, buf    ; buffer
    mov ebx, 0      ; stdin
    mov eax, 3      ; sys_read
	int	0x80        ;call kernel
	mov	edx, len_out    ;message length
	mov	ecx, msg_out    ;message to write
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int 0x80		
	mov	edx, 2    ;message length
	mov	ecx, buf    ;message to write
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int 0x80		
	mov	eax, 1	    ;system call number (sys_exit)
	int	0x80        ;call kernel

section	.data

msg	db	'Enter a Number!',0xa	;our dear string
len	equ	$ - msg			;length of our dear string
msg_out db 'Your number is: ', 0xa
len_out equ $ - msg_out