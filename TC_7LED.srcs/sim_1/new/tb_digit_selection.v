`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:34 01/27/2025 
// Design Name: 
// Module Name:    tb_digit_selection 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module tb_digit_selection(
    );
reg clk;
reg RESET = 1'b0;
wire [1:0] Q;

wire [1:0] slow_enable;
wire [1:0] adrs_0;
wire [1:0] adrs_1;

//module clock_divider(input clk, input reset, output out);
clock_divider #(.DIVISOR(12'd2)) clock_divider_0(.clk(clk), .reset(RESET), .out(slow_enable[0]));
clock_divider #(.DIVISOR(12'd600000)) clock_divider_1(.clk(clk), .reset(RESET), .out(slow_enable[1]));

//module address_generator(input clk, input reset, input enable, output reg [1:0] q);
address_generator address_generator_0 (.clk(clk), .reset(RESET), .enable(slow_enable[0]), .q(adrs_0));
address_generator address_generator_1 (.clk(clk), .reset(RESET), .enable(slow_enable[1]), .q(adrs_1));

wire [3:0] anodes_0;
wire [3:0] anodes_1;
//module address_decoder(input [1:0] address, output [3:0] anodes);
address_decoder address_decoder_0 (.address(adrs_0), .anodes(anodes_0));
address_decoder address_decoder_1 (.address(adrs_1), .anodes(anodes_1));

reg [3:0] UNITS = 4'd3;
reg [3:0] TENS = 4'd5;
reg [3:0] HUNDREDS = 4'd7;
reg [3:0] THOUSANDS = 4'd9;
wire [3:0] DIGIT_0;
wire [3:0] DIGIT_1;
//module digit_selector(input [1:0] address, input [3:0] thousands,	input [3:0] hundreds, input [3:0] tens,	input [3:0] units, output reg [3:0] digit);
digit_selector digit_selector_0 (.anodes(anodes_0), .thousands(THOUSANDS), .hundreds(HUNDREDS), .tens(TENS), .units(UNITS), .digit(DIGIT_0));
digit_selector digit_selector_1 (.anodes(anodes_1), .thousands(THOUSANDS), .hundreds(HUNDREDS), .tens(TENS), .units(UNITS), .digit(DIGIT_1));


initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

initial begin
	RESET = 1'b1;
#30
	RESET = 1'b0;
#100
	RESET = 1'b1;
#30
	RESET = 1'b0;

end

endmodule
