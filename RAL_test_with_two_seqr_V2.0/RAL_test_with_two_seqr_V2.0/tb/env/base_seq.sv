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

typedef env env_o;

class reg_seq #(type T = env_o) extends uvm_reg_sequence #(uvm_sequence #(seq_item));  
  seq_item req;
  RegModel_SFR reg_model;
  seqcr seqr;
  uvm_status_e   status;
  uvm_reg_data_t read_data;
  `uvm_object_utils(reg_seq)
  `uvm_declare_p_sequencer(seqcr)
   T env_h;
  
  function new (string name = "reg_seq");
    super.new(name);
  endfunction

  function void seqr_type(string seqr_no); 
	  if(seqr_no == "seqr1") begin
	     env_h.reg_model.default_map.set_sequencer( .sequencer(env_h.agt.seqr), .adapter(env_h.adapter) );
          end
	  if(seqr_no == "seqr2") begin
	     env_h.reg_model.default_map.set_sequencer( .sequencer(env_h.agt1.seqr), .adapter(env_h.adapter1) );
          end
  endfunction

  task body();
    `uvm_info(get_type_name(), "Reg seq: Inside Body", UVM_LOW);
       
    if(!uvm_config_db#(RegModel_SFR) :: get(null, "", "reg_model", reg_model))
       `uvm_fatal(get_type_name(), "reg_model is not set at top level");
    
       seqr_type("seqr1");reg_model.mod_reg.control_reg.write(status ,32'h1111_1111);       
       seqr_type("seqr1");reg_model.mod_reg.intr_sts_reg.write(status ,32'h2222_2222);      
       seqr_type("seqr1");reg_model.mod_reg.intr_msk_reg.write(status ,32'h3333_3333);       
       seqr_type("seqr1");reg_model.mod_reg.debug_reg.write(status ,32'h4444_4444);

     /*  seqr_type("seqr1");reg_model.mod_reg.control_reg.read(status ,read_data);  
       seqr_type("seqr1");reg_model.mod_reg.intr_sts_reg.read(status ,read_data);      
       seqr_type("seqr1");reg_model.mod_reg.intr_msk_reg.read(status ,read_data);       
       seqr_type("seqr1");reg_model.mod_reg.debug_reg.read(status ,read_data);
     */
       seqr_type("seqr2");reg_model.mod_reg.control_reg.write(status ,32'hb111_1111);       
       seqr_type("seqr2");reg_model.mod_reg.intr_sts_reg.write(status ,32'hb222_2222);      
       seqr_type("seqr2");reg_model.mod_reg.intr_msk_reg.write(status ,32'hb333_3333);       
       seqr_type("seqr2");reg_model.mod_reg.debug_reg.write(status ,32'hb444_4444);
     /*
       seqr_type("seqr2");reg_model.mod_reg.control_reg.read(status ,read_data);       
       seqr_type("seqr2");reg_model.mod_reg.intr_sts_reg.read(status ,read_data);      
       seqr_type("seqr2");reg_model.mod_reg.intr_msk_reg.read(status ,read_data);       
       seqr_type("seqr2");reg_model.mod_reg.debug_reg.read(status ,read_data);
     */  
       //t2();read_data = reg_model.mod_reg.debug_reg.get();
       //$display("t2 reg_model.mod_reg.debug_reg.get() = %0h",read_data);
  endtask
endclass
