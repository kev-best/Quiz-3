section .data
    num db 9         ; Define the number to calculate factorial
    result dd 1      ; Result variable initialized to 1

section .text
    global _start

_start:
    movzx ecx, byte [num] ; Load the number into ECX (counter)
    mov eax, 1            ; EAX will hold the factorial result

factorial_loop:
    cmp ecx, 1            ; Compare ECX with 1
    jle end_factorial     ; If ECX <= 1, end the loop

    imul eax, ecx         ; Multiply EAX by ECX (EAX = EAX * ECX)
    dec ecx               ; Decrement ECX by 1
    jmp factorial_loop    ; Repeat the loop

end_factorial:
    mov [result], eax     ; Store the result in the 'result' variable

    ; Exit program with the result as the exit status
    mov ebx, eax          ; Move the result to EBX (exit status)
    mov eax, 1            ; Syscall number (sys_exit)
    int 0x80              ; Call kernel
