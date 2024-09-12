//import uvm_pkg::*;
//`include "uvm_macros.svh"

`include "package.sv"
import pkg::*;

`include "interface.sv"
`include "base_test.sv"
`include "design.sv"

module tb_top;
  bit clk;
  bit reset_n;
  always #2 clk = ~clk;
  
  initial begin
    //clk = 0;
    reset_n = 0;
    #5; 
    reset_n = 1;
  end
  sfr_if vif(clk, reset_n);
  sfr_if vif1(clk, reset_n);
  //sfr_if vif1(clk, reset_n);
  
  design_sfr DUT(vif.clk, vif.reset_n, vif.i_wr_en, vif.i_rd_en, vif.i_waddr, vif.i_raddr, vif.i_wdata, vif.i_wstrobe, vif.o_rdata, vif.o_wready, vif.o_rvalid);
  //design_sfr DUT1(vif.clk, vif.reset_n, vif.i_wr_en, vif.i_rd_en, vif.i_waddr, vif.i_raddr, vif.i_wdata, vif.i_wstrobe, vif.o_rdata, vif.o_wready, vif.o_rvalid);
  
 design_sfr DUT1(vif1.clk, vif1.reset_n, vif1.i_wr_en, vif1.i_rd_en, vif1.i_waddr, vif1.i_raddr, vif1.i_wdata, vif1.i_wstrobe, vif1.o_rdata, vif1.o_wready, vif1.o_rvalid);
  
  initial begin
    // set interface in config_db
   // uvm_config_db#(virtual sfr_if)::set(null, "*", "vif", vif);
    uvm_config_db#(virtual sfr_if)::set(uvm_root::get(), "*agt*", "vif", vif);
    uvm_config_db#(virtual sfr_if)::set(uvm_root::get(), "*agt1*", "vif", vif1);
    $display("%m  is my display\n\n",uvm_root::get());
    //$display("%p  is my display\n",uvm_root::get());
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(0); //(0, tb_top);
  end
  initial begin
    run_test("reg_test");
    //#100;
    //$finish;
  end
endmodule
