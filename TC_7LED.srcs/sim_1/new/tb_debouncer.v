`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 08:33:09 PM
// Design Name: 
// Module Name: tb_top_module
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


module tb_debouncer();

reg clk;
reg BUTTON_RESET;
wire down;
wire up;
wire reset;
//module debouncer(input clk, input raw_button,	output reg button_state, output button_down, output button_up);
debouncer #(.N(2)) uut(.clk(clk), .raw_button(BUTTON_RESET), .button_state(IN), .button_down(down), .button_up(up));

initial begin
	clk = 1'b0;
	forever #2 clk = ~clk;
end

initial begin
	BUTTON_RESET = 1'b0;
#40
	BUTTON_RESET = 1'b1;
#40
	BUTTON_RESET = 1'b0;
#40
	BUTTON_RESET = 1'b1;
#40
	BUTTON_RESET = 1'b0;
#40
	BUTTON_RESET = 1'b1;
#40
	BUTTON_RESET = 1'b0;
#40
	BUTTON_RESET = 1'b1;
#40
	BUTTON_RESET = 1'b0;
#40
	BUTTON_RESET = 1'b1;
#40
	BUTTON_RESET = 1'b0;
#200
	$finish();
end
endmodule
