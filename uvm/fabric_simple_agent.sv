class fabric_simple_agent extends uvm_agent;
    fabric_simple_driver driver;
    fabric_simple_monitor monitor;
    virtual fabric_simple_if vif;

    function new(string name = "fabric_simple_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual fabric_simple_if)::get(this, "", "vif", vif))
            `uvm_fatal("NOVIF", "Virtual interface not set for: " , get_full_name())
        driver = fabric_simple_driver::type_id::create("driver", this);
        monitor = fabric_simple_monitor::type_id::create("monitor", this);
        uvm_config_db#(virtual fabric_simple_if)::set(this, "driver", "vif", vif);
        uvm_config_db#(virtual fabric_simple_if)::set(this, "monitor", "vif", vif);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction
endclass 