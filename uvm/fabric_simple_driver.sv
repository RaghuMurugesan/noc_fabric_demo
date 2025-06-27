class fabric_simple_driver extends uvm_driver #(fabric_simple_txn);
    virtual fabric_simple_if vif;

    function new(string name = "fabric_simple_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual fabric_simple_if)::get(this, "", "vif", vif))
            `uvm_fatal("NOVIF", "Virtual interface not set for: " , get_full_name())
    endfunction

    virtual task run_phase(uvm_phase phase);
        fabric_simple_txn txn;
        forever begin
            seq_item_port.get_next_item(txn);
            vif.read_req <= txn.read_req;
            vif.write_req <= txn.write_req;
            vif.write_data <= txn.write_data;
            @(posedge vif.clk);
            vif.read_req <= 0;
            vif.write_req <= 0;
            seq_item_port.item_done();
        end
    endtask
endclass 