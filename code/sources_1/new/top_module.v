`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2018 17:40:37
// Design Name: 
// Module Name: top_module
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


module top_module(clk,switch,reset,array);
input clk,switch,reset;
output reg [15:0] array=0 ; // =16'b0000000000000000;
reg [31:0] a0=32'b00000001000000000000000001100000;
reg [31:0] a1=32'b00000001110000000000000000000000,a2=0,a3=0,a4=0,a5=0,a6=0,a7=0;
wire [31:0] b0,b1,b2,b3,b4,b5,b6,b7;
//reg [3:0] counter = 4'b0000;
reg [27:0]new_clk;
wire del;
assign del=new_clk[27];

always@(posedge clk)
 new_clk<=new_clk+1;      
 
integer counter = -6;

main m0(del,a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7);

always@(posedge del)
if (reset)
begin
array = 16'b1111111111111111;
counter=-6;
end
else
begin
array= 0;
begin
    if (switch)
   
    begin
     counter = counter+1;
        case (counter)
            0 : begin
            array = b0[31:16];
            end
            1 : begin
            array = b0[15:0];
            end
            2 : begin
            array = b1[31:16];
            end
            3 : begin
            array = b1[15:0];
            end
            4 : begin
            array = b2[31:16];
            end
            5 : begin
            array = b2[15:0];
            end
            6 : begin
            array = b3[31:16];
            end
            7 : begin
            array = b3[15:0];
            end
            8 : begin
            array = b4[31:16];
            end
            9 : begin
            array = b4[15:0];
            end
            10 : begin
            array = b5[31:16];
            end
            11 : begin
            array = b5[15:0];
            end
            12 : begin
            array = b6[31:16];
            end
            13 : begin
            array = b6[15:0];
            end
            14 : begin
            array = b7[31:16];
            end
            15 : begin
            array = b7[15:0];
            end    

endcase
 $display("%0d", counter);
end
end


end

endmodule
