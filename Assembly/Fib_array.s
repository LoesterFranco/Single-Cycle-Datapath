	.8byte				//    PRESERVE8

	.global Fib_array	// Export symbol

Fib_array:           // X0 -> first parameter

/************Begin Implementation here**************/
add x1, xzr, xzr;

/* Fib[0]=0 */
stur x1, [x0, #0]

/* Fib[1]=1 */
add x10, x1, #1;
stur x10, [x0, #8]

/* starting from Fib[2] */
add x11, x1, #2;

LOOP:

/* getting value from 2 address before */
sub x13, x11, #2;
lsl x14, x13, #3;
add x14, x0, x14;
ldur x14, [x14, #0];

/* getting value from 1 addrss before */
sub x15, x11, #1;
lsl x16, x15, #3;
add x16, x0, x16;
ldur x16, [x16, #0];

/* adding the two values */
add x17, x14, x16;

/* getting address of target */
lsl x18, x11, #3;
add x18, x0, x18;
stur x17, [x18, #0];

/* move to next address */
add x11, x11, #1;

/************End Implementation here****************/
sub x12, x11, #32;
cbnz x12, LOOP;

// This returns back to C code
    BR x30
