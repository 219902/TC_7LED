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
reg SIGNAL;
reg BUTTON_SIGNAL = 1'b0;
wire [7:0] ANODES;
wire [6:0] LEDS;
wire dp;
//module top_module(
//	input clk,
//	input BUTTON_RESET,
//	input BUTTON_SIGNAL,
//	output [2:0] Enable,
//	output [7:0] SevenSegment
 //   );
top_module #(.DBC_N(2), .SLOW_CLK_N(10), .SEGMENTS(4)) uut(.clk(clk), .BUTTON_SIGNAL(BUTTON_SIGNAL), .BUTTON_RESET(RESET), .SIGNAL(SIGNAL), .an(ANODES), .seg(LEDS), .dp(dp));

initial begin
	clk = 1'b0;
	forever #2 clk = ~clk;
end

initial begin
	RESET = 1'b1;
#500
	RESET = 1'b0;
#50
	SIGNAL = 1'b1;
#300
	SIGNAL = 1'b0;
#300
	SIGNAL = 1'b1;
#300
	SIGNAL = 1'b0;
#300
	SIGNAL = 1'b1;
#300
	SIGNAL = 1'b0;
#300
	SIGNAL = 1'b1;
#300
	SIGNAL = 1'b0;
#300
	SIGNAL = 1'b1;
#300
	SIGNAL = 1'b0;
#300
	SIGNAL = 1'b1;
#300
	SIGNAL = 1'b0;
#300
	SIGNAL = 1'b1;
#300
	SIGNAL = 1'b0;
#300
	SIGNAL = 1'b1;
#300
	SIGNAL = 1'b0;
#300
	SIGNAL = 1'b1;
#300
	SIGNAL = 1'b0;
#300
	SIGNAL = 1'b1;
#300
	SIGNAL = 1'b0;	
#100
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
			7'h01: symbol = "0";
			7'h4F: symbol = "1";
			7'h12: symbol = "2";
			7'h06: symbol = "3";
			7'h4C: symbol = "4";
			7'h49: symbol = "5";
			7'h24: symbol = "6";
			7'h0F: symbol = "7";
			7'h00: symbol = "8";
			7'h04: symbol = "9";
		endcase
	end
endfunction

endmodule
