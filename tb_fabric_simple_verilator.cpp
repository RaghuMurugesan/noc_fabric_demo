// C++ testbench for Verilator simulation of fabric_simple
#include "Vfabric_simple.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include <iostream>

vluint64_t main_time = 0; // Current simulation time

double sc_time_stamp() {
    return main_time;
}

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    Vfabric_simple* top = new Vfabric_simple;

    // VCD tracing
    VerilatedVcdC* tfp = new VerilatedVcdC;
    Verilated::traceEverOn(true);
    top->trace(tfp, 99);
    tfp->open("fabric_simple.vcd");

    // Initialize inputs
    top->clk = 0;
    top->rst_n = 0;
    top->read_req = 0;
    top->write_req = 0;
    top->write_data = 0;

    // Simulation loop
    for (main_time = 0; main_time < 100; main_time++) {
        // Toggle clock
        top->clk = !top->clk;

        // Deassert reset after 10 cycles
        if (main_time == 20) top->rst_n = 1;

        // Example stimulus: write then read
        if (main_time == 22) {
            top->write_req = 1;
            top->write_data = 0x1234;
        } else if (main_time == 24) {
            top->write_req = 0;
        }
        if (main_time == 30) {
            top->read_req = 1;
        } else if (main_time == 32) {
            top->read_req = 0;
        }

        // Evaluate model
        top->eval();
        tfp->dump(main_time);
    }

    // Final model cleanup
    top->final();
    tfp->close();
    delete top;
    delete tfp;
    return 0;
}
