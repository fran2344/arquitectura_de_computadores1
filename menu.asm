section	.text
	global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
	mov	edx, len    ;message length
	mov	ecx, msg    ;message to write
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int	0x80        ;call kernel
	mov edx, 2
	mov ecx, buf
	mov eax, 3
	mov ebx, 0
	int 0x80
	cmp byte [buf], "1"
	je mostrarhi
	cmp byte [buf], "2"
	je mostrarbye
	mov	eax, 1	    ;system call number (sys_exit)
	int	0x80        ;call kernel


mostrarhi:
    mov edx, len_out
    mov ecx, msg_out
    mov eax, 4
    mov ebx, 1
    int 0x80
    jmp _start
    
mostrarbye:
    mov edx, len_bye
    mov ecx, msg_bye
    mov eax, 4
    mov ebx, 1
    int 0x80
    jmp _start    

section	.data

msg: db "Seleccion opcion [1: hi, 2: bye]", 0xa
len	equ	$ - msg
msg_out: db "Hi", 0xa
len_out	equ	$ - msg_out
msg_bye: db "bye", 0xa
len_bye equ $ - msg_bye

section .bss
    buf resb 1