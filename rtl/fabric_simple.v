`timescale 1ns/1ps

module fabric_simple #(
    parameter WIDTH = 32
)(
    input  wire         clk,
    input  wire         rst_n,
    input  wire         read_req,
    input  wire         write_req,
    input  wire [WIDTH-1:0] write_data,

    output reg  [WIDTH-1:0] read_data,
    output reg              req_valid,
    output reg              resp_valid
);

    reg [WIDTH-1:0] storage;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            storage   <= 0;
            read_data <= 0;
            req_valid <= 0;
            resp_valid<= 0;
        end else begin
            req_valid  <= read_req | write_req;
            resp_valid <= read_req | write_req;

            if (write_req) storage <= write_data;
            if (read_req)  read_data <= storage;
        end
    end

endmodule 