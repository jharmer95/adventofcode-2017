// aarch64 ASM
// advent 1 solution
.text

.global main

main:
    ldr x0, [x1, 8]
    ldrb w0, [x0]
    sub w0, w0, #48
    ldr x0, [x1, 8]
    ldrb w0, [x0, 1]
    sub w0, w0, #48
    ret
