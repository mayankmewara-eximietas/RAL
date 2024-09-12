class driver extends uvm_driver#(seq_item);
  virtual sfr_if vif;
  `uvm_component_utils(driver)
  static int i;
  int id;
  
  function new(string name = "driver", uvm_component parent = null);
    super.new(name, parent);
    i = i+1;
    id=i;
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual sfr_if) :: get(this, "", "vif", vif))
      `uvm_fatal(get_type_name(), "Not set at top level");
  endfunction
  
  task run_phase (uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);

      @(posedge vif.clk);
      vif.i_rd_en <= req.rd_or_wr;
      vif.i_wr_en <= !req.rd_or_wr;
      
      if(req.rd_or_wr) begin // Read Operation
        vif.i_raddr <= req.addr;
        wait(vif.o_rvalid)
        req.data = vif.o_rdata;        
        ps_display(req);
      end 

      else begin // Write Operation
        vif.i_waddr <= req.addr;
        vif.i_wdata <= req.data;
        wait(vif.o_wready);
        ps_display(req);
      end
      seq_item_port.item_done();
    end
  endtask
  
  function void ps_display( seq_item req);
     string report_str;
      report_str = $sformatf("\n\n --------------------------FROM_DRIVER(%0d)---------------------------\n",id);
      report_str = {report_str, $sformatf(" |%-69s|\n", "")};
      report_str = {report_str, $sformatf(" |    DATA     |     ADDR    |   RD or WR  |\n")};
      report_str = {report_str, $sformatf(" -----------------------------------------------------------------------\n")};
      report_str = {report_str, $sformatf(" |  %-10h  |  %-7h |  %-8h  |\n", req.data,req.addr,req.rd_or_wr)};
      report_str = {report_str, $sformatf(" -----------------------------------------------------------------------\n\n\n\n\n\n\n\n\n\n\n")};    
	  uvm_report_info("TEST", report_str, UVM_MEDIUM);
	endfunction
    
endclass
