# Makefile for fabric_simple verification project

RTL      = rtl/fabric_simple.v
TB       = tb/tb_fabric_simple.sv
UVM_TB   = uvm/tb_fabric_simple_uvm.sv
UVM_SRCS = $(wildcard uvm/*.sv)

# VCS (Synopsys)
VCS      = vcs
VCS_FLAGS= -full64 -sverilog +v2k +acc +lint=all -debug_access+all
VCS_UVM  = -ntb_opts uvm

# Questa (Siemens/Mentor)
QUESTA   = vlog
QUESTA_FLAGS = -sv -lint
QUESTA_RUN = vsim -c -do "run -all; quit"

VERILATOR   = verilator
VERILATOR_FLAGS = --cc --exe --build --top-module fabric_simple --trace --timing --CFLAGS -std=c++17
VERILATOR_SRCS = rtl/fabric_simple.v tb_fabric_simple_verilator.cpp

.PHONY: all sim uvm clean verilator-sim clean-verilator

all: sim uvm

sim:
	$(VCS) $(VCS_FLAGS) $(RTL) $(TB) -o simv && ./simv

uvm:
	$(VCS) $(VCS_FLAGS) $(VCS_UVM) $(RTL) $(UVM_SRCS) -o simv_uvm && ./simv_uvm

questa-sim:
	$(QUESTA) $(RTL) $(TB) && $(QUESTA_RUN) tb_fabric_simple

questa-uvm:
	$(QUESTA) $(RTL) $(UVM_SRCS) && $(QUESTA_RUN) tb_fabric_simple_uvm

verilator-sim:
	$(VERILATOR) $(VERILATOR_FLAGS) $(VERILATOR_SRCS)
	./obj_dir/Vfabric_simple

clean:
	rm -rf simv simv_uvm csrc DVE* *.log transcript work *.vpd *.key *.sim 

clean-verilator:
	rm -rf obj_dir *.vcd 