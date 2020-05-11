;Sagar Joshi
;Assignment 3 - Find Largest
;CPSC 240
;Language: x86
;File name: Find_largest.asm

extern printf                                     
extern scanf
extern input
extern output
global find   
                           
segment .data                                     
msg1 db 10, "The largest value is %ld ", 0
msg2 db "has been found at index  %ld ",0

segment .bss                                      
myarray resq 10


segment .text
find:                                       
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

mov r8, rdi; hold array
mov r9, rsi; hold the size
mov r11, 0 ; initalize counter
mov r10, 0

toploop:
cmp r10, r9
jge finish
mov rbx, [rdi+8*r11]
mov rcx, [rdi+8*r10]
cmp rbx,rcx
jge continue

mov r11,r10
continue:
inc r10
jmp toploop

finish:
push r11
push rbx
mov rax,0
mov rdi, msg1
mov rsi,rbx
call printf

pop rbx
pop r11
push r11
mov rax,0
mov rdi, msg2
mov rsi,r11
call printf
pop r11


pop rax                                                     
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