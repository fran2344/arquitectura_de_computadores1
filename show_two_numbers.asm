section .bss
  var1: resb 1
  var2: resb 4
  
section .text
  global _start

_start:
  call func
  mov eax, 1
  mov ebx, 0
  int 0x80

func:
  mov eax, 3
  mov ebx, 6
  mul ebx
  aam
  add eax, 3030h
  mov ebp, esp
  sub esp, 2
  mov [esp], byte ah
  mov [esp+1], byte al
  mov ecx, esp
  mov edx, 2
  mov ebx, 1
  mov eax, 4
  int 0x80
  mov esp, ebp
  ret
