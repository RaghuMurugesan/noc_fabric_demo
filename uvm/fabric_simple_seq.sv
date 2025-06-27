class fabric_simple_seq extends uvm_sequence #(fabric_simple_txn);
    `uvm_object_utils(fabric_simple_seq)
    virtual task body();
        fabric_simple_txn txn;
        // Write
        txn = fabric_simple_txn::type_id::create("txn");
        txn.write_req = 1; txn.read_req = 0; txn.write_data = 32'hA5A5A5A5;
        start_item(txn); finish_item(txn);
        // Read
        txn = fabric_simple_txn::type_id::create("txn");
        txn.write_req = 0; txn.read_req = 1; txn.write_data = 0;
        start_item(txn); finish_item(txn);
        // Simultaneous
        txn = fabric_simple_txn::type_id::create("txn");
        txn.write_req = 1; txn.read_req = 1; txn.write_data = 32'hDEADBEEF;
        start_item(txn); finish_item(txn);
        // Idle
        txn = fabric_simple_txn::type_id::create("txn");
        txn.write_req = 0; txn.read_req = 0; txn.write_data = 0;
        start_item(txn); finish_item(txn);
    endtask
endclass 