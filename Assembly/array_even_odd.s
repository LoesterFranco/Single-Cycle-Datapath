	.8byte				//    PRESERVE8

	.global array_even_odd  // Export symbol

array_even_odd:             // X0 -> input array_ptr

/************Begin Implementation here**************/
add x1, xzr, xzr;  // index number
add x19, xzr, xzr; // imediate zero
add x13, x19, #2;

LOOP:
lsl x10, x1, #3;
add x11, x0, x10;
ldur x12, [x11, #0];

sdiv x14, x1, x13;
mul x15, x14, x13;
sub x16, x1, x15;

cbz x16, #12;
lsr x17, x12, #1;
b #8
lsl x17, x12, #1;

stur x17, [x11, #0]

add x1, x1, #1
/************End Implementation here****************/
sub x18, x1, #32;
cbnz x18, LOOP;
// This returns back to C code
	BR x30
