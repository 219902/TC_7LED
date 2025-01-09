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
	output out
    );
    
reg [31:00] counter = 32'd0;
parameter DIVISOR = 32'd2;

assign out = (counter >= (DIVISOR / 2));

always@(posedge clk) begin
	if(reset)
		counter <= 32'd0;
	else 
		begin
			counter <= counter + 32'd1;
			if(counter >= (DIVISOR - 1))
				counter <= 32'd0;
			
		end
	end
	
	
endmodule
