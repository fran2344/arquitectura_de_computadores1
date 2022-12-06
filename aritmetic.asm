  SYS_INIT_MODULE  equ 0x80
  SYS_EXIT         equ 0x01
  SYS_WRITE        equ 0x04

section .bss
  var1: resb 4

section .text
  global _start

_start:
  mov eax, 9
  mov esp, 3
  mul esp
  aam
  add eax, 3030h
  ;add eax, 48
  mov [var1], ah
  mov eax, SYS_WRITE; 
  mov ebx, 1; 
  mov ecx, var1; 
  mov edx, 1; 
  int SYS_INIT_MODULE;
  mov eax, SYS_EXIT; 
  mov ebx, 0; 
  int SYS_INIT_MODULE; 