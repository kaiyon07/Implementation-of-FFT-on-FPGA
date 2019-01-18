`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2018 18:06:22
// Design Name: 
// Module Name: top_tb
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


module top_tb();
reg clk,switch,reset;
wire [15:0] array;
top_module t1(clk,switch,reset,array);
initial begin
clk=0;
forever #5 clk =~clk;
end
initial begin
reset = 1;
switch = 0;
#22
reset = 0;
switch =1;
#22
switch = 0;
#22
switch =1;
#22
switch = 0;
#22
switch =1;
#22
switch = 0;
#22
switch =1;
#22
switch = 0;
#22
switch =1;
#22
switch = 0;
#22
switch =1;
#22
switch = 0;
#22
switch =1;
#22
switch = 0;
#22
switch =1;
#22
switch = 0;
#22
switch =1;
#22
switch = 0;
#22
switch =1;
#22
switch = 0;
#22
switch =1;
#22
switch = 0;
#22
switch =1;
#22
switch = 0;
#22
switch =1;
#22
switch = 0;
#22
switch =1;
#22
switch = 0;
#22
switch =1;
#22
switch = 0;
#22
switch =1;
#22
switch =0;


end



endmodule
