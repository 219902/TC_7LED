`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:53:00 11/09/2024 
// Design Name: 
// Module Name:    Debouncer 
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
module debouncer
(
	input clk,
	input raw_button,
	output reg button_state = 1'b0,
	output button_down,
	output button_up
);

parameter N = 14;

reg button_sync_0;
always @(posedge clk)
	begin
		button_sync_0 <= raw_button;
	end

reg button_sync_1;
always @(posedge clk)
	begin
		button_sync_1 <= button_sync_0;
	end
	
reg [N-1:0] button_counter = {N{1'b0}};

wire button_idle;
assign button_idle = ~(button_state ^ button_sync_1);
wire button_counter_max ;
assign button_counter_max = &button_counter;

always @(posedge clk)
	begin
		if(button_idle)
			button_counter <= {N{1'b0}};
		else
			begin
				button_counter <= button_counter + 1'b1;
				if(button_counter_max)
					button_state <= ~button_state;
			end
	end

assign button_down = ~button_idle & button_counter_max & ~button_state;
assign button_up = ~button_idle & button_counter_max & button_state;

endmodule
