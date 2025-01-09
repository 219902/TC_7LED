`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 04:24:39 PM
// Design Name: 
// Module Name: rising_edge_counter
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


module rising_edge_counter(
	input clk,
	input in,
	input reset,
	output [15:0] out
    );
    
    wire on_edge;
    //module rising_edge_detector(input clk, input in, output reg out);
    rising_edge_detector red_unit_0(.clk(clk), .in(in), .out(on_edge)); 
    //module bcd_counter_16b(input clk,	input enable, input reset, output [15:0] out);
    bcd_counter_16b ctr__unit_0(.clk(clk), .enable(on_edge), .reset(reset), .out(out));
    
    
endmodule
