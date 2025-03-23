`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2025 22:47:31
// Design Name: 
// Module Name: fir
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

module fir_filter (
    input clk,              // Clock signal
    input res,              // Reset signal (active high)
    input [7:0] x,          // 8-bit input signal
    output reg [15:0] y     // 16-bit output signal
);

    parameter N = 4;        // Number of filter taps
    reg [7:0] coeffs [0:N-1];  // Array to store filter coefficients
    reg [7:0] shift_reg [0:N-1]; // Shift register to store past inputs

    integer i;

    // Initialize filter coefficients
    initial begin
        coeffs[0] = 8'h02;  // Coefficient for x[n]
        coeffs[1] = 8'h04;  // Coefficient for x[n-1]
        coeffs[2] = 8'h06;  // Coefficient for x[n-2]
        coeffs[3] = 8'h08;  // Coefficient for x[n-3]
    end

    // Sequential process triggered by clock or reset
    always @(posedge clk or posedge res) begin
        if (res) begin
            y <= 16'd0;  // Reset output to zero
            
            // Clear shift register
            for (i = 0; i < N; i = i + 1) begin
                shift_reg[i] <= 8'd0;
            end
        end else begin
            // Shift the values in the shift register
            for (i = N-1; i > 0; i = i - 1) begin
                shift_reg[i] <= shift_reg[i-1];
            end
            shift_reg[0] <= x;  // Store the new input sample

            // Compute the FIR filter output as a weighted sum
            y <= (shift_reg[0] * coeffs[0]) + 
                 (shift_reg[1] * coeffs[1]) + 
                 (shift_reg[2] * coeffs[2]) + 
                 (shift_reg[3] * coeffs[3]);
        end
    end
endmodule



























/*module fir_filter(
    input clk,                // Clock signal
    input rst,                // Reset signal
    input signed [15:0] x_in, // 16-bit input sample
    output reg signed [15:0] y_out // 16-bit output sample
);

    // Filter coefficients (1/3, 1/3, 1/3) scaled to integer values
    parameter signed [15:0] h0 = 16'd10923; // 1/3 * 32768
    parameter signed [15:0] h1 = 16'd10923;
    parameter signed [15:0] h2 = 16'd10923;

    // Delay line to store previous samples
    reg signed [15:0] x1, x2;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            x1 <= 16'd0;
            x2 <= 16'd0;
            y_out <= 16'd0;
        end else begin
            // Shift the delay line
            x2 <= x1;
            x1 <= x_in;
            
            // FIR filter computation: y[n] = h0*x[n] + h1*x[n-1] + h2*x[n-2]
            y_out <= (h0 * x_in + h1 * x1 + h2 * x2) >>> 15; // Scale down
        end
    end
endmodule */










/*module fir_filter (
    input clk,                  // Clock signal
    input rst,                  // Reset signal
    input signed [15:0] x_in,   // 16-bit input signal
    output signed [15:0] y_out  // 16-bit output signal
);
    
    // Number of taps (coefficients)
    parameter N = 4;

    // Filter coefficients (change as needed)
    reg signed [15:0] coeffs [0:N-1];
    initial begin
        coeffs[0] = 16'd1000;  // Example coefficient 1
        coeffs[1] = 16'd2000;  // Example coefficient 2
        coeffs[2] = 16'd2000;  // Example coefficient 3
        coeffs[3] = 16'd1000;  // Example coefficient 4
    end

    // Shift register for input samples
    reg signed [15:0] shift_reg [0:N-1];
    integer i;

    // Output computation register
    reg signed [31:0] acc;  // 32-bit accumulator for multiplication result

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset shift registers and accumulator
            for (i = 0; i < N; i = i + 1)
                shift_reg[i] <= 16'd0;
            acc <= 32'd0;
        end else begin
            // Shift input samples
            for (i = N-1; i > 0; i = i - 1)
                shift_reg[i] <= shift_reg[i-1];
            shift_reg[0] <= x_in;

            // Compute FIR filter output (MAC operation)
            acc = 32'd0;  // Reset accumulator
            for (i = 0; i < N; i = i + 1) begin
                acc = acc + (shift_reg[i] * coeffs[i]);
            end
        end
    end

    // Assign the output (truncate to 16-bit)
    assign y_out = acc[31:16];  // Take upper 16 bits for scaling

endmodule*/












/*module FIR_Filter #(parameter N = 4, DATA_WIDTH = 16) (
    input clk,
    input rst,
    input signed [DATA_WIDTH-1:0] x_in,
    output reg signed [DATA_WIDTH-1:0] y_out
);

    // FIR filter coefficients (Optimized for 1 kHz low-pass filter)
    reg signed [DATA_WIDTH-1:0] coeffs [N-1:0] = '{1264, 15120, 15120, 1264};
    
    // Shift register for input samples
    reg signed [DATA_WIDTH-1:0] shift_reg [N-1:0];
    
    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            y_out <= 0;
            for (i = 0; i < N; i = i + 1)
                shift_reg[i] <= 0;
        end else begin
            // Shift data
            for (i = N-1; i > 0; i = i - 1)
                shift_reg[i] <= shift_reg[i-1];
            shift_reg[0] <= x_in;
            
            // Compute output using FIR equation
            y_out <= 0;
            for (i = 0; i < N; i = i + 1)
                y_out <= y_out + (shift_reg[i] * coeffs[i]);
        end
    end

endmodule */

