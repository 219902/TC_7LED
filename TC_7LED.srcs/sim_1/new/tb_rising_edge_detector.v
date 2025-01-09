`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 04:08:07 PM
// Design Name: 
// Module Name: tb_rising_edge_detector
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


module tb_rising_edge_detector();


reg clk;
reg IN = 1'b1;
wire OUT;

//module rising_edge_detector(input clk, input in, output out);
rising_edge_detector uut(.clk(clk), .in(IN), .out(OUT));

initial begin
	clk = 1'b0;
	forever #5 clk = !clk;
end

initial begin
	IN = 1'b0;
#50
	IN = 1'b1;
#50
	IN = 1'b0;
#50
	$finish();	
end

endmodule
