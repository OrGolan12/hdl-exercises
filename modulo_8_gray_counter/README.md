# Modulo-8 Gray Counter in SystemVerilog

## Overview
This project implements a modulo-8 **Gray code counter** in SystemVerilog. The counter cycles through the 8 valid 3-bit Gray code states (0 to 7) and wraps back to 0. A dedicated testbench is provided to verify functionality.

## Files

### modulo_8_gray_counter.sv
- **Parameters:**
  - Fixed modulus of 8 (Gray code sequence with 3-bit width).

- **Inputs:**
  - `clk`: System clock.
  - `rst_n`: Active-low asynchronous reset.

- **Output:**
  - `count`: Current counter value (3-bit Gray code).

- **How it works:**
  - The counter resets asynchronously to the starting Gray state (`000`) when `rst_n` is low, and resumes counting on rising `clk` edges once `rst_n` is high.
  - The counter advances through the Gray code sequence, wrapping back to `000` after 8 states.

### modulo_8_gray_counter_tb.sv
- Generates a clock with a 10 ns period (`CLK_PERIOD = 10`).
- Dumps waveforms to `modulo_8_gray_counter_tb.vcd` for GTKWave viewing.
- Displays counter activity with `$monitor` for console logging.
- Provides a `reset_dut` task:
  - Drives reset low for one clock cycle, then releases it.
- Simulation sequence:
  - Apply reset at the start.
  - Run for 10 clock cycles.
  - Finish simulation.

**Expected behavior:**  
- After reset, the counter starts at `000` (Gray code for 0).  
- Each enable pulse advances the counter through the Gray code sequence:  
  ```
  000 → 001 → 011 → 010 → 110 → 111 → 101 → 100 → 000 → ...
  ```
- Counter always returns to `000` during reset.  
- Wrap-around occurs after 8 states.  

**Console Output Example:**  
```
[ 0.00 ns] count=000
[10.00 ns] count=001
[20.00 ns] count=011
...
```

**Testbench Waveforms:**  
<img width="1531" height="110" alt="image" src="https://github.com/user-attachments/assets/5af4a5dc-5500-46e9-9bec-9a960c0104ee" />


**Synthesis:**  
<img width="1280" height="880" alt="image" src="https://github.com/user-attachments/assets/02c38958-cec9-48ba-b6fd-e64d6095fbe3" />


## Tools and Requirements
- SystemVerilog simulator (I am using Icarus Verilog).  
- GTKWave or another waveform viewer for debugging.  

## Running the Simulation
1. Compile the design and testbench:
   ```bash
   iverilog -g2012 -o sim modulo_8_gray_counter_tb.sv modulo_8_gray_counter.sv
   ```

2. Run the simulation:
   ```bash
   vvp sim
   ```

3. Open the waveform dump:
   ```bash
   gtkwave modulo_8_gray_counter_tb.vcd
   ```
