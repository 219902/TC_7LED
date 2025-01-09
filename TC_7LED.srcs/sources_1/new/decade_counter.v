`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 02:44:32 PM
// Design Name: 
// Module Name: decade_counter
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


module decade_counter(
	input clk,
	input load,
	input enable,
	input [3:0] data,
	output reg [3:0] q
    );
    
    always@(posedge clk) begin
    	if(load)
    		q <= data;
    	else if(enable) begin
    		q <= q + 4'd1;
    		if(q == 4'd9)
    			q <= 0;
    	end
    end
    	
endmodule
