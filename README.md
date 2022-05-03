# Designing a simple CPU Datapath using Verilog
## Context 
1. [ALU](#1-ALU)
2. [LED Counter](#2-led-counter)
3. [Assembly]()
4. [Data Path]()
## 1. ALU
### - Gate Level Full Adder
Implemented with ANDs, OR and XOR gates. The full adder takes a carry-in and two binary numbers as inputs, and a carry out and sum result as outputs.
![image](https://user-images.githubusercontent.com/90415099/147891318-7ded936c-6a77-43d1-b578-715d48edd64f.png)

### - Ripple Carry Adder from Full Adders
The ripple carry adder was implemented by putting 8 full adders in series.
![image](https://user-images.githubusercontent.com/90415099/147891355-b0edf074-3a8f-42b5-bf7d-98d771743298.png)

### - Carry Select Adder from 4-bit Ripple Carry Adder
Utilize a 4-bit ripple carry adder to determine the 4 LSBs and then depending on the carry out of this
computation, one of the ripple carry adders that accounts for this carry is selected for the 4 MSBs of the
sum
![image](https://user-images.githubusercontent.com/90415099/147891376-0797b9c7-cf82-4b5c-8a5e-07d203e7d98a.png)

### - Arithmetic Logic Unit(ALU)
The ALU, Arithmetic Logic Unit, take in 3 inputs. One input is the OPCODE, which decides the function
the ALU will operate. The other two inputs are the values the ALU is operates on. We made it to operate
on 10 functions : and, or, not, xor, left shift, logical right shift, arithmetic right shift, add, and subtract.
It will output the result of the operation and flags that describes the result whether if it is negative, zero,
has a carry out, or has a overflow.
![image](https://user-images.githubusercontent.com/90415099/147891387-1ca3c857-6ea1-46d9-a869-1719f223e641.png)
## 2. LED Counter
### - 8-bit Counter
Implemented an 8-bit counter capable of reversing the direction of its count, and resetting its count
within our desired bounds. The counter can also be paused.
![image](https://user-images.githubusercontent.com/90415099/147891565-6e6a9d55-f006-445f-8755-46c7d932d4e4.png)

### - Clock Divider
The clock divider is intended to take in a more traditional MHz clock frequency and output a human friendly
clock. The current configuration is capable of translating the 100MHz clock of the FPGA to 1 second.
![image](https://user-images.githubusercontent.com/90415099/147891587-1850f006-d2f9-46aa-8062-5317bf202d5f.png)

### - Wrap-Around LEDs
It outputs a certain arrangement of LEDs. This machine should be cable of reversing and pausing its direction. It takes inputs from 3 switches, which controls the direction and pausing. 
![image](https://user-images.githubusercontent.com/90415099/147891626-62070d7a-acc4-4654-a1c5-795e6ffa4ca4.png)
