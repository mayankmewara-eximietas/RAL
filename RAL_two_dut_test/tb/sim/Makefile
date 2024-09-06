# makefile

PKG=..\test\package.sv
FIND=+incdir+..\env +incdir+..\reg_lib +incdir+..\test +incdir+..\rtl +incdir+..\TOP
TOP=..\top\top.sv
TOP_MODULE=tb_top

TEST=""

lib:
	vlib work

comp:
	vlog $(PKG) $(FIND) $(TOP)

sim:
	vsim -voptargs=+acc $(TOP_MODULE) -c -do "run -all; exit"

gsim:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=$(TEST)
	
qtest1:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_addr_data_range_test
	
qtest2:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_continue_write_read_test
	
qtest3:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_enable_test
	
qtest4:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_rand_slv_b2b_write_test
	
qtest5:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_rand_slv_b2b_write_with_strobe_test
	
qtest6:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_rand_slv_b2b_write_without_en_test

qtest7:
	vsim $(TOP_MODULE) +UVM_TESTNAME=apb_enable_test

qtest8:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_read_error_inject_test
	
qtest9:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_read_test
	
qtest10:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_ready_random_test
	
qtest11:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_ready_zero_test
	
qtest12:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_reset_in_between_test
	
qtest13:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_same_slv_b2b_write_test

	
qtest14:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_same_slv_b2b_write_with_strobe_test
	
qtest15:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_walking_one_test
	
qtest16:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_walking_zero_test
	
qtest17:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_write_error_inject_test
	
qtest18:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_write_strobe_data_test
	
qtest19:
	vsim -voptargs=+acc $(TOP_MODULE) +UVM_TESTNAME=apb_write_strobe_test


regress_Questa: qtest1 qtest2 qtest3 qtest4 qtest5 qtest6 qtest7 qtest8 qtest9 qtest10 qtest11 qtest12 qtest13 qtest14 qtest15 qtest16 qtest17 qtest18 qtest19 

