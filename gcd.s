	      .text
        .globl gcd
        #PROLOG
gcd:
			  push %rbp
			  mov %rsp, %rbp
			  push %rbx	
        #ALGORTHIM
        #First argument = %rdi
        #Second argument = %rsi
gcdhelper:    cmp $1, %rdi  # First argument == 1?
              mov $1, %rax  
              je epilog     # First argument == 1 means gcd = 1
             
              cmp $1, %rsi  # Second argument == 1?
              mov $1, %rax  
              je epilog     # Second argument == 1 means gcd = 1
              cmp %rdi, %rsi # First argument == Second argument?
              je done       
              jl mGreatern   # First argument > Second argument
              jnl mlessthann # First argument < Second argument

mGreatern:    mov %rdi, %rbx 
              mov %rsi, %rdi
              mov %rbx, %rsi #gcd (n,m)
              call gcdhelper
              jmp epilog

mlessthann:   sub %rdi, %rsi #gcd(m,n-m)
              call gcdhelper
              jmp epilog		

done:         mov %rdi, %rax  #gcd(n,m) = m if m=n
              jmp epilog

epilog:       pop %rbx
		          mov %rbp, %rsp
		          pop %rbp
		          ret

