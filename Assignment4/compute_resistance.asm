extern printf
extern scanf
extern resistance
extern get_resistance
extern show_resistance 
global compute_resistance

segment .data
intergerform db "%lf", 0
space db " ", 0
blank_line db " ", 10,0

segment .bss

segment .text
compute_resistance:

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

movsd xmm13, xmm3	
movsd xmm12, xmm2	
movsd xmm11, xmm1
movsd xmm10, xmm0	

mov rbx, 0x3ff0000000000000	;this represents 1.0
push rbx
movsd xmm15, [rsp]
pop rbx			;xmm15 = 1.0

movsd xmm6, xmm15	
movsd xmm7, xmm15
movsd xmm8, xmm15
movsd xmm9, xmm15	

;calcuating the circuit	
divsd xmm6, xmm10       ;xmm4 = xmm4/xmm10
divsd xmm7, xmm11       ;xmm5 = xmm5/xmm11
divsd xmm8, xmm12       ;xmm6 = xmm6/xmm12
divsd xmm9, xmm13       ;xmm7 = xmm7/xmm13

;calculating the  citcuit	r = r1 + r2 + r3 +r4
movsd xmm14, xmm6   	 
addsd xmm14, xmm7
addsd xmm14, xmm8
addsd xmm14, xmm9

divsd xmm15, xmm14

movsd xmm0, xmm15

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