module top;
   import uvm_pkg::*;
`include "uvm_macros.svh"

   import   counter_pkg::*;
//`include "counter_macros.svh"

   counter_bfm       bfm();
   counter DUT (.clk_in(bfm.clk_in), .nrst_in(bfm.nrst_in),
                .en_ctrl_in(bfm.en_ctrl_in), .set_ctrl_in(bfm.set_ctrl_in), .up_ctrl_in(bfm.up_ctrl_in),
                .counter_in(bfm.counter_in), .ovf_out(bfm.ovf_out), .counter_out(bfm.counter_out));

initial begin
  uvm_config_db #(virtual counter_bfm)::set(null, "*", "bfm", bfm);
  run_test();
end

endmodule : top
