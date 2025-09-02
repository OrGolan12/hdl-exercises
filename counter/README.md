# Parameterized Counter in SystemVerilog

## Overview
This project implements a parameterized modulo counter in SystemVerilog. The counter increments by one on each clock cycle where the `in` signal is asserted. Once the counter reaches its maximum value (`COUNT-1`), it wraps back to zero. A testbench is provided to verify the counter through directed and randomized stimulus.

## Files

### counter.sv
- **Parameters:**
  - `COUNT`: Counter modulus (default = 6). The counter cycles from 0 up to `COUNT-1`.

- **Inputs:**
  - `clk`: System clock.
  - `rst_n`: Active-low asynchronous reset.
  - `in`: Enable signal; counter increments when high.

- **Output:**
  - `out`: Current counter value (`$clog2(COUNT)` bits wide).

- **How it works:**
  - On each rising edge of `clk`, if `rst_n` is low, the counter resets to zero.
  - If `in` is high, the counter increments. When `COUNT-1` is reached, the counter wraps back to zero.
  - The output continuously reflects the counter value.

### counter_tb.sv
- Generates a clock with a configurable period (`CLK_PERIOD`).
- Applies reset at the beginning and mid-simulation.
- Uses a reusable task `pulse()` to drive one-cycle enables on `in`.
- Compares DUT output against an expected reference model for verification.
- Includes randomized stimulus to validate multiple wrap-around scenarios.

**Expected behavior:**  
- The counter starts at 0 after reset.
- Each input pulse increments the counter.
- After reaching `COUNT-1`, the counter wraps to 0.
- During reset, the counter always returns to 0.

**Testbench Waveforms:**  
<img width="1692" height="144" alt="image" src="https://github.com/user-attachments/assets/a06f980f-2197-4afe-ae1d-f825569f8faf" />


**Synthesis:**  
<img width="1427" height="423" alt="image" src="https://github.com/user-attachments/assets/bba203d5-9636-428e-a769-f5610fd1cce3" />


## Tools and Requirements
- SystemVerilog simulator (ModelSim, QuestaSim, Icarus Verilog, or Verilator).
- GTKWave or another waveform viewer.

## Running the Simulation
1. Compile the design and testbench:
   ```bash
   iverilog -g2012 -o sim counter_tb.sv counter.sv
   ```

2. Run the simulation:
   ```bash
   vvp sim
   ```

3. Open the waveform dump:
   ```bash
   gtkwave counter_tb.vcd
   ```
