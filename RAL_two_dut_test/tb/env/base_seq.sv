class base_seq extends uvm_sequence#(seq_item);
  seq_item req;
  `uvm_object_utils(base_seq)

  
  function new (string name = "base_seq");
    super.new(name);
  endfunction

  task body();
    `uvm_info(get_type_name(), "Base seq: Inside Body", UVM_LOW);
    `uvm_do(req);
  endtask
endclass

class reg_seq extends uvm_sequence#(seq_item);
  seq_item req;
  RegModel_SFR reg_model;
  seqcr seqr;
  uvm_status_e   status;
  uvm_reg_data_t read_data;
  `uvm_object_utils(reg_seq)
  `uvm_declare_p_sequencer(seqcr)
   env env_o;
  
  function new (string name = "reg_seq");
    super.new(name);
  endfunction

  task body();
    `uvm_info(get_type_name(), "Reg seq: Inside Body", UVM_LOW);
    if(!uvm_config_db#(RegModel_SFR) :: get(null, "", "reg_model", reg_model))
      `uvm_fatal(get_type_name(), "reg_model is not set at top level");

      //uvm_config_db#(env) :: get(null, "","envv",env_o);

    
    //ral_model.control_reg.write(status, 32'h1234_1234,.map(ral_model.map1));
    
    //in other sequnce
    //ral_model.control_reg.write(status, 32'h1234_1234,.map(ral_model.map2))
    //;
     //reg_model.mod_reg.control_reg.set_frontdoor( .ftdr(env_o.fd1) ,.map(reg_model.axi_map));  
     //reg_model.mod_reg.control_reg.write(status ,32'hcccc_cccc);

     // reg_model.mod_reg.control_reg.set_frontdoor( .ftdr(p_sequencer.env.fd2),.map(reg_model.axi_map));  
    //reg_model.mod_reg.control_reg.write(status, 32'hbbbb_bbbb);

    
    reg_model.mod_reg.control_reg.write(status, 32'hcccc_cccc);
    reg_model.mod_reg.control_reg.read(status, read_data);
    
    reg_model.mod_reg.intr_msk_reg.write(status, 32'hbbbb_bbbb);
    reg_model.mod_reg.intr_msk_reg.read(status, read_data);
     
    reg_model.mod_reg.debug_reg.write(status, 32'hAAAA_AAAA);
    reg_model.mod_reg.debug_reg.read(status, read_data);
  endtask
endclass
