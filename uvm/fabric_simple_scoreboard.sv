class fabric_simple_scoreboard extends uvm_component;
    uvm_analysis_imp #(fabric_simple_txn, fabric_simple_scoreboard) analysis_export;
    bit [31:0] last_written;

    function new(string name = "fabric_simple_scoreboard", uvm_component parent = null);
        super.new(name, parent);
        analysis_export = new("analysis_export", this);
        last_written = 0;
    endfunction

    virtual function void write(fabric_simple_txn txn);
        if (txn.write_req)
            last_written = txn.write_data;
        if (txn.read_req) begin
            if (txn.write_req)
                assert(txn.write_data == last_written) else `uvm_error("SCOREBOARD", $sformatf("Simultaneous write data mismatch: %h != %h", txn.write_data, last_written));
            else
                assert(txn.write_data == last_written) else `uvm_error("SCOREBOARD", $sformatf("Read data mismatch: %h != %h", txn.write_data, last_written));
        end
    endfunction
endclass 