# RTL Script to run Basic Synthesis Flow
set_db init_lib_search_path /home/install/FOUNDRY/digital/90nm/dig/lib   
set_db hdl_search_path /home/student/risc-v/logic

set_db library slow.lib
read_hdl riscv.v
elaborate 
read_sdc /home/student/risc-v/logic/constraints_sdc.sdc


set_db syn_generic_effort medium
syn_generic
set_db syn_map_effort medium
syn_map
set_db syn_opt_effort medium
syn_opt


write_hdl > riscv_netlist.v
write_sdc > riscv_block.sdc
report_area > riscv_area.rep
report_gates > riscv_gate.rep
report_power > riscv_power.rep
report_timing > riscv_timing.rep
gui_show


