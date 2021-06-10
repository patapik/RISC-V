# Hello World RISC-V example 

.global _start    

_start: addi  a0, x0, 1    #ADD 1 to X0 and store in a0 (StdOut)
        la    a1, text     #Load text address into a1
        addi  a2, x0, 13   #ADD length of text to X0, store in a2
        addi  a7, x0, 64   #ADD 64 "Write syscall" to X0 and load into a7
        ecall              #syscall a7
        addi    a0, x0, 0  #store 0 - return code in a0
        addi    a7, x0, 93 #93 terminate program in a7
        ecall              #syscall a7
.data
text:      .ascii “Hello World!\n” 

