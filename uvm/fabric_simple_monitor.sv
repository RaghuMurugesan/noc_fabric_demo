class fabric_simple_monitor extends uvm_monitor;
    virtual fabric_simple_if vif;
    uvm_analysis_port #(fabric_simple_txn) ap;

    function new(string name = "fabric_simple_monitor", uvm_component parent = null);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual fabric_simple_if)::get(this, "", "vif", vif))
            `uvm_fatal("NOVIF", "Virtual interface not set for: " , get_full_name())
    endfunction

    virtual task run_phase(uvm_phase phase);
        fabric_simple_txn txn;
        forever begin
            @(posedge vif.clk);
            if (vif.req_valid && vif.resp_valid) begin
                txn = fabric_simple_txn::type_id::create("txn");
                txn.read_req = vif.read_req;
                txn.write_req = vif.write_req;
                txn.write_data = vif.write_data;
                ap.write(txn);
            end
        end
    endtask
endclass 