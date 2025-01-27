`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:00:39 01/27/2025 
// Design Name: 
// Module Name:    tb_anodes_selection 
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
module tb_anodes_selection();
reg clk;
reg RESET = 1'b0;
wire [1:0] Q;

wire [1:0] slow_enable;
wire [1:0] adrs_0;
wire [1:0] adrs_1;

//module clock_divider(input clk, input reset, output out);
clock_divider #(.DIVISOR(12'd2)) clock_divider_0(.clk(clk), .reset(RESET), .out(slow_enable[0]));
clock_divider #(.DIVISOR(12'd4)) clock_divider_1(.clk(clk), .reset(RESET), .out(slow_enable[1]));

//module address_generator(input clk, input reset, input enable, output reg [1:0] q);
address_generator address_generator_0 (.clk(clk), .reset(RESET), .enable(slow_enable[0]), .q(adrs_0));
address_generator address_generator_1 (.clk(clk), .reset(RESET), .enable(slow_enable[1]), .q(adrs_1));

wire [3:0] anodes_0;
wire [3:0] anodes_1;
//module address_decoder(input [1:0] address, output [3:0] anodes);
address_decoder address_decoder_0 (.address(adrs_0), .anodes(anodes_0));
address_decoder address_decoder_1 (.address(adrs_1), .anodes(anodes_1));

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
#1000
	$finish();
end

endmodule

