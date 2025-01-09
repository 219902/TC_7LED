`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 04:29:14 PM
// Design Name: 
// Module Name: tb_rising_edge_counter
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


module tb_rising_edge_counter();


reg clk;
reg IN = 1'b1;
reg RESET = 1'b1;
wire [3:0] OUT_0;
wire [3:0] OUT_1;
wire [3:0] OUT_2;
wire [3:0] OUT_3;
wire [15:0] OUT;

assign { OUT_3, OUT_2, OUT_1, OUT_0 } = OUT;
//module rising_edge_counter(input clk, input in, input reset, output reg [15:0] out);
rising_edge_counter uut(.clk(clk), .in(IN), .reset(RESET), .out(OUT));

initial begin
	clk = 1'b0;
	forever #5 clk = !clk;
end

initial begin
	RESET = 1'b1;
	IN = 1'b0;
#50
	RESET = 1'b0;
	
#100
	IN = 1'b1;
#50
	IN = 1'b0;

#100
	IN = 1'b1;
#100
	IN = 1'b0;	

#100
	IN = 1'b1;
#100
	IN = 1'b0;	

#100
	IN = 1'b1;
#100
	IN = 1'b0;	

#100
	IN = 1'b1;
#100
	IN = 1'b0;	

#100
	IN = 1'b1;
#100
	IN = 1'b0;	

#100
	IN = 1'b1;
#100
	IN = 1'b0;	

#100
	IN = 1'b1;
#100
	IN = 1'b0;	

#100
	IN = 1'b1;
#100
	IN = 1'b0;	

#100
	IN = 1'b1;
#100
	IN = 1'b0;	

#100
	IN = 1'b1;
#100
	IN = 1'b0;	

#100
	IN = 1'b1;
#100
	IN = 1'b0;	

#100
	IN = 1'b1;
#100
	IN = 1'b0;	

#100
	IN = 1'b1;
#100
	RESET = 1'b1;
	IN = 1'b0;

#100
	IN = 1'b1;
#100
	IN = 1'b0;	

#50
	$finish();	
end

endmodule
