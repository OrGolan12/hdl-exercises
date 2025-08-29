# Rising Edge Detection in SystemVerilog

## Overview
This project implements a rising-edge detector in SystemVerilog. The design generates a one-cycle pulse whenever the input signal transitions from low to high. A testbench is included to verify functionality by applying multiple input pulses with varying on/off times.

## Files

### pos_edge_detection.sv
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

### pos_edge_detection_tb.sv
- Generates a clock with a configurable period (`CLK_PERIOD`).
- Applies a reset sequence before testing.
- Creates pulses on `in` with random pulse widths.
- Repeats the process `PULSE_AMOUNT` times (default is 5).

**Expected behavior:**  
For every low-to-high transition of `in`, the output `out` should be high for exactly one clock cycle. Falling edges do not generate pulses.

**Testbench Waveforms:** 
<img width="2048" height="150" alt="image" src="https://github.com/user-attachments/assets/5f36a023-10c4-4741-b493-770c62fe6daf" />

**Synthesis**
<img width="2048" height="582" alt="image" src="https://github.com/user-attachments/assets/f945f7ee-2cb3-4ac3-8633-19e93ee8cf3f" />

## Tools and Requirements
- SystemVerilog simulator (ModelSim, QuestaSim, Icarus Verilog, or Verilator).
- GTKWave or similar waveform viewer.

## Running the Simulation
1. Compile the design and testbench:
   ```bash
   iverilog -g2012 -o sim pos_edge_detection_tb.sv pos_edge_detection.sv
   ```

2. Run the simulation:
   ```bash
   vvp sim
   ```

3. Open the waveform dump:
   ```bash
   gtkwave edge_detection_tb.vcd
   ```

