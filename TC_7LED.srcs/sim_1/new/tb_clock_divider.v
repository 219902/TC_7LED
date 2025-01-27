`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 06:33:44 PM
// Design Name: 
// Module Name: tb_clock_divider
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


module tb_clock_divider();

reg clk;
reg RESET = 1'b0;
wire OUT;
wire OUT_2;

//module clock_divider(input clk, input reset, output out);
clock_divider #(.DIVISOR(12'd2)) uut_0(.clk(clk), .reset(RESET), .out(OUT));
clock_divider #(.DIVISOR(12'd4)) uut_1(.clk(clk), .reset(RESET), .out(OUT_2));
initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

initial begin
#107    
	RESET = 1'b1;
#100
	RESET = 1'b0;
	
#10000
	$finish();
end

endmodule
