`ifndef MY_DRIVER__SV
`define MY_DRIVER__SV
`include "uvm_macros.svh"
`include "uvm_pkg.sv"
import uvm_pkg::*;
class my_driver extends uvm_driver;

   `uvm_component_utils(my_driver)
   function new(string name = "my_driver", uvm_component parent = null);
      super.new(name, parent);
      `uvm_info("my_driver", "new is called", UVM_LOW);
   endfunction
   extern virtual task main_phase(uvm_phase phase);
endclass

task my_driver::main_phase(uvm_phase phase);
   `uvm_info("my_driver", "main_phase is called", UVM_LOW);
   top_tb.rxd <= 8'b0; 
   top_tb.rx_dv <= 1'b0;
   while(!top_tb.rst_n)
      @(posedge top_tb.clk);
   for(int i = 0; i < 256; i++)begin
      @(posedge top_tb.clk);
      top_tb.rxd <= $urandom_range(0, 255);
      top_tb.rx_dv <= 1'b1;
      `uvm_info("my_driver", "data is drived", UVM_LOW);
   end
   @(posedge top_tb.clk);
   top_tb.rx_dv <= 1'b0;
endtask
`endif
