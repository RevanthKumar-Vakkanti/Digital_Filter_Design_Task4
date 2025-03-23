`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2025 22:48:54
// Design Name: 
// Module Name: fir_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fir_filter_tb;
    reg clk;          // Clock signal
    reg res;          // Reset signal
    reg [7:0] x;      // 8-bit input signal
    wire [15:0] y;    // 16-bit output signal

    // Instantiate the FIR filter module
    fir_filter uut (
        .clk(clk),
        .res(res),
        .x(x),
        .y(y)
    );

    // Generate clock with a period of 10 time units (5 high, 5 low)
    always #5 clk = ~clk;

    initial begin
        clk = 0;       // Initialize clock to 0
        res = 1;       // Assert reset
        x = 8'd0;      // Initialize input to 0
        #10 res = 0;   // Deassert reset after 10 time units

        // Apply test input values to the FIR filter
        #10 x = 8'd10;
        #10 x = 8'd20;
        #10 x = 8'd30;
        #10 x = 8'd40;
        #10 x = 8'd50;
        #10 x = 8'd60;
        #10 x = 8'd70;
        #10 x = 8'd80;
        #10 x = 8'd90;
        #10 x = 8'd100;

        #10 $finish;   // End simulation
    end

    // Monitor signals and print values during simulation
    initial begin
        $monitor("Time = %0t | Input x = %d | Output y = %d", $time, x, y);
    end
endmodule
