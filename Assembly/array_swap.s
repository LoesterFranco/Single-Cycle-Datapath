    .8byte    
    .global array_swap    // Export symbol

array_swap:           // X0 -> first parameter
                      // X1 -> output array_ptr

/************Begin Implementation here**************/
add x10, xzr, xzr; // initialize starting index
add x11, x10, #31; // set last index

LOOP: lsl x12, x10, #3;
add x12, x0, x12;
ldur x13, [x12, #0];

sub x14, x11, x10;
lsl x14, x14, #3;
add x14, x1, x14;
stur x13, [x14, #0];

add x10, x10, #1;

/************End Implementation here****************/
sub x15, x10, #32;
cbnz x15, LOOP;
// This returns back to C code
    BR x30

