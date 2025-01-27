`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 07:00:52 PM
// Design Name: 
// Module Name: address_generator
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


module address_generator(
	input clk,
	input reset,
	input enable,
	output reg [1:0] q
    );
	 
parameter SEGMENTS = 4;

always@(posedge clk, posedge reset) begin
    	if(reset)
    		q <= 2'b0;
    	else if(enable) begin
    		q <= q + 2'd1;
    		if(q == SEGMENTS)
    			q <= 2'b0;
    	end
    end
    	
endmodule
