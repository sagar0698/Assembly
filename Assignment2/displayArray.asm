extern printf
extern scanf
global DisplayArray

segment .data
integerformat db "%ld", 0

segment .bss

segment .text
DisplayArray: 
	push rbp                                                         ;Saves copy of the stack
	mov rbp, rsp                                                     ;Be compatible with C
  	push rbx                                                         ;Backup rbx
  	push rcx                                                         ;Backup rcx
  	push rdx                                                         ;Backup rdx
  	push rsi                                                         ;Backup rsi
  	push rdi                                                         ;Backup rdi
  	push r8                                                          ;Backup r8
  	push r9                                                          ;Backup r9
  	push r10                                                         ;Backup r10
  	push r11                                                         ;Backup r11
  	push r12                                                         ;Backup r12
  	push r13                                                         ;Backup r13
  	push r14                                                         ;Backup r14
  	push r15                                                         ;Backup r15
	pushf
	push qword -1

mov rax, 0
mov rdi, integerformat
mov rsi, 999
call printf

mov r15, 0
mov r14, rdi								 ;array data
mov r13, rsi								 ;total number of elements in the array

top:
mov rax, 0
mov rdi, integerformat
mov rsi, [r14 + 8 * r15]

cmp r13, r15
je finish
add r15, 1

jmp top

finish:
mov rax, 0
mov rdi, 10
mov rsi, 0
call printf

pop rax 

	popf
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rbx
	pop rdx
	pop rsi
	pop rdi
	pop rbp
ret
