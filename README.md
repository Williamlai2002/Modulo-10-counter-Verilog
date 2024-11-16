# Modulo-10-counter-Verilog
This repository contains the Verilog implementation of a modulo-10 counter designed for FPGA simulation. The counter wraps around between 0 and 9, and its behavior is controlled by two inputs (w1 and w0) as follows:

w1w0 = 00: No change in count.

w1w0 = 01: Increment count by 1.

w1w0 = 10: Increment count by 2.

w1w0 = 11: Decrement count by 1.

#Key Features

Reset and Clocking:

Active-low synchronous reset (SW[0]).

Manual clock (KEY[0]).

Input Control:

Inputs w1 and w0 connected to SW[2:1].

Display Output:

The counter value is decoded and displayed on the 7-segment display HEX0.

This project demonstrates the use of high-level behavioral Verilog coding with arithmetic operations to implement a finite state machine (FSM) efficiently.
