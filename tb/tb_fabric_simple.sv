`timescale 1ns/1ps

module tb_fabric_simple;

    parameter WIDTH = 32;

    // DUT signals
    reg                  clk;
    reg                  rst_n;
    reg                  read_req;
    reg                  write_req;
    reg  [WIDTH-1:0]     write_data;
    wire [WIDTH-1:0]     read_data;
    wire                 req_valid;
    wire                 resp_valid;

    // Instantiate DUT
    fabric_simple #(.WIDTH(WIDTH)) dut (
        .clk(clk),
        .rst_n(rst_n),
        .read_req(read_req),
        .write_req(write_req),
        .write_data(write_data),
        .read_data(read_data),
        .req_valid(req_valid),
        .resp_valid(resp_valid)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Test variables
    reg [WIDTH-1:0] last_written;

    // Test sequence
    initial begin
        // Initialize
        rst_n = 0;
        read_req = 0;
        write_req = 0;
        write_data = 0;
        last_written = 0;

        // Reset
        repeat (2) @(posedge clk);
        rst_n = 1;
        @(posedge clk);

        // Write operation
        write_data = 32'hA5A5A5A5;
        write_req = 1;
        @(posedge clk);
        write_req = 0;
        last_written = 32'hA5A5A5A5;
        assert(req_valid && resp_valid) else $fatal("Write handshake failed");
        @(posedge clk);

        // Read operation
        read_req = 1;
        @(posedge clk);
        read_req = 0;
        assert(req_valid && resp_valid) else $fatal("Read handshake failed");
        assert(read_data == last_written) else $fatal("Read data mismatch: %h != %h", read_data, last_written);
        @(posedge clk);

        // Simultaneous read and write
        write_data = 32'hDEADBEEF;
        write_req = 1;
        read_req = 1;
        @(posedge clk);
        write_req = 0;
        read_req = 0;
        last_written = 32'hDEADBEEF;
        assert(req_valid && resp_valid) else $fatal("Simultaneous handshake failed");
        assert(read_data == last_written) else $fatal("Simultaneous read data mismatch: %h != %h", read_data, last_written);
        @(posedge clk);

        // Idle cycle
        @(posedge clk);
        assert(!req_valid && !resp_valid) else $fatal("Handshake should be low during idle");

        $display("All tests passed!");
        $finish;
    end

endmodule 