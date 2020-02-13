;Author name: Sagar Joshi
;Program title:  Integer Arithmetic
;Files in this program:  egyptian.c, area.asm, run.sh
;Course number:  CPSC 240
;Assignment number: 1
;Due Date:  Feb 10, 2020
;Language of this module: Assembly, x86
;Purpose: Show how to perform arithmetic operations by calculating the area of a circle
;File name: area.asm

global area
extern printf                                                      ;program was not reading printf, so that is why extern printf and scanf is here
extern scanf

segment .data
  welcome db "This area function is fondly brought to you by Sagar Joshi", 10, 0
  instruction db "Please enter the radius of a circle in whole numbers of meters: ", 0
  datareceived db "The number %d was received", 10, 0
  arearesult db "The area of a cicle with this radius is %d and %d/7 square meters", 10, 0
  mainreturn db "The integer part of the area will be returned to the main program. Please enjoy your circles.", 10, 0
  format db "%d", 0

segment .bss                                                       ;This is an empty segment

segment .text
area:                                                              ;Entry point
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
  

mov rdi, welcome
mov rax, 0
call printf

mov rdi, instruction
mov rax, 0
call printf

push qword 0
mov rdi, format
mov rsi, rsp
mov rax, 0
call scanf
pop r12                                                            ;r12 receives the input from the user

mov rdi, datareceived                                              ;prints out r12
mov rsi, r12                                                       
mov rax, 0
call printf

;finding radius^2
mov rax, r12
mov rdx, 0
imul r12                                                           ;rdx:rax = r12 * r12
mov r13, rax                                                       ;r13 = r12 * r12, this does work                                                  

;multiplying r13 * 22
mov rax, 22
mov rdx, 0
imul r13                                                           ;rdx:rax = rax(22) * r13
mov r13, rax                                                       ;r13 = r13*22
mov rax, 0
mov rdi, format
mov rsi, r13                                                       ;this does work for example: radius 2, 2^(2) * 22 = 88

;finding area of the circle with the user entering the radius
mov rax, r13
cqo  
mov r9, 7                                                          ;r9 = 7
idiv r9
mov r13, rax                                                       ;r13 = (radius^2 * 22) / 7
mov r14, rdx                                                       ;r14 = remainder from r13, this does not work 

mov rax, 0
mov rdi, arearesult                                                ;displays the quotient for area and the amount of square meters                                             
mov rsi, r13                                                       
call printf

mov rax, 0
mov rdi, mainreturn 
call printf
mov rax, r13

pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rdi
pop rsi
pop rdx
pop rcx
pop rbx
pop rbp

                                                                ;runs value back to the C prgoram
ret
