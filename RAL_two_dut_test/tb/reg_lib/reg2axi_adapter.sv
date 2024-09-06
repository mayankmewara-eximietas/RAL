class reg_axi_adapter extends uvm_reg_adapter;
  `uvm_object_utils(reg_axi_adapter)
  
  function new(string name = "reg_axi_adapter");
    super.new(name);
  endfunction
  
  virtual function uvm_sequence_item reg2bus (const ref uvm_reg_bus_op rw);
    seq_item bus_item = seq_item::type_id::create("bus_item");
    bus_item.addr = rw.addr;
    bus_item.data = rw.data;
    bus_item.rd_or_wr = (rw.kind == UVM_READ) ? 1: 0;
    
    
    ps_display( bus_item);
    
    
    
    return bus_item;
  endfunction
  function void ps_display(seq_item bus_item);
     string report_str;
 
    report_str = $sformatf("\n\n --------------------------FROM_ADEPTER---------------------------\n");
      report_str = {report_str, $sformatf(" |%-69s|\n", "")};
    report_str = {report_str, $sformatf(" |    DATA    |    ADDR   |   RD or WR  |\n")};
      report_str = {report_str, $sformatf(" -----------------------------------------------------------------------\n")};
    report_str = {report_str, $sformatf(" | %-12h  |  %-7h |  %-8h  |\n", bus_item.data,bus_item.addr,bus_item.rd_or_wr)};
      report_str = {report_str, $sformatf(" -----------------------------------------------------------------------")};
   //   report_str = {report_str, $sformatf(" | %-12d | %-7d | %-8d |\n", $size(bus_item.data), $size(bus_item.addr), $size(bus_item.rd_or_wr))};
   
	  uvm_report_info("TEST", report_str, UVM_MEDIUM);
	endfunction
    
  
  virtual function void bus2reg (uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
    seq_item bus_pkt;
    if(!$cast(bus_pkt, bus_item))
      `uvm_fatal(get_type_name(), "Failed to cast bus_item transaction")

    rw.addr = bus_pkt.addr;
    rw.data = bus_pkt.data;
    rw.kind = (bus_pkt.rd_or_wr) ? UVM_READ: UVM_WRITE;
  endfunction
endclass
