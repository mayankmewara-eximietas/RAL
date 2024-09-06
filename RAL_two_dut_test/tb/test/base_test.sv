//`include "package.sv"

 import uvm_pkg::*;
`include "uvm_macros.svh"

class base_test extends uvm_test;
  env env_o;
  `uvm_component_utils(base_test)
  
  function new(string name = "base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env_o = env::type_id::create("env_o", this);
    // env_0.agt.seqr.env_h = env_0;
    // env_0.agt1.seqr.env_h = env_0;
   // uvm_config_db#(env) :: set(this, "*","envv",env_o);


  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    test_imp();
    phase.drop_objection(this);
    `uvm_info(get_type_name, "End of testcase", UVM_LOW);
  endtask
  
  virtual task test_imp();
    base_seq bseq = base_seq::type_id::create("bseq");
        
    repeat(10) begin 
      #5; bseq.start(env_o.agt.seqr);
    end
  endtask
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
endclass

class reg_test extends base_test;
  `uvm_component_utils(reg_test)
  
  function new(string name = "reg_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  task test_imp();
    reg_seq rseq = reg_seq::type_id::create("rseq");
   
    env_o.reg_model.default_map.set_sequencer( .sequencer(env_o.agt.seqr), .adapter(env_o.adapter1) );
    rseq.start(env_o.agt.seqr);
    
    env_o.reg_model.default_map.set_sequencer( .sequencer(env_o.agt1.seqr), .adapter(env_o.adapter) );
    rseq.start(env_o.agt1.seqr);


  endtask
endclass
