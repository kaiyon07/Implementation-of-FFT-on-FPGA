`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.11.2018 22:54:22
// Design Name: 
// Module Name: main
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


module main(clk,a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7);
input clk;
input [31:0] a0,a1,a2,a3,a4,a5,a6,a7;
output [31:0] b0,b1,b2,b3,b4,b5,b6,b7;
wire [31:0] w0,w1,w2,w3;

assign w0 = {16'b0100000000000000, 16'b0000000000000000};
assign w1 = {16'b0010110101000001, 16'b1101001010111111};
assign w2 = {16'b0000000000000000, 16'b1100000000000000};
assign w3 = {16'b1101001010111111, 16'b1101001010111111};

wire[31:0] stage1_0;
wire[31:0] stage1_1;
wire[31:0] stage1_2;
wire[31:0] stage1_3;
wire[31:0] stage1_4;
wire[31:0] stage1_5;
wire[31:0] stage1_6;
wire[31:0] stage1_7;
wire[31:0] stage2_0;
wire[31:0] stage2_1;
wire[31:0] stage2_2;
wire[31:0] stage2_3;
wire[31:0] stage2_4;
wire[31:0] stage2_5;
wire[31:0] stage2_6;
wire[31:0] stage2_7;


//stage 1

butterfly k0(clk,a0[31:16],a0[15:0],a4[31:16],a4[15:0],w0[31:16],w0[15:0],stage1_0[31:16],stage1_0[15:0],stage1_1[31:16],stage1_1[15:0]);
butterfly k1(clk,a2[31:16],a2[15:0],a6[31:16],a6[15:0],w0[31:16],w0[15:0],stage1_2[31:16],stage1_2[15:0],stage1_3[31:16],stage1_3[15:0]);
butterfly k2(clk,a1[31:16],a1[15:0],a5[31:16],a5[15:0],w0[31:16],w0[15:0],stage1_4[31:16],stage1_4[15:0],stage1_5[31:16],stage1_5[15:0]);
butterfly k3(clk,a3[31:16],a3[15:0],a7[31:16],a7[15:0],w0[31:16],w0[15:0],stage1_6[31:16],stage1_6[15:0],stage1_7[31:16],stage1_7[15:0]);
butterfly k4(clk,stage1_0[31:16],stage1_0[15:0],stage1_2[31:16],stage1_2[15:0],w0[31:16],w0[15:0],stage2_0[31:16],stage2_0[15:0],stage2_1[31:16],stage2_1[15:0]);
butterfly k5(clk,stage1_1[31:16],stage1_1[15:0],stage1_3[31:16],stage1_3[15:0],w2[31:16],w2[15:0],stage2_2[31:16],stage2_2[15:0],stage2_3[31:16],stage2_3[15:0]);
butterfly k6(clk,stage1_4[31:16],stage1_4[15:0],stage1_6[31:16],stage1_6[15:0],w0[31:16],w0[15:0],stage2_4[31:16],stage2_4[15:0],stage2_5[31:16],stage2_5[15:0]);
butterfly k7(clk,stage1_5[31:16],stage1_5[15:0],stage1_7[31:16],stage1_7[15:0],w2[31:16],w2[15:0],stage2_6[31:16],stage2_6[15:0],stage2_7[31:16],stage2_7[15:0]);
butterfly k8(clk,stage2_0[31:16],stage2_0[15:0],stage2_4[31:16],stage2_4[15:0],w0[31:16],w0[15:0],b0[31:16],b0[15:0],b4[31:16],b4[15:0]);
butterfly k9(clk,stage2_1[31:16],stage2_1[15:0],stage2_5[31:16],stage2_5[15:0],w1[31:16],w1[15:0],b1[31:16],b1[15:0],b5[31:16],b5[15:0]);
butterfly k10(clk,stage2_2[31:16],stage2_2[15:0],stage2_6[31:16],stage2_6[15:0],w2[31:16],w2[15:0],b2[31:16],b2[15:0],b6[31:16],b6[15:0]);
butterfly k11(clk,stage2_3[31:16],stage2_3[15:0],stage2_7[31:16],stage2_7[15:0],w3[31:16],w3[15:0],b3[31:16],b3[15:0],b7[31:16],b7[15:0]);

/*
butterfly k0(clk,a0[31:16],a0[15:0],a1[31:16],a1[15:0],w0[31:16],w0[15:0],stage1_0[31:16],stage1_0[15:0],stage1_1[31:16],stage1_1[15:0]);
butterfly k1(clk,a2[31:16],a2[15:0],a3[31:16],a3[15:0],w0[31:16],w0[15:0],stage1_2[31:16],stage1_2[15:0],stage1_3[31:16],stage1_3[15:0]);
butterfly k2(clk,a4[31:16],a4[15:0],a5[31:16],a5[15:0],w0[31:16],w0[15:0],stage1_4[31:16],stage1_4[15:0],stage1_5[31:16],stage1_5[15:0]);
butterfly k3(clk,a6[31:16],a6[15:0],a7[31:16],a7[15:0],w0[31:16],w0[15:0],stage1_6[31:16],stage1_6[15:0],stage1_7[31:16],stage1_7[15:0]);
butterfly k4(clk,stage1_0[31:16],stage1_0[15:0],stage1_2[31:16],stage1_2[15:0],w0[31:16],w0[15:0],stage2_0[31:16],stage2_0[15:0],stage2_1[31:16],stage2_1[15:0]);
butterfly k5(clk,stage1_1[31:16],stage1_1[15:0],stage1_3[31:16],stage1_3[15:0],w2[31:16],w2[15:0],stage2_2[31:16],stage2_2[15:0],stage2_3[31:16],stage2_3[15:0]);
butterfly k6(clk,stage1_4[31:16],stage1_4[15:0],stage1_6[31:16],stage1_6[15:0],w0[31:16],w0[15:0],stage2_4[31:16],stage2_4[15:0],stage2_5[31:16],stage2_5[15:0]);
butterfly k7(clk,stage1_5[31:16],stage1_5[15:0],stage1_7[31:16],stage1_7[15:0],w2[31:16],w2[15:0],stage2_6[31:16],stage2_6[15:0],stage2_7[31:16],stage2_7[15:0]);
butterfly k8(clk,stage2_0[31:16],stage2_0[15:0],stage2_4[31:16],stage2_4[15:0],w0[31:16],w0[15:0],b0[31:16],b0[15:0],b1[31:16],b1[15:0]);
butterfly k9(clk,stage2_1[31:16],stage2_1[15:0],stage2_5[31:16],stage2_5[15:0],w1[31:16],w1[15:0],b2[31:16],b2[15:0],b3[31:16],b3[15:0]);
butterfly k10(clk,stage2_2[31:16],stage2_2[15:0],stage2_6[31:16],stage2_6[15:0],w2[31:16],w2[15:0],b4[31:16],b4[15:0],b5[31:16],b5[15:0]);
butterfly k11(clk,stage2_3[31:16],stage2_3[15:0],stage2_7[31:16],stage2_7[15:0],w3[31:16],w3[15:0],b6[31:16],b6[15:0],b7[31:16],b7[15:0]);
*/



endmodule