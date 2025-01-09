`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 02:48:48 PM
// Design Name: 
// Module Name: tb_decade_counter
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


module tb_decade_counter();

reg clk;
reg LOAD = 1'b1;
reg ENABLE = 1'b0;
reg [3:0] DATA = 1'b0000;
wire [3:0] Q;

//module decade_counter(input clk, input load, input enable, input [3:0] data, output reg [3:0] q);
decade_counter uut(.clk(clk), .load(LOAD), .enable(ENABLE), .data(DATA), .q(Q));

initial begin
	clk = 1'b0;
	forever #5 clk = !clk;
end

initial begin
	ENABLE = 1'b0;
	LOAD = 1'b1;
#20
	LOAD = 1'b0;
#20 
	ENABLE = 1'b1;
#100
	ENABLE = 1'b0;
#20
	ENABLE = 1'b1;
#200
	DATA = 4'b0101;
	LOAD = 1'b1;
#20
	LOAD = 1'b0;
#200
	ENABLE = 1'b0;
	DATA = 4'b0011;
	LOAD = 1'b1;
#20
	LOAD = 1'b0;
#20
	ENABLE = 1'b1;
#20
	$finish;
end



endmodule
