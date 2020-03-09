extern printf
extern scanf
extern DisplayArray
extern ReverseArray
global manager

segment .data

stringformat db "%s" ,0
integerformat db "%ld", 0
msg1 db "This program will reverse your array of integers", 10 , 0
msg2 db "Enter a sequence of long integers separated by white space. After the last input press enter followed by Control+D: ", 10, 0
msg3 db "These numbers were received and placed into the array", 10, 0
msg4 db "After the reverse function these are the numbers of the array in the new order: ", 10, 0
msg5 db "The number of numbers entered is %ld and the mean is %ld ", 10, 0
msg6 db "The mean will now be returned to the main function", 10, 0

segment .bss

arraydata resq 14							 ;reverse a 14 slot array

segment .text
manager:
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

mov qword rdi, stringformat
mov qword rsi, msg1
mov qword rax, 0
call printf

mov qword rdi, stringformat
mov qword rsi, msg2
mov qword rax, 0
call printf

mov rcx, 0								 ;rcx = index for loop
mov r13, 15								 ;max size of array = 15
mov r12, 0								 ;r12 tracks total of values 

top:
push qword -1
mov rax, 0
mov rdi, integerformat
mov rsi, arraydata
mov r14, rcx
imul r14, 8
add rsi, r14
call scanf
pop r10

cdqe
cmp rax, -1
finish je

inc rcx
jmp top

finish:
mov r15, rcx								 ;stores elements into the array

mov qword rdi, stringformat
mov qword rsi, msg3
mov qword rax, 0
call printf

;displays normal array
mov rdi, arraydata
mov rsi, r15
mov rax, 0
call DisplayArray

;reverse array
mov rdi, arraydata
mov rsi, r15
mov rax, 0
call ReverseArray

;prints message to reverse the array
mov qword rdi, stringformat
mov qword rsi, msg4
mov qword rax, 0
call printf

;call display to display reverse array
mov rdi, arraydata
mov rsi, r15
mov rax, 0
call DisplayArray

;compute mean
mov qword rax, r12
cqo
idiv r15

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
	pop
ret
