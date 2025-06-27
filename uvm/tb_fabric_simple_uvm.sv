module tb_fabric_simple_uvm;

    parameter WIDTH = 32;

    logic clk;
    always #5 clk = ~clk;

    fabric_simple_if #(WIDTH) fabric_if(.clk(clk));

    // DUT instance
    fabric_simple #(.WIDTH(WIDTH)) dut (
        .clk(clk),
        .rst_n(fabric_if.rst_n),
        .read_req(fabric_if.read_req),
        .write_req(fabric_if.write_req),
        .write_data(fabric_if.write_data),
        .read_data(fabric_if.read_data),
        .req_valid(fabric_if.req_valid),
        .resp_valid(fabric_if.resp_valid)
    );

    // UVM run
    initial begin
        clk = 0;
        run_test();
    end

endmodule 