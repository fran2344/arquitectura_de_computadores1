global _start

section .data
  message:     db  53, 0xa
  message_len: equ $-message

section .bss
  var1: resb 4

section .text
_start:
  mov esi, 9
  add esi, 48
  mov [var1], esi
  mov ecx, var1
  mov edx, message_len
  mov ebx, 1
  mov eax, 4
  int 0x80
  mov eax, 1
  mov ebx, 0; // error code
  int 0x80
  