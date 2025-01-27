`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 08:33:09 PM
// Design Name: 
// Module Name: tb_top_module
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


module tb_top_module();

reg clk;
reg RESET = 1'b0;
reg IN = 1'b0;
wire [2:0] ANODES;
wire [6:0] LEDS;
wire dp;
//module top_module(
//	input clk,
//	input BUTTON_RESET,
//	input BUTTON_SIGNAL,
//	output [2:0] Enable,
//	output [7:0] SevenSegment
 //   );
top_module #(.DBC_N(2), .SLOW_CLK_N(100)) uut(.clk(clk), .BUTTON_RESET(RESET), .BUTTON_SIGNAL(IN), .Enable(ANODES), .SevenSegment({LEDS,dp}));

initial begin
	clk = 1'b0;
	forever #2 clk = ~clk;
end

initial begin
	RESET = 1'b1;
#50
	RESET = 1'b0;
#50
	IN = 1'b1;
#300
	IN = 1'b0;
#300
	IN = 1'b1;
#300
	IN = 1'b0;
#300
	IN = 1'b1;
#300
	IN = 1'b0;
#300
	IN = 1'b1;
#300
	IN = 1'b0;
#300
	IN = 1'b1;
#300
	IN = 1'b0;
#300
	IN = 1'b1;
#300
	IN = 1'b0;
#300
	IN = 1'b1;
#300
	IN = 1'b0;
#300
	IN = 1'b1;
#300
	IN = 1'b0;
#300
	IN = 1'b1;
#300
	IN = 1'b0;
#300
	IN = 1'b1;
#300
	IN = 1'b0;	
#1000
	$finish();
end

reg [7:0] ch;
always@(*) begin
	ch = symbol(LEDS);
end

function [7:0] symbol (
	input [6:0] in
	);
	begin
		case(in)
			~7'h3F: symbol = "0";
			~7'h06: symbol = "1";
			~7'h5B: symbol = "2";
			~7'h4F: symbol = "3";
			~7'h66: symbol = "4";
			~7'h6D: symbol = "5";
			~7'h7D: symbol = "6";
			~7'h07: symbol = "7";
			~7'h7F: symbol = "8";
			~7'h67: symbol = "9";
		endcase
	end
endfunction

endmodule
