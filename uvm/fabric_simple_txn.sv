class fabric_simple_txn extends uvm_sequence_item;
    rand bit read_req;
    rand bit write_req;
    rand bit [31:0] write_data;
    // Add constraints and methods as needed
    `uvm_object_utils(fabric_simple_txn)
endclass 