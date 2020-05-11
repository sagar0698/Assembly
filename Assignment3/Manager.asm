;Sagar Joshi
;Assignment 3 - Find Largest
;CPSC 240
;Language: x86
;File name: Manager.asm

extern printf                                     
extern scanf
extern input
extern output
extern find
global manager                                

segment .data                                     

msg1 db "The manager is here to assist you. ", 10, 0
msg2 db "Input your integer data with white space separating each number. Press <enter> followed by Cntl+D to terminate.",10, 0
msg3 db 10,"These values were received:  ", 10,0
msg4 db 10, "There is a total of %ld numbers recieved ", 0
msg5 db 10, "The manager will now return the count to the driver", 10, 0
integerformat db " %ld ", 0

segment .bss                                      
myarray resq 10

segment .text                                     
manager:

push rbp                                                    ;Backup rbp
mov  rbp,rsp                                                ;Be compatible with C
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

mov rax, 0
mov rdi, msg1
call printf

mov r13, 10
push r13

mov rax, 0
mov rdi, msg2
call printf
pop r13

cdqe
push qword 0

mov rdi, myarray
mov rsi, r13
call input
pop rax

mov rax, 0
mov rdi, msg3
call printf

mov rdi, myarray
mov rsi, r13
call output

mov rdi, msg4
mov rsi, r14
mov rax ,0
call printf

mov rdi,myarray
mov rsi, r14
call find
mov rbx, r14

mov rax, 0
mov rdi, msg5
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