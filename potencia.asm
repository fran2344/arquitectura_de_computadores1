  SYS_INIT_MODULE  equ 0x80
  SYS_EXIT         equ 0x01
  SYS_WRITE        equ 0x04

section .bss
  var1: resb 4

section .text
  global _start

_start:
  mov esi, 1
  mov ecx, 2
label:
  add esi, esi
  dec ecx
  cmp ecx, 0
  jg label
  add esi, 48
  mov [var1], esi
  mov eax, SYS_WRITE 
  mov edx, 1
  mov ecx, var1
  mov ebx, 1
  int SYS_INIT_MODULE
  mov eax, SYS_EXIT
  mov ebx, 0
  int SYS_INIT_MODULE