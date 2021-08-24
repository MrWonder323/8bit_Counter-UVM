interface counter_bfm;
   import counter_pkg::*;

   byte         unsigned        counter_in;
   bit          clk_in;
   bit          nrst_in;
   bit          en_ctrl_in;
   bit          set_ctrl_in;
   bit          up_ctrl_in;
   wire         ovf_out;
   wire [7:0]   counter_out;
   /*operation_t  op_set;

   assign op = op_set;*/

   task reset_counter();
      nrst_in = 1'b0;
      @(negedge clk_in);
      @(negedge clk_in);
      nrst_in = 1'b1;
   endtask : reset_counter
   


   /*task send_op(input bit en_ctrl_in, input bit set_ctrl_in, input bit up_ctrl_in, input byte counter_in, ovf_out, counter_out);
      if (iop == rst_op) begin
         @(negedge clk);
         op_set = iop;
         @(posedge clk);
         reset_n = 1'b0;
         start = 1'b0;
         @(posedge clk);
         #1;
         reset_n = 1'b1;
      end else begin
         @(negedge clk);
         op_set = iop;
         A = iA;
         B = iB;
         start = 1'b1;
         if (iop == no_op) begin
            @(posedge clk);
            #1;
            start = 1'b0;           
         end else begin
            do
              @(negedge clk);
            while (done == 0);
            alu_result = result;
            start = 1'b0;
         end
      end // else: !if(iop == rst_op)
      
   endtask : send_op*/

   initial begin
      clk_in = 0;
      forever begin
         #10;
         clk_in = ~clk_in;
      end
   end


endinterface : counter_bfm