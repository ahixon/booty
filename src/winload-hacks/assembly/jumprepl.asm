%define BOOTY_SECTION   0x4c3000    ; the actual (not virtual) address it starts
%define START_OFFSET    0x1b        ; after strings and shiz
%define WINLOAD_OFFSET  0x116000

mov r14, (BOOTY_SECTION + START_OFFSET - WINLOAD_OFFSET)
jmp r14