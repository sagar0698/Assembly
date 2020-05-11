extern printf
extern scanf
global resistance
extern get_resistance
extern show_resistance
extern compute_resistance

segment .data
input_format db "%lf", 0
input_integer db "%ld", 0
msg1 db "This program will automate finding the resistance in a large circuit.",10, 0
msg2 db "Separate the inputs by white spaces and press enter after last value: ",10, 0		
msg3 db "which requires %ld ns to compute.", 10,0
msg4 db "The resistance of the system will be returned to the driver.",10, 0
blank_line db " ", 10,0

segment .bss  
circuit1 resq 1
circuit2 resq 1
circuit3 resq 1
circuit4 resq 1

segment .text 
resistance:

push rbp	;Saves copy on top of the stack
mov rbp, rsp	;Be compatible with C
push rdi	;Backup rdi
push rsi	;Backup rsi
push rdx	;Backup rdx
push rcx	;Backup rcx
push r8		;Backup r8
push r9		;Backup r9
push r10	;Backup r10
push r11	;Backup r11
push r12	;Backup r12
push r13	;Backup r13
push r14	;Backup r14
push r15	;Backup r15

;Prints msg1
mov rax, 0			
mov rdi, msg1
call printf			

;Prints msg2
mov rax, 0
mov rdi, msg2
call printf

;get_resistance
mov rax, 0
mov rdi, circuit1
mov rsi, circuit2
mov rdx, circuit3
mov rcx, circuit4
call get_resistance

;------ This section computes the Area ------
movsd xmm10, [circuit1]	
movsd xmm11, [circuit2]		
movsd xmm12, [circuit3]	
movsd xmm13, [circuit4]	

;Reads clock and saves its value 
cpuid
rdtsc
shl rdx, 32
or rdx,rax
mov r12, rdx

;compute_resistance
mov rax, 4
movsd xmm0, xmm10
movsd xmm1, xmm11
movsd xmm2, xmm12
movsd xmm3, xmm13	
call compute_resistance
movsd xmm14, xmm0

;Reads clock and saves its value
cpuid
rdtsc
shl rdx, 32
or rdx,rax
mov r13, rdx

;show_resistance
mov rax, 1
movsd xmm0, xmm14
call show_resistance

;--- This section subtracts the two clock values and outputs nanoseconds (ns)---
;Prints msg3
sub r13, r12	;r13 = r13-r12
mov rax, 0
mov rdi, msg3		
mov rsi, r13
call printf

;Prints msg4
mov rax, 0
mov rdi, msg4			
call printf

;---- Pops ----
movsd xmm0, xmm14

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