`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 02:37:49 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
	input clk,
	input reset,
	input in,
	output [3:0] anodes,
	output [6:0] leds
    );
    
    
wire div_clk;
//module clock_divider(input clk, input reset, output out);
clock_divider cd_unit_0(.clk(clk), .reset(reset), .out(div_clk));

wire [1:0] address;
//module address_generator(input clk, input reset, input enable, output reg [1:0] q);
address_generator ag_unit_0(.clk(clk), .reset(reset), .enable(div_clk), .q(address));

//module address_decoder(input [1:0] address, output [3:0] anodes);
address_decoder ad_unit_0(.address(address), .anodes(anodes));

wire [15:0] bcd_digits;
//module rising_edge_counter(input clk, input in, input reset, output [15:0] out);
rising_edge_counter rec_unit_0(.clk(clk), .in(in), .reset(reset), .out(bcd_digits));

wire [3:0] thousands;
wire [3:0] hundreds;
wire [3:0] tens;
wire [3:0] units;

assign units = bcd_digits[3:0];
assign tens = bcd_digits[7:4];
assign hundreds = bcd_digits[11:8];
assign thousands = bcd_digits[15:12];

wire [3:0] single_bcd_digit;
//module digit_selector(input [1:0] address, input [3:0] thousands,	input [3:0] hundreds, input [3:0] tens,	input [3:0] units, output reg [3:0] digit);
digit_selector ds_unit_0(.address(address), .thousands(thousands), .hundreds(hundreds), .tens(tens), .units(units), .digit(single_bcd_digit));


//module digit_to_led_transcoder(input [3:0] digit,	output reg [6:0] leds // [gfed_cba]);
digit_to_led_transcoder dtlt_unit_0(.digit(single_bcd_digit), .leds(leds));

endmodule
