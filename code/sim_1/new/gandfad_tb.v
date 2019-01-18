`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2018 01:40:01
// Design Name: 
// Module Name: gandfad_tb
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


module gandfad_tb();
reg clk;
reg [31:0] a0,a1,a2,a3,a4,a5,a6,a7;
wire [31:0] b0,b1,b2,b3,b4,b5,b6,b7;
main dut(clk,a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7);
initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
#50
a0=32'b00000001000000000000000000000000;
//a0={16'h2fff,16'h0000};
a1=0;
a2=0;
a3=0;
a4=0;
a5=0;
a6=0;
a7=0;
end
endmodule
