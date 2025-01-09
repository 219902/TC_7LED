`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 05:20:12 PM
// Design Name: 
// Module Name: tb_digit_selector
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


module tb_digit_selector();

reg clk;
reg [1:0] ADDRESS = 2'b00;
reg [3:0] UNITS = 4'd3;
reg [3:0] TENS = 4'd5;
reg [3:0] HUNDREDS = 4'd7;
reg [3:0] THOUSANDS = 4'd9;
wire [3:0] DIGIT;
//module digit_selector(input [1:0] address, input [3:0] thousands,	input [3:0] hundreds, input [3:0] tens,	input [3:0] units, output reg [3:0] digit);
digit_selector uut(.address(ADDRESS), .thousands(THOUSANDS), .hundreds(HUNDREDS), .tens(TENS), .units(UNITS), .digit(DIGIT));


initial begin
	clk = 1'b0;
	forever #5 clk = !clk;
end

initial begin
	ADDRESS = 2'b00;
#50
	ADDRESS = 2'b01;
#50
	ADDRESS = 2'b10;
#50
	ADDRESS = 2'b11;
#50
	ADDRESS = 2'b00;
#50
	ADDRESS = 2'b11;
#50
	ADDRESS = 2'b00;
#50
	ADDRESS = 2'b10;
#50
	ADDRESS = 2'b01;
#50
	ADDRESS = 2'b00;
#50
	$finish;
end
endmodule
