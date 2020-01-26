# Set the working dir, where all compiled Verilog goes.
vlib work

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns full_adder.v

# Load simulation using mux as the top level simulation module.
vsim adder

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}
#First test case.
#all 0s.
force {cin} 0
force {A[0]} 0
force {A[1]} 0
force {A[2]} 0
force {A[3]} 0
force {B[0]} 0
force {B[1]} 0
force {B[2]} 0
force {B[3]} 0
run 10ns
#0001+0001
force {cin} 0
force {A[0]} 1
force {A[1]} 0
force {A[2]} 0
force {A[3]} 0
force {B[0]} 1
force {B[1]} 0
force {B[2]} 0
force {B[3]} 0
run 10ns
#0000 + 1111
force {cin} 0
force {A[0]} 0
force {A[1]} 0
force {A[2]} 0
force {A[3]} 0
force {B[0]} 1
force {B[1]} 1
force {B[2]} 1
force {B[3]} 1
run 10ns
#0100 + 1011
force {cin} 0
force {A[0]} 0
force {A[1]} 1
force {A[2]} 0
force {A[3]} 0
force {B[0]} 1
force {B[1]} 0
force {B[2]} 1
force {B[3]} 1
run 10ns
#cin = 1
force {cin} 1
force {A[0]} 0
force {A[1]} 0
force {A[2]} 0
force {A[3]} 0
force {B[0]} 0
force {B[1]} 0
force {B[2]} 0
force {B[3]} 0
run 10ns
#test -1 output = 1111
force {cin} 1
force {A[0]} 1
force {A[1]} 1
force {A[2]} 1
force {A[3]} 1
force {B[0]} 0
force {B[1]} 0
force {B[2]} 0
force {B[3]} 0
run 10ns
#test 1111 + 0111 output = 0110
force {cin} 1
force {A[0]} 1
force {A[1]} 1
force {A[2]} 1
force {A[3]} 1
force {B[0]} 1
force {B[1]} 1
force {B[2]} 1
force {B[3]} 1
run 10ns