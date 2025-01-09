`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 08:16:48 PM
// Design Name: 
// Module Name: tb_address_decoder
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


module tb_address_decoder();

reg clk;
reg [1:0] ADDRESS;
wire [3:0] ANODES;
//module address_decoder(input [1:0] address, output [3:0] anodes);
address_decoder uut(.address(ADDRESS), .anodes(ANODES));

initial begin
	clk = 1'b0;
	forever #5 clk = ~clk;
end

initial begin
	ADDRESS = 2'b00;
#10
	ADDRESS = 2'b01;
#10
	ADDRESS = 2'b10;
#10
	ADDRESS = 2'b11;
#10
	$finish();
end

endmodule
