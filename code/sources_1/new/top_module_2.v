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


module top_module_2(clk,coe,switch,reset,array,a_to_g,an,dp);
input clk,switch,reset;
input [1:0]coe ;
output reg [15:0] array=0 ; // =16'b0000000000000000;
output [6:0] a_to_g;
output [3:0] an;
output wire dp ;
reg [31:0] a0=32'b00000001000000000000000000000000;
reg [31:0] a1=32'b00000001100000000000000000000000,a2=0,a3=0,a4=0,a5=0,a6=0,a7=0;
wire [31:0] b0,b1,b2,b3,b4,b5,b6,b7;
//reg [3:0] counter = 4'b0000;
reg [27:0]new_clk;
wire del;
assign del=new_clk[27];




always@(posedge clk)
 new_clk<=new_clk+1;      
 
integer counter = -2;
wire ena=1,wea=0;
reg [2:0]addra=3'b111;
wire dina=0;
wire [31:0] douta;

wire enb=1,web=0;
reg [2:0]addrb=3'b111;
wire dinb=0;
wire [31:0] doutb;


/*
blk_mem_gen_0 m5(
  .clka(clk),
  .ena(ena),
  .wea(wea),
  .addra(addra),
  .dina(dina),
  .douta(douta)
);*/
/*
blk_mem_gen_2 m6(
  .clka(clk),
  .ena(enb),
  .wea(web),
  .addra(addrb),
  .dina(dinb),
  .douta(doutb)
);
*/

/*
always@(posedge clk)
   begin
   
   //if (coe==2'b00)
    addra=addra+1;
   
  
   case (addra)
   0 : begin
       a0= douta; 
       end 
   1 : begin
           a1= douta; 
           end 
    2 : begin
           a2= douta; 
           end 
    3 : begin
           a3= douta; 
           end 
    4 : begin
           a4= douta; 
           end 
    5 : begin
           a5= douta; 
           end 
    6 : begin
           a6= douta; 
           end 
    7 : begin
           a7= douta; 
           end 

   
   endcase */
   /*
   else if(coe==2'b01)
   begin
   addrb=addrb+1;
   case (addrb)
   0 : begin
       a0= doutb; 
       end 
   1 : begin
           a1= doutb; 
           end 
    2 : begin
           a2= doutb; 
           end 
    3 : begin
           a3= doutb; 
           end 
    4 : begin
           a4= doutb; 
           end 
    5 : begin
           a5= doutb; 
           end 
    6 : begin
           a6= doutb; 
           end 
    7 : begin
           a7= doutb; 
           end 
endcase
end*/

//end



main m0(del,a0,a1,a2,a3,a4,a5,a6,a7,b0,b1,b2,b3,b4,b5,b6,b7);

always@(posedge del)
if (reset)
begin
array = 16'b1111111111111111;
counter=-3;
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
 //$display("%0d", counter);
end
end
//Seg_7_Display a1(array,clk,reset,a_to_g,an,dp)


end
Seg_7_Display a145(array,clk,reset,a_to_g,an,dp);
endmodule
