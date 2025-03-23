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
