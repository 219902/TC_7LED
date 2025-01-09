`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 05:52:51 PM
// Design Name: 
// Module Name: tb_digit_to_led_transcoder
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


module tb_digit_to_led_transcoder();

reg clk;
reg [3:0] DIGIT;
wire [6:0] LEDS;
reg [7:0] ch;

//module digit_to_led_transcoder(input [3:0] digit,	output reg [6:0] leds // [gfed_cba]);
digit_to_led_transcoder uut(.digit(DIGIT), .leds(LEDS));    

//always@(*)
//	for(integer i=0; i < 7; i++)
//		signals[i] = ~LEDS[8-i-1];
		
always@(*)
	case(LEDS)
		7'h3F: ch = "0";
		7'h06: ch = "1";
		7'h5B: ch = "2";
		7'h4F: ch = "3";
		7'h66: ch = "4";
		7'h6D: ch = "5";
		7'h7D: ch = "6";
		7'h07: ch = "7";
		7'h7F: ch = "8";
		7'h67: ch = "9";
	endcase
	
initial begin
	clk = 1'b0;
	forever #5 clk = !clk;
end

initial begin
	DIGIT = 4'd0;
#50
	DIGIT = 4'd1;
#50
	DIGIT = 4'd2;
#50
	DIGIT = 4'd3;
#50
	DIGIT = 4'd4;
#50
	DIGIT = 4'd5;
#50
	DIGIT = 4'd6;
#50
	DIGIT = 4'd7;
#50
	DIGIT = 4'd8;
#50
	DIGIT = 4'd9;
#50
	$finish();
end

endmodule

/*
function [7:0] symbol (
	input [6:0] in
	);
	begin
		case(in)
			default: symbol = "_";
		endcase
	end
endfunction
*/