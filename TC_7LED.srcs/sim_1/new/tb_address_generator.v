`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 07:04:29 PM
// Design Name: 
// Module Name: tb_address_generator
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


module tb_address_generator();

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
#100
	$finish();
end

endmodule
