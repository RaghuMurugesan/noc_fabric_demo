# fabric_simple Verification Project

This project is organized as follows:

- `rtl/` — Verilog RTL for the simple fabric module.
    - `fabric_simple.v`
- `tb/` — Simple, self-checking SystemVerilog testbench.
    - `tb_fabric_simple.sv`
- `uvm/` — UVM-based verification environment.
    - `fabric_simple_if.sv` — SystemVerilog interface for UVM
    - `tb_fabric_simple_uvm.sv` — UVM testbench top module
    - `fabric_simple_txn.sv` — UVM transaction class
    - `fabric_simple_seq.sv` — UVM sequence
    - `fabric_simple_driver.sv` — UVM driver
    - `fabric_simple_monitor.sv` — UVM monitor
    - `fabric_simple_agent.sv` — UVM agent
    - `fabric_simple_scoreboard.sv` — UVM scoreboard
    - `fabric_simple_env.sv` — UVM environment
    - `fabric_simple_test.sv` — UVM test class

## Usage

- Use `tb/tb_fabric_simple.sv` for a quick, standalone simulation.
- Use the files in `uvm/` for a full-featured, coverage-driven UVM verification flow.
- The RTL is in `rtl/`.

All files are ready to use with standard EDA tools (VCS, Questa, Xcelium, etc.). 