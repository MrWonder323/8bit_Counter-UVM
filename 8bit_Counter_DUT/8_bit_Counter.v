module counter(
  input clk_in, nrst_in, 
  input en_ctrl_in, set_ctrl_in, up_ctrl_in,
  input [7:0] counter_in,
  output ovf_out,
  output [7:0] counter_out
  );
  
  reg ovf_reg;
  reg [7:0]counter_reg;
  
  assign ovf_out = ovf_reg;
  assign counter_out = counter_reg;
  
  always@(posedge clk_in, negedge nrst_in)
  begin
    if(!nrst_in)
      counter_reg <= 0;
    else
      begin
        if(en_ctrl_in)
          begin
            if(up_ctrl_in)
              counter_reg <= counter_reg + 1;
            else
              counter_reg <= counter_reg - 1;
          end
        else
          begin
            if(set_ctrl_in)
              counter_reg <= counter_in;
            else
              counter_reg <= counter_reg;
          end
        end
    end
    
  always@(*)
  begin
    if(counter_out == 8'hff)
      ovf_reg <= 1;
    else
      ovf_reg <= 0;
  end
endmodule
            
            
  
  
  
