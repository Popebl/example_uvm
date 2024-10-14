`ifndef MY_SEQUENCE__SV
`define MY_SEQUENCE__SV

`include "uvm_macros.svh"
`include "uvm_pkg.sv"
import uvm_pkg::*;

class my_sequence extends uvm_sequence #(my_transaction);
   my_transaction m_trans;

   function new(string name= "my_sequence");
      super.new(name);
   endfunction

   virtual task body();
      repeat (10) begin
         `uvm_do(m_trans)
      end
      #1000;
   endtask

   `uvm_object_utils(my_sequence)
endclass
`endif
