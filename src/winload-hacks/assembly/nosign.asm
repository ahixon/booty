; code offset for produced binary is 0x3c
; up to ".file", generally to 0x60 (not inclusive)
;
; intended to replace BlImgQueryCodeIntegrity
; offset 0x30230

mov [rsp+0x10], rbx
push rdi
sub rsp, 0x20

mov r9b, 1
mov [rsp+0x30], r9b     ; argument 1
mov [rsp+0x38], r9b     ; argument 2

mov rbx, 0              ; success?

add rsp, 0x20
pop rdi
retn