# Set the working dir, where all compiled Verilog goes.
vlib prelab2

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns prelab2part3.v

# Load simulation using mux as the top level simulation module.
vsim hex

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

# testcase 0
force {SW[0]} 0 
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0

# Run simulation for a few ns.
run 10ns

# testcase 1
force {SW[0]} 1
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 0

# Run simulation for a few ns.
run 10ns

# testcase 2
force {SW[0]} 0 
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0

# Run simulation for a few ns.
run 10ns

# testcase 3
force {SW[0]} 1 
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 0

# Run simulation for a few ns.
run 10ns

# testcase 4
force {SW[0]} 0
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0

# Run simulation for a few ns.
run 10ns

# testcase 5
force {SW[0]} 1 
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 0

# Run simulation for a few ns.
run 10ns

# testcase 6
force {SW[0]} 0 
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0

# Run simulation for a few ns.
run 10ns

# testcase 7
force {SW[0]} 1 
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 0

# Run simulation for a few ns.
run 10ns

# testcase 8
force {SW[0]} 0 
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1

# Run simulation for a few ns.
run 10ns

# testcase 9
force {SW[0]} 1 
force {SW[1]} 0
force {SW[2]} 0
force {SW[3]} 1

# Run simulation for a few ns.
run 10ns


# testcase 10
force {SW[0]} 0 
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1

# Run simulation for a few ns.
run 10ns


# testcase 11
force {SW[0]} 1 
force {SW[1]} 1
force {SW[2]} 0
force {SW[3]} 1

# Run simulation for a few ns.
run 10ns

# testcase 12
force {SW[0]} 0 
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1

# Run simulation for a few ns.
run 10ns

# testcase 13
force {SW[0]} 1 
force {SW[1]} 0
force {SW[2]} 1
force {SW[3]} 1

# Run simulation for a few ns.
run 10ns

# testcase 14
force {SW[0]} 0 
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1

# Run simulation for a few ns.
run 10ns

# testcase 15
force {SW[0]} 1
force {SW[1]} 1
force {SW[2]} 1
force {SW[3]} 1

# Run simulation for a few ns.
run 10ns