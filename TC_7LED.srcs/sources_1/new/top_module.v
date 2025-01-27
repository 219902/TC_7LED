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
	input BUTTON_RESET,
	input BUTTON_SIGNAL,
	input SIGNAL,
	output [2:0] Enable,
	output [7:0] SevenSegment,
	output [7:0] LED
    );
parameter DBC_N = 14;
parameter SLOW_CLK_N = 12000;
wire reset;
wire in;
wire [6:0] leds;
wire [3:0] anodes;
wire div_clk;
wire [1:0] address;
wire [15:0] bcd_digits;
wire [3:0] thousands;
wire [3:0] hundreds;
wire [3:0] tens;
wire [3:0] units;
wire [3:0] single_bcd_digit;
wire signal_btn_state;

assign units = bcd_digits[3:0];
assign tens = bcd_digits[7:4];
assign hundreds = bcd_digits[11:8];
assign thousands = bcd_digits[15:12];

assign LED = {in, 6'b000000, SIGNAL};
assign Enable = ~anodes[2:0];
//assign SevenSegment = {1'b1, 1'b1, ~leds[6:0]};
assign SevenSegment = {leds, 1'b1};
assign in = signal_btn_state | SIGNAL;

//module debouncer(input clk, input raw_button, output reg button_state, output button_down, output button_up);
debouncer #(.N(DBC_N)) d_unit_reset(.clk(clk), .raw_button(BUTTON_RESET), .button_down(reset));
debouncer #(.N(DBC_N)) d_unit_in(.clk(clk), .raw_button(BUTTON_SIGNAL), .button_state(signal_btn_state));

//module clock_divider(input clk, input reset, output out);
clock_divider #(.DIVISOR(SLOW_CLK_N)) cd_unit_0(.clk(clk), .reset(reset), .out(div_clk));

//module address_generator(input clk, input reset, input enable, output reg [1:0] q);
address_generator #(.SEGMENTS(3)) ag_unit_0(.clk(clk), .reset(reset), .enable(div_clk), .q(address));

//module address_decoder(input [1:0] address, output [3:0] anodes);
address_decoder ad_unit_0(.address(address), .anodes(anodes));

//module rising_edge_counter(input clk, input in, input reset, output [15:0] out);
rising_edge_counter rec_unit_0(.clk(clk), .in(in), .reset(reset), .out(bcd_digits));

//module digit_selector(input [1:0] address, input [3:0] thousands,	input [3:0] hundreds, input [3:0] tens,	input [3:0] units, output reg [3:0] digit);
digit_selector ds_unit_0(.anodes(anodes), .thousands(thousands), .hundreds(hundreds), .tens(tens), .units(units), .digit(single_bcd_digit));

//module digit_to_led_transcoder(input [3:0] digit,	output reg [6:0] leds // [gfed_cba]);
digit_to_led_transcoder dtlt_unit_0(.clk(clk), .digit(single_bcd_digit), .leds(leds));

endmodule
