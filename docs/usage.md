# Usage: Simulating the AI Switch Fabric

## Prerequisites
- Verilator (open-source)
- Make, Python (for scripts, optional)

## Build & Run
```sh
make verilator-sim
```
- Edit `tb/tb_ai_switch.sv` for stimulus
- View waveforms with GTKWave (`.vcd` output)

## Extending
- Add more test scenarios in the testbench
- Add assertions, coverage, or scoreboard logic

## Commercial/UVM
- For full UVM, use a commercial simulator (VCS, Questa, Xcelium)

---

See [index](index.md) for overview, [rtl](rtl.md) for module, [verification](verification.md) for testplan.
