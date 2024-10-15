## Generated SDC file "Edge_counter.out.sdc"

## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

## DATE    "Tue Oct 15 18:34:41 2024"

##
## DEVICE  "5CSEBA6U23I7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 20.000 -waveform { 0.000 10.000 } [get_ports {clk}]
create_clock -name {fin} -period 50.000 -waveform { 0.000 25.000 } [get_ports {fin}]
create_clock -name {altera_reserved_tck} -period 10000.000 -waveform { 0.000 5000.000 } [get_ports {altera_reserved_tck}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {gate} -source [get_ports {clk}] -divide_by 50000 -master_clock {clk} [get_registers {gate:gate1|gate}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {gate}] -rise_to [get_clocks {gate}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {gate}] -fall_to [get_clocks {gate}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {gate}] -rise_to [get_clocks {clk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {gate}] -fall_to [get_clocks {clk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {gate}] -rise_to [get_clocks {gate}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {gate}] -fall_to [get_clocks {gate}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {gate}] -rise_to [get_clocks {clk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {gate}] -fall_to [get_clocks {clk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {gate}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {gate}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {gate}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {gate}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}] -setup 0.160  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {altera_reserved_tck}]  0.000 [get_ports {altera_reserved_tdi}]
set_input_delay -add_delay  -clock [get_clocks {altera_reserved_tck}]  0.000 [get_ports {altera_reserved_tms}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {altera_reserved_tck}]  0.000 [get_ports {altera_reserved_tdo}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[0]}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[1]}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[2]}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[3]}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[4]}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[5]}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[6]}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[7]}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[8]}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[9]}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[10]}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[11]}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[12]}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[13]}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[14]}]
set_output_delay -add_delay  -clock_fall -clock [get_clocks {gate}]  0.000 [get_ports {cnt_out[15]}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {fin}] 


#**************************************************************
# Set False Path
#**************************************************************


set_false_path -from [get_ports {rst_n}] -to [all_registers]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

