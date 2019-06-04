// aarch64 ASM
// advent 1 p2 solution

// Registers used:
// r0 - 0th parameter and return value
// r1 - 1st parameter
// r19 - Gap size (1/2 * num of digits)
// r20 - Accumulated sum (used for return value)
// r21 - Current char offset
// r22 - Current digit
// r23 - Comparing digit
// r24 - Total size
// r25 - Offset + gap
.text

.global main

main:
    // setup
    stp x29, x30, [sp, -80]!
    mov x29, sp
    stp x19, x20, [sp, 16]
    stp x21, x22, [sp, 32]
    stp x23, x24, [sp, 48]
    str x25, [sp, 64]

    // Initialize sum to 0
    mov x20, #0
    // Initialize offset to 0
    mov x21, #0

    // check if number of params is < 2 (aka no passed in params)
    cmp x0, #2
    b.lt fin

// Loop until char is NULL
digitLoop1:
    // Load next char of parameter1 to r22
    ldr x22, [x1, 8]
    ldrb w22, [x22, x21]
    cmp w22, #0
    b.eq endFound
    // increment offset and loop again
    add x21, x21, #1
    b digitLoop1

endFound:
    mov x24, x21
    mov x19, #2
    // Copy offset / 2 to r19
    udiv x19, x21, x19
    // Reset offset
    mov x21, #0

digitLoop2:
    // Load next char of parameter1 to r22
    cmp x21, x24
    b.gt done
    ldr x22, [x1, 8]
    ldrb w22, [x22, x21]
    sub w22, w22, #48
    add x25, x21, x19
    // If desired location is greater or equal to max index, wrap around
    cmp x25, x24
    b.lt compare
    sub x25, x24, x25

compare:
    ldr x23, [x1, 8]
    ldrb w23, [x23, x25]
    sub w23, w23, #48
    cmp w22, w23
    b.ne skipSum
    add w20, w20, w22

skipSum:
    // increment offset, and loop again
    add x21, x21, #1
    b digitLoop2

done:
    cmp x21, #1
    b.eq fin
    // Compare last digit to first to detect wrap-around
    sub x21, x21, #1
    ldr x22, [x1, 8]
    ldrb w22, [x22, x21]
    sub w22, w22, #48
    add x25, x21, x19
    sub x25, x24, x25
    ldr x23, [x1, 8]
    ldrb w23, [x23, x25]
    sub w23, w23, #48
    cmp w22, w23
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
