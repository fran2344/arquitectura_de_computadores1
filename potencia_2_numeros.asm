  SYS_INIT_MODULE  equ 0x80
  SYS_EXIT         equ 0x01
  SYS_WRITE        equ 0x04

section .bss
  var1: resb 4

section .text
  global _start

_start:
  mov esi, 1
  mov ecx, 4
label:
  add esi, esi
  dec ecx
  cmp ecx, 0
  jg label
  mov eax, 1
  mul esi
  aam
  add eax, 3030h
  mov ebp, esp
  sub esp, 2
  mov [esp], byte ah
  mov [esp+1], byte al
  mov ecx, esp
  ;mov [var1], ah
  mov eax, SYS_WRITE 
  mov edx, 2; longitud
  ;mov ecx, var1
  mov ebx, 1; mensaje error
  int SYS_INIT_MODULE
  mov esp, ebp
  mov eax, SYS_EXIT
  mov ebx, 0
  int SYS_INIT_MODULE