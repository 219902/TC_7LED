`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 03:16:52 PM
// Design Name: 
// Module Name: bcd_counter_16b
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


module bcd_counter_16b(
	input clk,
	input enable,
	input reset,
	output [15:0] out
    );

   wire [3:0] loads;
   wire [3:0] steps;
   
   assign steps[0] = out[0] & out[3] & enable;
   assign steps[1] = out[4] & out[7] & steps[0];
   assign steps[2] = out[8] & out[11] & steps[1];
   assign steps[3] = out[12] & out[15] & steps[2];
   
   assign loads[0] = reset |  steps[0];
   assign loads[1] = reset |  steps[1];
   assign loads[2] = reset |  steps[2];
   assign loads[3] = reset |  steps[3];
   
   //module decade_counter(input clk, input load, input enable, input [3:0] data,	output reg [3:0] q);
   decade_counter dc_0 (.clk(clk), .load(loads[0]), .enable(enable), .data(4'b0000), .q(out[3:0]));
   decade_counter dc_1 (.clk(clk), .load(loads[1]), .enable(steps[0]), .data(4'b0000), .q(out[7:4]));
   decade_counter dc_2 (.clk(clk), .load(loads[2]), .enable(steps[1]), .data(4'b0000), .q(out[11:8]));
   decade_counter dc_3 (.clk(clk), .load(loads[3]), .enable(steps[2]), .data(4'b0000), .q(out[15:12]));
   
endmodule
