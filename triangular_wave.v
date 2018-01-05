`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:32:43 07/14/2017 
// Design Name: 
// Module Name:    sawtooth_gen 
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
module triangular_wave(dac_clk, dac_data);
input dac_clk;
output [9:0] dac_data;
reg [9:0] dac_data;

//16 bits free-running binary counter
reg [15:0] cnt;

always @(posedge dac_clk)
begin
 cnt <= cnt + 16'h1;

dac_data = cnt[10] ? ~cnt[9:0] : cnt[9:0];

end
endmodule
