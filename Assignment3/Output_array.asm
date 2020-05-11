;Sagar Joshi
;Assignment 3 - Find Largest
;CPSC 240
;Language: x86
;File name: Output_array.asm

extern printf
extern scanf
global output

segment .data
integerformat db  " %ld " , 0

segment .text

output:
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


mov r14, rdi
mov r15, rsi
mov r13, 0 

mov r12,0

enter:
cmp r13, r15
jge exit
cmp [r14+8*r13],r12
je exit

mov rax,0
mov rdi, integerformat
mov rsi,[r14+8*r13]
call printf

inc r13
jmp enter
exit:

pop rax                                                     
popf                                                        
pop rbx                                                
pop r15                                                 
pop r14  
mov r14, r13                                            
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