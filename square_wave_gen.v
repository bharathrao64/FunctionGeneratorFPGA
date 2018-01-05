`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:29:23 07/14/2017 
// Design Name: 
// Module Name:    square_wave_gen 
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
module square_wave_gen(DAC_clk, DAC_data);
input DAC_clk;
output [9:0] DAC_data;
reg [9:0] DAC_data;

//16 bits free-running binary counter
reg [15:0] cnt;
reg cnt_tap;

always @(posedge DAC_clk)
begin
 cnt <= cnt + 16'h1;

// and use it to generate the DAC signal output
cnt_tap <= cnt[7];     // we take one bit out of the counter (here bit 7 = the 8th bit)
DAC_data <= {10{cnt_tap}};   // and we duplicate it 10 times to create the 10-bits DAC value 
                                     // with the maximum possible amplitude
end
endmodule
