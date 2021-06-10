# Hello World RISC-V example 

.global _start    

_start: addi  a0, x0, 1
        la    a1, text
        addi  a2, x0, 13
        addi  a7, x0, 64
        ecall
        addi    a0, x0, 0
        addi    a7, x0, 93
        ecall
.data
text:      .ascii “Hello World!\n” 
