# RTL Guide: AI Switch Fabric

## Module: `ai_switch`

### Parameters
- `N_PORTS` (default: 4): Number of input/output ports
- `DATA_WIDTH` (default: 32): Data width per port
- `PKT_WIDTH` (default: 64): Packet width

### Ports
- `clk`, `rst_n`: Main clock and reset
- `in_pkt`, `in_valid`, `in_ready`: Input packet/data interface
- `out_pkt`, `out_valid`, `out_ready`: Output packet/data interface
- `mgmt_*`: Management interface (APB-like)

### Management Interface
- Programmable routing table
- QoS registers
- Telemetry/statistics counters

### Example Instantiation
```systemverilog
ai_switch #(
    .N_PORTS(4),
    .DATA_WIDTH(32),
    .PKT_WIDTH(64)
) u_switch (
    .clk(clk), .rst_n(rst_n),
    .in_pkt(...), .in_valid(...), .in_ready(...),
    .out_pkt(...), .out_valid(...), .out_ready(...),
    .mgmt_clk(mgmt_clk), .mgmt_rst_n(mgmt_rst_n),
    .mgmt_sel(mgmt_sel), .mgmt_addr(mgmt_addr), .mgmt_wdata(mgmt_wdata), .mgmt_write(mgmt_write), .mgmt_rdata(mgmt_rdata)
);
```

---

See [index](index.md) for project overview.
