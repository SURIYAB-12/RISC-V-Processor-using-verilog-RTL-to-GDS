# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Mon Jun 09 12:45:00 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design simple_riscv

create_clock -name "clk" -period 2.0 -waveform {0.0 1.0} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_load -pin_load 0.15 [get_ports {data_out[7]}]
set_load -pin_load 0.15 [get_ports {data_out[6]}]
set_load -pin_load 0.15 [get_ports {data_out[5]}]
set_load -pin_load 0.15 [get_ports {data_out[4]}]
set_load -pin_load 0.15 [get_ports {data_out[3]}]
set_load -pin_load 0.15 [get_ports {data_out[2]}]
set_load -pin_load 0.15 [get_ports {data_out[1]}]
set_load -pin_load 0.15 [get_ports {data_out[0]}]
set_load -pin_load 0.15 [get_ports {addr[3]}]
set_load -pin_load 0.15 [get_ports {addr[2]}]
set_load -pin_load 0.15 [get_ports {addr[1]}]
set_load -pin_load 0.15 [get_ports {addr[0]}]
set_load -pin_load 0.15 [get_ports mem_read]
set_load -pin_load 0.15 [get_ports mem_write]
set_clock_gating_check -setup 0.0 
set_max_fanout 20.000 [current_design]
set_input_transition 0.12 [get_ports clk]
set_input_transition 0.12 [get_ports reset]
set_input_transition 0.12 [get_ports {instruction[15]}]
set_input_transition 0.12 [get_ports {instruction[14]}]
set_input_transition 0.12 [get_ports {instruction[13]}]
set_input_transition 0.12 [get_ports {instruction[12]}]
set_input_transition 0.12 [get_ports {instruction[11]}]
set_input_transition 0.12 [get_ports {instruction[10]}]
set_input_transition 0.12 [get_ports {instruction[9]}]
set_input_transition 0.12 [get_ports {instruction[8]}]
set_input_transition 0.12 [get_ports {instruction[7]}]
set_input_transition 0.12 [get_ports {instruction[6]}]
set_input_transition 0.12 [get_ports {instruction[5]}]
set_input_transition 0.12 [get_ports {instruction[4]}]
set_input_transition 0.12 [get_ports {instruction[3]}]
set_input_transition 0.12 [get_ports {instruction[2]}]
set_input_transition 0.12 [get_ports {instruction[1]}]
set_input_transition 0.12 [get_ports {instruction[0]}]
set_input_transition 0.12 [get_ports {data_in[7]}]
set_input_transition 0.12 [get_ports {data_in[6]}]
set_input_transition 0.12 [get_ports {data_in[5]}]
set_input_transition 0.12 [get_ports {data_in[4]}]
set_input_transition 0.12 [get_ports {data_in[3]}]
set_input_transition 0.12 [get_ports {data_in[2]}]
set_input_transition 0.12 [get_ports {data_in[1]}]
set_input_transition 0.12 [get_ports {data_in[0]}]
set_wire_load_mode "enclosed"
set_clock_uncertainty -setup 0.01 [get_ports clk]
set_clock_uncertainty -hold 0.01 [get_ports clk]
