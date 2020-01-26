# Set the working dir, where all compiled Verilog goes.
vlib prelab2

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns prelab2.v

# Load simulation using mux as the top level simulation module.
vsim mux

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

# u = SW[0], v = SW[1], w = SW[2], x = SW[3], s0 = SW[8], s1 = SW[9]

# s0 = 0, s1 = 0, u = 0
force {SW[0]} 0 
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 0
# Run simulation for a few ns.
run 10ns

# s0 = 0, s1 = 0, u = 1
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 0
run 10ns

# s0 = 1, s1 = 0, v = 0
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 0
run 10ns

# s0 = 1, s1 = 0, v = 1
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 0
run 10ns

# s0 = 0, s1 = 1, w = 0
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 1
run 10ns

# s0 = 0, s1 = 1, w = 1
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 0
force {SW[9]} 1
run 10ns

# s0 = 1, s1 = 1, x = 0
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0
force {SW[8]} 1
force {SW[9]} 1
run 10ns

# s0 = 1, s1 = 1, x = 1
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1
force {SW[8]} 1
force {SW[9]} 1
run 10ns

