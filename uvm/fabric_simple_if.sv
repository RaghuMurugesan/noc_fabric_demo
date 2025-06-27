interface fabric_simple_if #(parameter WIDTH = 32) (input logic clk);
    logic rst_n;
    logic read_req;
    logic write_req;
    logic [WIDTH-1:0] write_data;
    logic [WIDTH-1:0] read_data;
    logic req_valid;
    logic resp_valid;
endinterface 