virtual class uvm_reg_frontdoor extends uvm_reg_sequence #(uvm_sequence #(seq_item));
   uvm_reg_item rw_info;
   uvm_sequencer_base sequencer;
   function new(string name="");
      super.new(name);
   endfunction
   string fname;
   int lineno;
endclass: uvm_reg_frontdoor

class my_fd_1 extends uvm_reg_frontdoor;
  function new (string name = "my_fd_1");
    super.new(name);
  endfunction : new
  `uvm_object_utils(my_fd_1)
endclass : my_fd_1

class my_fd_2 extends uvm_reg_frontdoor;
  function new (string name = "my_fd_2");
    super.new(name);
  endfunction : new
  `uvm_object_utils(my_fd_2)
endclass : my_fd_2



class env extends uvm_env;
  `uvm_component_utils(env)
  agent agt,agt1;
  reg_axi_adapter adapter , adapter1;
  RegModel_SFR reg_model;

  my_fd_1 fd1; 
  my_fd_2 fd2;
  function new(string name = "env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = agent::type_id::create("agt", this);
    agt1 = agent::type_id::create("agt1", this);
    adapter = reg_axi_adapter::type_id::create("adapter");
    adapter1 = reg_axi_adapter::type_id::create("adapter1");

    fd1 = my_fd_1 :: type_id :: create("fd1",this);
    fd2 = my_fd_2 :: type_id :: create("fd2",this);

    reg_model = RegModel_SFR::type_id::create("reg_model");
    reg_model.build();
    reg_model.reset();
    reg_model.lock_model();
    reg_model.print();

    uvm_config_db#(RegModel_SFR)::set(uvm_root::get(), "*", "reg_model", reg_model);
    $display("%m is my  uvm root result",uvm_root::get());
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);

           // assign adapter to frontdoor
   // fd1.adapter = adapter;
   // fd2.adapter = adapter1;

    //fd1.sequencer = agt.seqr;
    //fd2.sequencer = agt1.seqr;

    // reg_model.default_map.set_sequencer( .sequencer(agt.seqr), .adapter(adapter1) );
    // reg_model.default_map.set_sequencer( .sequencer(agt1.seqr), .adapter(adapter) );
    
    reg_model.default_map.set_base_addr('h0); 

    //testing-->
    // reg_model.map_1.set_sequencer( .sequencer[0](agt[0].seqr), .adapter[0](agt[0].adapter) );
    // reg_model.map_2.set_sequencer( .sequencer[1](agt[1].seqr), .adapter[1](agt[1].adapter) );

    //regmodel.add_hdl_path("tb_top.DUT");
  endfunction
endclass
