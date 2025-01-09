`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 03:41:33 PM
// Design Name: 
// Module Name: tb_bcd_counter_16b
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


module tb_bcd_counter_16b();

reg clk;
reg ENABLE = 1'b1;
reg RESET = 1'b1;
wire [15:0] OUT;
//module bcd_counter_16b(input clk, input enable, input reset, output [15:0] out);
bcd_counter_16b uut(.clk(clk), .enable(ENABLE), .reset(RESET), .out(OUT));
    
initial begin
	clk = 1'b0;
	forever #5 clk = !clk;
end

initial begin
	ENABLE = 1'b0;
	RESET = 1'b1;
#20
	RESET = 1'b0;
#20 
	ENABLE = 1'b1;
#100
	ENABLE = 1'b0;
#20
	ENABLE = 1'b1;
#200
	RESET = 1'b1;
#20
	RESET = 1'b0;
#8000
	ENABLE = 1'b0;
	RESET = 1'b1;
#20
	RESET = 1'b0;
#20
	ENABLE = 1'b1;
#20
	$finish;
end

endmodule
