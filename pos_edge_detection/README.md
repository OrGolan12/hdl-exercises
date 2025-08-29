# Edge Detection in SystemVerilog

## Overview
This project implements a rising-edge detector in SystemVerilog. The design generates a one-cycle pulse whenever the input signal transitions from low to high. A testbench is included to verify functionality by applying multiple input pulses with varying on/off times.

## Files

### edge_detection.sv
- **Inputs:**
  - `clk`: System clock.
  - `in`: Input signal to be monitored.
  - `rst_n`: Active-low asynchronous reset.

- **Output:**
  - `out`: A one-cycle pulse on each rising edge of `in`.

- **How it works:**
  The module stores a delayed version of the input (`in_delayed`) on every clock cycle. A rising edge is detected with the expression:
  ```systemverilog
  assign out = ~in_delayed & in;
  ```
  When reset is active, the delayed state is cleared.

### edge_detection_tb.sv
- Generates a clock with a configurable period (`CLK_PERIOD`).
- Applies a reset sequence before testing.
- Creates pulses on `in` with varying `on` and `off` cycle lengths.
- Repeats the process `PULSE_AMOUNT` times (default is 5).
- Displays progress messages using `$display`.
- Can produce a waveform dump for debugging.

**Expected behavior:**  
For every low-to-high transition of `in`, the output `out` should be high for exactly one clock cycle. Falling edges do not generate pulses.

## Tools and Requirements
- SystemVerilog simulator (ModelSim, QuestaSim, Icarus Verilog, or Verilator).
- GTKWave or similar waveform viewer (optional).

## Running the Simulation
1. Compile the design and testbench:
   ```bash
   vlog edge_detection.sv edge_detection_tb.sv
   ```

2. Run the simulation:
   ```bash
   vsim edge_detection_tb
   ```

3. (Optional) Open the waveform dump:
   ```bash
   gtkwave dump.vcd
   ```

## Future Improvements
- Add support for falling-edge or dual-edge detection.
- Add SystemVerilog Assertions (SVA) for automatic checks.
- Extend the testbench with randomized edge cases.
