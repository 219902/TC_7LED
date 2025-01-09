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
reg ENABLE = 1'b1;
wire [1:0] Q;

//module address_generator(input clk, input reset, input enable, output reg [1:0] q);
address_generator uut (.clk(clk), .reset(RESET), .enable(ENABLE), .q(Q));

initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

initial begin
	RESET = 1'b1;
	ENABLE = 1'b0;
#30
	RESET = 1'b0;
#10
	ENABLE = 1'b1;
#100
	RESET = 1'b1;
#30
	RESET = 1'b0;
#100
	$finish();
end

endmodule
