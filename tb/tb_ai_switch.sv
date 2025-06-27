// tb_ai_switch.sv: Testbench for ai_switch.sv
// Generates random traffic, programs routing/QoS, checks telemetry

module tb_ai_switch;
    parameter N_PORTS = 4;
    parameter DATA_WIDTH = 32;
    parameter PKT_WIDTH = 64;

    // Clock and reset
    reg clk, rst_n;
    initial begin clk = 0; forever #5 clk = ~clk; end
    initial begin rst_n = 0; #20 rst_n = 1; end

    // Management clock/reset
    reg mgmt_clk, mgmt_rst_n;
    initial begin mgmt_clk = 0; forever #10 mgmt_clk = ~mgmt_clk; end
    initial begin mgmt_rst_n = 0; #40 mgmt_rst_n = 1; end

    // DUT connections
    wire [N_PORTS-1:0][PKT_WIDTH-1:0] in_pkt;
    wire [N_PORTS-1:0] in_valid, in_ready;
    wire [N_PORTS-1:0][PKT_WIDTH-1:0] out_pkt;
    wire [N_PORTS-1:0] out_valid, out_ready;

    // Management interface
    reg mgmt_sel;
    reg [7:0] mgmt_addr;
    reg [31:0] mgmt_wdata;
    reg mgmt_write;
    wire [31:0] mgmt_rdata;

    // Instantiate DUT
    ai_switch #(.N_PORTS(N_PORTS), .DATA_WIDTH(DATA_WIDTH), .PKT_WIDTH(PKT_WIDTH)) dut (
        .clk(clk), .rst_n(rst_n),
        .in_pkt(in_pkt), .in_valid(in_valid), .in_ready(in_ready),
        .out_pkt(out_pkt), .out_valid(out_valid), .out_ready(out_ready),
        .mgmt_clk(mgmt_clk), .mgmt_rst_n(mgmt_rst_n),
        .mgmt_sel(mgmt_sel), .mgmt_addr(mgmt_addr), .mgmt_wdata(mgmt_wdata), .mgmt_write(mgmt_write), .mgmt_rdata(mgmt_rdata)
    );

    // Stimulus, checks, and scoreboard would go here
    // ...

endmodule
