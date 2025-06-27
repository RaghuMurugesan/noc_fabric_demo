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

## Limitations: UVM and Verilator

- **UVM (Universal Verification Methodology) testbenches cannot be run with Verilator.**
  - UVM requires a commercial simulator (such as Synopsys VCS, Siemens Questa, or Cadence Xcelium) due to licensing and tool support.
  - Open-source tools like Verilator do **not** support UVM testbenches.
- **This repository uses Verilator for simulation.**
  - Only simple or SystemVerilog testbenches and RTL can be simulated with Verilator.
  - UVM-based verification is not possible unless you have access to a commercial simulator and a valid license.

If you need to run UVM testbenches, you must use a commercial simulator on Linux, in a VM, or via a remote/cloud environment with the appropriate license.