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
	input clk,
	input [3:0] digit,
	output reg [6:0] leds
    );

always @(posedge clk)
begin
//8'b1001_1111; - jedynka led
	case(digit)
		4'd0: leds <= 8'b0000_001;
		4'd1: leds <= 8'b1001_111;
		4'd2: leds <= 8'b0010_010;
		4'd3: leds <= 8'b0000_110;
		4'd4: leds <= 8'b1001_100;
		4'd5: leds <= 8'b0100_100;
		4'd6: leds <= 8'b0100_000;
		4'd7: leds <= 8'b0001_111;
		4'd8: leds <= 8'b0000_000;
		4'd9: leds <= 8'b0000_100;
		default: leds <= 8'b1111_111;
	endcase
end
endmodule
