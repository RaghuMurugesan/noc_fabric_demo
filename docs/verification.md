# Verification: AI Switch Fabric

## Testbench Overview
- SystemVerilog testbench (`tb/tb_ai_switch.sv`) for functional verification
- Generates random and directed traffic
- Programs routing/QoS via management interface
- Checks output, telemetry, and congestion handling

## Testplan
- **Basic routing:** Each input can reach each output
- **QoS arbitration:** High-priority packets are serviced first
- **Congestion:** Simulate congestion and verify rerouting/telemetry
- **Telemetry:** Check counters for accuracy
- **Management:** Program routing/QoS, read back

## UVM-Ready
- UVM testbench can be added for coverage-driven verification (requires commercial simulator)
- Scoreboard, monitors, and agents recommended

## Verilator
- Run simple testbench with Verilator for open-source simulation
- Use C++/Python for advanced stimulus if required

---

See [usage](usage.md) for running simulations.
