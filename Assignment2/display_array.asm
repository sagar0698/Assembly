;Sagar Joshi
;CPSC 240
;Assignment 2 - Arrays

extern printf
extern scanf
global display_array
segment .data

integerformat db "%ld ", 0

segment .bss

segment .text
display_array:

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
push qword -1

mov r15, rdi	
mov r14, rsi	
mov r13, 0	

enter_loop:
cmp r13, r14
jge exit_loop

mov rax, 0
mov rdi, integerformat
mov rsi, [r15 + 8*r13]
call printf
inc r13
jmp enter_loop

exit_loop:


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
mov qword rax, 0 
                                 
ret