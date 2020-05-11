;Sagar Joshi
;CPSC 240
;Assignment 2 - Arrays

extern printf
extern scanf
extern display_array
extern reverse
global manager

segment .data
msg1 db "This program will reverse your array of integers", 10, 0
msg2 db "Enter a sequence of long integers separated by white space. After the last input press enter followed by Control+D: ", 10, 0
msg3 db "These number were received and placed into the array: ", 10, 0
msg4 db "After the reverse function these are the numbers of the array in the new order: ", 10, 0
msg5 db "The number of numbers entered is %ld and the mean is %ld.", 10, 0
msg6 db "The mean will now be returned to the main function.", 10, 0
stringformat db "%s", 0
integerformat db "%ld", 0
whitespace db " ", 0
emptyspace db " ", 10, 0

segment .bss
arraydata resq 20

segment .text
manager:

push rbp                                                    ;Backup rbp
mov  rbp,rsp                                                ;The base pointer now points to top of stack
push rdi                                                    ;Backup rdi
push rsi                                                    ;Backup rsi
push rdx                                                    ;Backup rdx
push rcx                                                    ;Backup rcx
push r8                                                     ;Backup r8
push r9                                                     ;Backup r9
push r10                                                    ;Backup r10
push r11                                                    ;Backup r11
push r12                                                    ;Backup r12
push r13                                                    ;Backup r13
push r14                                                    ;Backup r14
push r15                                                    ;Backup r15
push rbx                                                    ;Backup rbx
pushf                                                       ;Backup rflags
push qword 0


;Print msg1
mov rax, 0
mov rdi, stringformat
mov rsi, msg1
call printf


;Prints msg2
mov rax, 0
mov rdi, stringformat
mov rsi, msg2
call printf


;Enter values into the array
mov r15, 0                                      ;r15 = counter
enter_loop:
mov rax, 0
mov rdi, integerformat
push qword 0
mov rsi, rsp
call scanf

pop r14                                         ;save value in r14
cdqe
cmp rax, -1                                     ;Control-D
je exit_loop                               	;jump to exit_loop
mov [arraydata + 8*r15], r14                    ;array contains r14
inc r15                                         ;increase counter
cmp r15, 20                                     ;r15 >= 20 if(counter >= size of array) -> exit_loop else enter_loop
jge exit_loop                               	;jump to exit_loop
jmp enter_loop                                  ;jump to enter_loop
exit_loop:

mov rax, 0
mov rdi, msg3
mov rsi, stringformat
call printf

mov rax, 0
mov rdi, arraydata
mov rsi, r15
call display_array

mov rax, 0
mov rdi, emptyspace
call printf


;Actions for reversing the entered array
;Prints msg4
mov rax, 0
mov rdi, msg4
mov rsi, stringformat
call printf

mov rdi, arraydata
mov rsi, r15
call reverse


;Prints the array in reverse
mov r13, 1                              ;r13 = new counter
enter_loop_again:
push r13                                ;zero out the register
mov qword rdi, integerformat
mov qword rsi, [arraydata + 8*r13]
mov rax, 0
call printf

mov rax, 0
mov rdi, whitespace
call printf

pop r13
cmp r13, r15
jge exit_loop_again
inc r13
jmp enter_loop_again

mov rax, 0
mov rdi, emptyspace
call printf

exit_loop_again:

;Compute the mean of the array
mov rax, 0
mov rdi, emptyspace
call printf

mov r8, 0
push qword 0
mov r9, [rsp]
pop r10

topofloop:
cmp r8, 14
jge outofloop
mov r10, [arraydata + 8*r8]
push r10
mov r11, [rsp]
add r9, r11
inc r8
pop r10
jmp topofloop
outofloop:

mov rax, r9
mov rbx, r15
cqo
div rbx
mov rbx, rax


;Prints number of integers and mean of the array
;Print msg5
mov rdi, msg5
mov qword rdx, rbx
mov qword rsi, r13
mov rax, 0
call printf

;Print msg6
mov rax, 0
mov rdi, msg6
call printf

pop rax                                                     
mov qword rax, rbx
popf                              
pop rbx
pop r15
pop r14
pop r13
pop r12
pop r11                            
pop r10                          
pop r9                                              
pop r8                                                   
pop rcx                                                
pop rdx                                                
pop rsi                                                   
pop rdi                                                     
pop rbp                                                     
                                 
ret