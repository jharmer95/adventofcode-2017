// aarch64 ASM
// advent 1 p2 solution

// Registers used:
// r0 - 0th parameter and return value
// r1 - 1st parameter
// r19 - 1st digit (used for wrap-around)
// r20 - Accumulated sum (used for return value)
// r21 - Current char offset
// r22 - Previous digit
// r23 - Current digit
.text

.global main

main:
    // setup
    stp x29, x30, [sp, -80]!
    mov x29, sp
    stp x19, x20, [sp, 16]
    stp x21, x22, [sp, 32]
    str x23, [sp, 48]
    str w0, [sp, 76]
    str x1, [sp, 64]

    // Initialize sum to 0
    mov x20, #0
    // Initialize offset to 1
    mov x21, #1

    // check if number of params is < 2 (aka no passed in params)
    cmp x0, #2
    b.lt fin

    // Load first char of parameter1 to r19
    ldr x19, [x1, 8]
    ldrb w19, [x19]

    // convert ASCII char to decimal digit
    sub w19, w19, #48

    // Store as previous digit
    mov w22, w19

// Loop until char is NULL
digitLoop:
    // Load next char of parameter1 to r23
    ldr x23, [x1, 8]
    ldrb w23, [x23, x21]
    cmp w23, #0
    b.eq done

    sub w23, w23, #48
    cmp w23, w22
    b.ne skipSum
    add w20, w20, w23

skipSum:
    // move current digit to prev. digit, increment offset, and loop again
    mov w22, w23
    add x21, x21, #1
    b digitLoop

done:
    cmp x21, #1
    b.eq fin
    // Compare last digit to first to detect wrap-around
    cmp w22, w19
    b.ne fin
    add w20, w20, w22

fin:
    mov w1, w20
    adrp x0, .LC0
    add x0, x0, :lo12:.LC0
    bl printf

    mov w0, 0
    ldp x19, x20, [sp, 16]
    ldp x21, x22, [sp, 32]
    ldr x23, [sp, 48]
    ldp x29, x30, [sp], 80
    ret

.LC0:
    .string "%llu"
