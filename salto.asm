  SYS_INIT_MODULE  equ 0x80
  SYS_EXIT         equ 0x01
  SYS_WRITE        equ 0x04

section .data
  message:     db  10,13, "Hello"
  ;palabra db 10,13, "Hello"

  message_len: equ $-message

section .text
  global _start

_start:
  mov esi, 3
imprimir:
  mov eax, SYS_WRITE;
  mov ebx, 1; // file descriptor
  mov ecx, message; // char
  mov edx, message_len; // size
  int SYS_INIT_MODULE; // invoke kernel
  mov ecx, esi
  dec ecx
  mov esi, ecx
  cmp ecx, 0
  jg imprimir
  mov eax, SYS_EXIT; // sys_exit(int error_code)
  mov ebx, 0; // error code
  int SYS_INIT_MODULE; // invoke kernel