class fabric_simple_test extends uvm_test;
    fabric_simple_env env;
    fabric_simple_seq seq;

    function new(string name = "fabric_simple_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = fabric_simple_env::type_id::create("env", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        seq = fabric_simple_seq::type_id::create("seq");
        seq.start(env.agent.driver);
    endtask

    `uvm_component_utils(fabric_simple_test)
endclass 