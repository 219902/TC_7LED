`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2025 05:31:35 PM
// Design Name: 
// Module Name: digit_to_led_transcoder
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


module digit_to_led_transcoder(
	input [3:0] digit,
	output reg [6:0] leds // [gfed_cba]
    );
    
    always@(*)
    	case(digit)
    		4'd0: leds <= 7'b0111_111;
    		4'd1: leds <= 7'b0000_110;
    		4'd2: leds <= 7'b1011_011;
    		4'd3: leds <= 7'b1001_111;
    		4'd4: leds <= 7'b1100_110;
    		4'd5: leds <= 7'b1101_101;
    		4'd6: leds <= 7'b1111_101;
    		4'd7: leds <= 7'b0000_111;
    		4'd8: leds <= 7'b1111_111;
    		4'd9: leds <= 7'b1100_111;
    		default: leds <= 7'bxxxx_xxx;
    	endcase
endmodule
