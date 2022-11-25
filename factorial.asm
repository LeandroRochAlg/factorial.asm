%include "io64.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    xor rax, rax
    GET_UDEC 8, fact
    mov rax, [fact]
    PRINT_STRING "The factorial of "
    PRINT_UDEC 8, fact  ;using 8 bytes to be able to calculate greater numbers
    PRINT_STRING " is: "
    mov rbx, rax
    cmp rax, 0  ;if the number is 0 the result needs to be 1
    jle .factzero
        call factorial
        PRINT_UDEC 8, fact
        ret
    .factzero:
        mov rax, 1
        PRINT_UDEC 8, rax
        ret
    
factorial:  ;recursive function
    dec rbx    
    cmp rbx, 0  ;when the number gets to 0 the calculation stops
    jle .end_if
        mul rbx ;mul works by multiplying a register to rax
        mov [fact], rax
        jmp factorial
    .end_if:
        ret 
    
section .bss
    fact resq 1 ;working with 64 bits in the whole code to reach greater numbers
