`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 06:26:05 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
	input clk,
	input reset,
	output reg out
    );
    
reg [31:00] counter = 32'd0;
parameter DIVISOR = 32'd2;

always@(posedge clk) begin
	out <= 1'b0;
	if(reset)
		counter <= 32'd0;
	else 
		begin
			counter <= counter + 32'd1;
			if(counter == (DIVISOR - 1)) begin
				out <= 1'b1;
				counter <= 32'd0;
			end
			
		end
	end
	
	
endmodule
