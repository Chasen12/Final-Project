# Copyright 1991-2016 Mentor Graphics Corporation
# 
# Modification by Oklahoma State University
# Use with Testbench 
# James Stine, 2008
# Go Cowboys!!!!!!
#
# All Rights Reserved.
#
# THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY INFORMATION
# WHICH IS THE PROPERTY OF MENTOR GRAPHICS CORPORATION
# OR ITS LICENSORS AND IS SUBJECT TO LICENSE TERMS.

# Use this run.do file to run this example.
# Either bring up ModelSim and type the following at the "ModelSim>" prompt:
#     do run.do
# or, to run from a shell, type the following at the shell prompt:
#     vsim -do run.do -c
# (omit the "-c" to see the GUI while running from the shell)

onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

# compile source files
vlog fdiv.sv fdiv_tb.sv 0419-flopenr.sv modifiedmux2.sv modifiedmux4.sv 

# start and run simulation
vsim -voptargs=+acc tb

view list
view wave

-- display input and output signals as hexidecimal values
# Add waves with the correct hierarchical paths
add wave -radix binary /tb/dut/N
add wave -radix binary /tb/dut/D
add wave -radix binary /tb/dut/rm
add wave -radix binary /tb/dut/op
add wave -radix binary /tb/dut/enc
add wave -radix binary /tb/dut/ena
add wave -radix binary /tb/dut/enb
add wave -radix binary /tb/dut/Q
add wave -radix binary /tb/dut/ia
add wave -radix binary /tb/dut/ina
add wave -radix binary /tb/dut/inb
add wave -radix binary /tb/dut/regc
add wave -radix binary /tb/dut/rega
add wave -radix binary /tb/dut/regb
add wave -radix binary /tb/dut/mult_output
add wave -radix binary /tb/dut/comp_output
add wave -radix binary /tb/dut/Nf
add wave -radix binary /tb/dut/Df
add wave -radix binary /tb/dut/clk
add wave -radix binary /tb/dut/rem
add wave -radix binary /tb/dut/prem

add list -radix binary -r /tb/*
add log -r /*

-- Set Wave Output Items 
TreeUpdate [SetDefaultTree]
WaveRestoreZoom {0 ps} {75 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2

-- Run the Simulation
run 300 ns


# 010011101011100001010001111010010010100000101100
# 0.110101000111101011100001111111