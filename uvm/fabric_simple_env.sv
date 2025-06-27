class fabric_simple_env extends uvm_env;
    fabric_simple_agent agent;
    fabric_simple_scoreboard scoreboard;

    function new(string name = "fabric_simple_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = fabric_simple_agent::type_id::create("agent", this);
        scoreboard = fabric_simple_scoreboard::type_id::create("scoreboard", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agent.monitor.ap.connect(scoreboard.analysis_export);
    endfunction
endclass 