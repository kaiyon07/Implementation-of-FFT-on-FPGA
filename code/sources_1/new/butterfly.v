//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module butterfly #(
   parameter NBITS = 16
)(
   input wire                    clk,
   input wire signed [NBITS-1:0] Ar,
   input wire signed [NBITS-1:0] Ai,
   input wire signed [NBITS-1:0] Br,
   input wire signed [NBITS-1:0] Bi,
   input wire signed [NBITS-1:0] Wr,
   input wire signed [NBITS-1:0] Wi,
   output reg signed [NBITS-1:0] Xr_F,
   output reg signed [NBITS-1:0] Xi_F,
   output reg signed [NBITS-1:0] Yr_F,
   output reg signed [NBITS-1:0] Yi_F
);


   
   reg signed [NBITS-1:0] Ar_F;
   reg signed [NBITS-1:0] Ai_F;
   reg signed [NBITS-1:0] Br_F;
   reg signed [NBITS-1:0] Bi_F;
   reg signed [NBITS-1:0] Wr_F;
   reg signed [NBITS-1:0] Wi_F;

   
   reg signed [NBITS-1:0] Ar_Fd2;
   reg signed [NBITS-1:0] Ai_Fd2;
   
   reg signed [NBITS*2-3:0] Zra_F;
   reg signed [NBITS*2-3:0] Zrb_F;
   reg signed [NBITS*2-3:0] Zia_F;
   reg signed [NBITS*2-3:0] Zib_F;

   
   reg signed [NBITS*2-2:0] Zrsub;
   reg signed [NBITS*2-2:0] Ziadd;

   
   reg signed [NBITS*2-1:0] Xr_full_F;
   reg signed [NBITS*2-1:0] Xi_full_F;
   reg signed [NBITS*2-1:0] Yr_full_F;
   reg signed [NBITS*2-1:0] Yi_full_F;

   
   always @(*) begin

      Zrsub = ({Zra_F[29], Zra_F} - {Zrb_F[29], Zrb_F});
      Ziadd = ({Zia_F[29], Zia_F} + {Zib_F[29], Zib_F});

   end

   always @(posedge clk) begin

      Ar_F <= Ar;
      Ai_F <= Ai;
      Br_F <= Br;
      Bi_F <= Bi;
      Wr_F <= Wr;
      Wi_F <= Wi;

      Ar_Fd2 <= Ar_F;
      Ai_Fd2 <= Ai_F;

      Zra_F <= (Br_F * Wr_F) >>> 2;
      Zrb_F <= (Bi_F * Wi_F) >>> 2;
      Zia_F <= (Br_F * Wi_F) >>> 2;
      Zib_F <= (Bi_F * Wr_F) >>> 2;

      Xr_full_F <= { {4{Ar_Fd2[15]}}, Ar_Fd2, {12{1'b0}} } + {Zrsub[30], Zrsub};
      Xi_full_F <= { {4{Ai_Fd2[15]}}, Ai_Fd2, {12{1'b0}} } + {Ziadd[30], Ziadd};
      Yr_full_F <= { {4{Ar_Fd2[15]}}, Ar_Fd2, {12{1'b0}} } - {Zrsub[30], Zrsub};
      Yi_full_F <= { {4{Ai_Fd2[15]}}, Ai_Fd2, {12{1'b0}} } - {Ziadd[30], Ziadd};

      Xr_F <= saturate(Xr_full_F)<<<1;
      Xi_F <= saturate(Xi_full_F)<<<1;
      Yr_F <= saturate(Yr_full_F)<<<1;
      Yi_F <= saturate(Yi_full_F)<<<1;

   end


   function signed [15:0] saturate(
      input signed [31:0] value
   );

      if (value > $signed(32'h7fff0000))
         saturate = 16'h7fff;

      else if (value < $signed(32'h80000000))
         saturate = 16'h8000;

      else
         saturate = value[28:13];

   endfunction

endmodule