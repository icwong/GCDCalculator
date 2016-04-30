
              .text
              .globl rmpy

rmpy: 
              push %rbp
              mov %rsp, %rbp
              push %r15
              push %r14
            
              mov    (%rdi), %ebx #numerator 1
              mov    4(%rdi), %r8d #denominator 1
              mov    (%rsi), %ecx #numerator 2
              mov    4(%rsi), %r9d #denominator 2
              mov    %rdx, %r13 #rdx Third argument , r13 holds address of rdx

              mov $0, %r12 
              
	       mov %r8d, %eax #Store 32bit D1 into %eax
              imul %r9d      #D2 multiply by %rax
              mov %rax, %r15 #Stores result of imul(rax) into r15

              mov %ebx, %eax #Store 32 bit N1 into %rax
              imul %ecx      #N2 x N1
              mov %rax, %r14 #Stores result of imul(rax) into r14 

              cmp $0, %r14
              je zero_case_N
              cmp $0, %r15
              je zero_case_D

	       mov $0, %rdx
              mov %r14, %rdi #Denominator FINAL for gcd input
              mov %r15, %rsi #Numerator FINAL for gcd input

              sub $8, %rsp
              call gcd
              add $8, %rsp

		mov %rax, %r10   #r10 holds GCD 
              mov %r14, %rax
              div %r10         #Numerator / GCD

              mov %rax, (%r13)  #Store numerator into r3[0]
              mov %r15, %rax
              div %r10          #Denominator / GCD

              mov %rax, 4(%r13) #Store denominator into r3[1]
              jmp epilog

zero_case_N:  mov %r12, (%r13)
	       mov %r15, 4(%r13)
		je epilog

zero_case_D:  mov %r14, (%r13)
		mov %r12, 4(%r13)
		je epilog
		
epilog: 
              pop %r14
              pop %r15
              mov %rbp, %rsp
              pop %rbp
      		ret
              