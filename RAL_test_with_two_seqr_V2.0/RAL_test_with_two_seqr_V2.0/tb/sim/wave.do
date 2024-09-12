onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -label sim:/tb_top/DUT/Group1 -group {Region: sim:/tb_top/DUT} /tb_top/DUT/clk
add wave -noupdate -expand -label sim:/tb_top/DUT/Group1 -group {Region: sim:/tb_top/DUT} /tb_top/DUT/reset_n
add wave -noupdate -expand -label sim:/tb_top/DUT/Group1 -group {Region: sim:/tb_top/DUT} /tb_top/DUT/i_wr_en
add wave -noupdate -expand -label sim:/tb_top/DUT/Group1 -group {Region: sim:/tb_top/DUT} /tb_top/DUT/i_rd_en
add wave -noupdate -expand -label sim:/tb_top/DUT/Group1 -group {Region: sim:/tb_top/DUT} /tb_top/DUT/i_waddr
add wave -noupdate -expand -label sim:/tb_top/DUT/Group1 -group {Region: sim:/tb_top/DUT} /tb_top/DUT/i_raddr
add wave -noupdate -expand -label sim:/tb_top/DUT/Group1 -group {Region: sim:/tb_top/DUT} /tb_top/DUT/i_wdata
add wave -noupdate -expand -label sim:/tb_top/DUT/Group1 -group {Region: sim:/tb_top/DUT} /tb_top/DUT/i_wstrobe
add wave -noupdate -expand -label sim:/tb_top/DUT/Group1 -group {Region: sim:/tb_top/DUT} /tb_top/DUT/o_rdata
add wave -noupdate -expand -label sim:/tb_top/DUT/Group1 -group {Region: sim:/tb_top/DUT} /tb_top/DUT/o_wready
add wave -noupdate -expand -label sim:/tb_top/DUT/Group1 -group {Region: sim:/tb_top/DUT} /tb_top/DUT/o_rvalid
add wave -noupdate -expand -label sim:/tb_top/DUT/Group1 -group {Region: sim:/tb_top/DUT} /tb_top/DUT/control_reg
add wave -noupdate -expand -label sim:/tb_top/DUT/Group1 -group {Region: sim:/tb_top/DUT} /tb_top/DUT/intr_sts_reg
add wave -noupdate -expand -label sim:/tb_top/DUT/Group1 -group {Region: sim:/tb_top/DUT} /tb_top/DUT/intr_msk_reg
add wave -noupdate -expand -label sim:/tb_top/DUT/Group1 -group {Region: sim:/tb_top/DUT} /tb_top/DUT/debug_reg
add wave -noupdate -expand -label sim:/tb_top/DUT1/Group1 -group {Region: sim:/tb_top/DUT1} /tb_top/DUT1/clk
add wave -noupdate -expand -label sim:/tb_top/DUT1/Group1 -group {Region: sim:/tb_top/DUT1} /tb_top/DUT1/reset_n
add wave -noupdate -expand -label sim:/tb_top/DUT1/Group1 -group {Region: sim:/tb_top/DUT1} /tb_top/DUT1/i_wr_en
add wave -noupdate -expand -label sim:/tb_top/DUT1/Group1 -group {Region: sim:/tb_top/DUT1} /tb_top/DUT1/i_rd_en
add wave -noupdate -expand -label sim:/tb_top/DUT1/Group1 -group {Region: sim:/tb_top/DUT1} /tb_top/DUT1/i_waddr
add wave -noupdate -expand -label sim:/tb_top/DUT1/Group1 -group {Region: sim:/tb_top/DUT1} /tb_top/DUT1/i_raddr
add wave -noupdate -expand -label sim:/tb_top/DUT1/Group1 -group {Region: sim:/tb_top/DUT1} /tb_top/DUT1/i_wdata
add wave -noupdate -expand -label sim:/tb_top/DUT1/Group1 -group {Region: sim:/tb_top/DUT1} /tb_top/DUT1/i_wstrobe
add wave -noupdate -expand -label sim:/tb_top/DUT1/Group1 -group {Region: sim:/tb_top/DUT1} /tb_top/DUT1/o_rdata
add wave -noupdate -expand -label sim:/tb_top/DUT1/Group1 -group {Region: sim:/tb_top/DUT1} /tb_top/DUT1/o_wready
add wave -noupdate -expand -label sim:/tb_top/DUT1/Group1 -group {Region: sim:/tb_top/DUT1} /tb_top/DUT1/o_rvalid
add wave -noupdate -expand -label sim:/tb_top/DUT1/Group1 -group {Region: sim:/tb_top/DUT1} /tb_top/DUT1/control_reg
add wave -noupdate -expand -label sim:/tb_top/DUT1/Group1 -group {Region: sim:/tb_top/DUT1} /tb_top/DUT1/intr_sts_reg
add wave -noupdate -expand -label sim:/tb_top/DUT1/Group1 -group {Region: sim:/tb_top/DUT1} /tb_top/DUT1/intr_msk_reg
add wave -noupdate -expand -label sim:/tb_top/DUT1/Group1 -group {Region: sim:/tb_top/DUT1} /tb_top/DUT1/debug_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1 us}
