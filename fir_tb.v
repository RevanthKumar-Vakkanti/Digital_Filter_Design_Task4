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
















/*module fir_filter_tb;
    reg clk;
    reg rst;
    reg signed [15:0] x_in;
    wire signed [15:0] y_out;

    // Instantiate FIR filter module
    fir_filter uut (
        .clk(clk),
        .rst(rst),
        .x_in(x_in),
        .y_out(y_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        x_in = 0;
        
        #10 rst = 0; // Release reset
        
        // Apply test samples
        #10 x_in = 16'd1000;
        #10 x_in = 16'd2000;
        #10 x_in = 16'd3000;
        #10 x_in = 16'd4000;
        #10 x_in = 16'd5000;
        #10 x_in = 16'd6000;
        #10 x_in = 16'd7000;
        #10 x_in = 16'd8000;
        #10 x_in = 16'd9000;
        #10 x_in = 16'd10000;
        
        // Wait and finish
        #50;
        $stop;
    end

    initial begin
        $monitor("Time = %0t, x_in = %d, y_out = %d", $time, x_in, y_out);
    end
endmodule */

















/*module fir_filter_tb;

    reg clk;
    reg rst;
    reg signed [15:0] x_in;   // 16-bit input signal
    wire signed [15:0] y_out; // 16-bit output signal

    // Instantiate the FIR filter module
    fir_filter uut (
        .clk(clk),
        .rst(rst),
        .x_in(x_in),
        .y_out(y_out)
    );

    // Clock Generation
    always #5 clk = ~clk; // Generate a clock with 10ns period (100MHz)

    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        x_in = 16'd0;
        #20 rst = 0;  // Release reset after 20ns
        
        // Apply test input samples
        #10 x_in = 16'd1000;
        #10 x_in = 16'd2000;
        #10 x_in = 16'd3000;
        #10 x_in = 16'd4000;
        #10 x_in = 16'd0;    // Zero input
        #10 x_in = -16'd1000; // Negative input test
        #10 x_in = -16'd2000;
        #10 x_in = -16'd3000;
        #10 x_in = -16'd4000;
        #10 x_in = 16'd0;
        
        // Let the filter process more samples
        #50;
        
        // End simulation
        $stop;
    end

    // Monitor output
    initial begin
        $monitor("Time: %0t | x_in: %d | y_out: %d", $time, x_in, y_out);
    end

endmodule */


















// Testbench for FIR Filter
/*module tb_FIR_Filter();
    reg clk, rst;
    reg signed [15:0] x_in;
    wire signed [15:0] y_out;

    FIR_Filter uut (
        .clk(clk),
        .rst(rst),
        .x_in(x_in),
        .y_out(y_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        x_in = 0;
        #10 rst = 0;
        
        // Apply test input samples
        #10 x_in = 5;
        #10 x_in = 10;
        #10 x_in = 15;
        #10 x_in = 20;
        #10 x_in = 25;
        #50 $finish;
    end
endmodule */