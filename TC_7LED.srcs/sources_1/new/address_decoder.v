`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 08:07:50 PM
// Design Name: 
// Module Name: address_decoder
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


module address_decoder(
	input [1:0] address,
	output [3:0] anodes
    );
    
    assign anodes[0] = ~address[1] & ~address[0];
    assign anodes[1] = ~address[1] & address[0];
    assign anodes[2] = address[1] & ~address[0];
    assign anodes[3] = address[1] & address[0];
    
endmodule
