# RISC-V-Processor-using-verilog-RTL-to-GDS
<h1 align="center">🧠 RISC-V Processor Design (Verilog + VLSI Flow)</h1>

<p align="center">
  🚀 A complete RTL-to-GDSII educational project of a simple RISC-V processor core.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/HDL-Verilog-blue?logo=verilog">
  <img src="https://img.shields.io/badge/Simulator-Cadence%20NC--Sim-red">
  <img src="https://img.shields.io/badge/Layout-Cadence%20Innovus-green">
  <img src="https://img.shields.io/badge/Target-RV32I-lightgrey">
  <img src="https://img.shields.io/badge/Status-Completed-brightgreen">
</p>

---

## 📝 Project Overview

This repository showcases the design, simulation, and layout of a **RISC-V RV32I processor core** using **Verilog HDL**. The design is simulated using **Cadence NCLaunch/NCSim**, and physical implementation (RTL to GDSII) is carried out in **Cadence Innovus**. The goal is to demonstrate a full digital design flow from RTL to tape-out-ready layout.

---

## 📁 Directory Structure

risc-v/
├── riscv.v # RTL Verilog for RISC-V processor
├── riscv_tb.v # Testbench for simulation
├── layout/ # Physical design reports and outputs
│ ├── power.rpt # Power report (Innovus)
│ ├── rc_model.bin # Parasitic RC model
│ ├── innovus.cmd4 # Innovus commands
│ └── innovus.log1 # Innovus layout log
├── cds.lib # Cadence library file
├── hdl.var # HDL variable setup
├── ncvlog.log # Log from ncvlog compiler
├── ncelab.log # Log from ncelab elaborator
├── ncsim.log # Log from ncsim simulation

---

## 🚦 Features

✅ Implements core RV32I instructions  
✅ Modular design with simple datapath & control  
✅ Fully synchronous with positive edge clocking  
✅ Verilog testbench with simulation output verification  
✅ Cadence-compatible setup for industry simulation tools  
✅ Physical design with floorplan, placement, CTS, and routing  
✅ Includes **power analysis**, **RC modeling**, and **timing closure**

---

## ⚙️ Tools Used

| Tool                | Purpose                                  |
|---------------------|------------------------------------------|
| Verilog HDL         | RTL design                               |
| Cadence NCLaunch    | Compilation, elaboration, simulation     |
| Cadence Innovus     | Layout, power planning, routing, reports |
| GTKWave (optional)  | Waveform viewing                         |
| Linux Shell         | Command automation                       |

---

## 🧪 Simulation Flow

1. **Compile** Verilog files:
   ```bash
   ncvlog riscv.v riscv_tb.v
Elaborate design:

2.Copy
ncelab riscv_tb

3.Simulate:
bash
ncsim riscv_tb



📌 Output Samples:
power.rpt: Dynamic & leakage power analysis

rc_model.bin: RC parasitic model for timing closure

innovus.log1: Detailed layout flow and error checks

🎓 Educational Outcomes
✅ Full understanding of RISC-V processor internals

✅ Simulation practice using Cadence tools

✅ Awareness of ASIC design flow

✅ Ability to interpret EDA reports (power, timing)

✅ Demonstrates RTL + Backend flow used in industry

📚 References
📘 RISC-V Instruction Set Manual – RV32I Base ISA v2.1

📘 Digital Design and Computer Architecture – Harris & Harris

📘 CMOS VLSI Design – Weste & Harris

🙋‍♂️ Author
Name: Suriya.B And Suhash.E

Domain: Electronics and Communication Engineering

Institution: Kongu Enineering College 

Project Type: VLSI RTL-to-Layout Academic Project

Year: 2025

📜 License
This project is for academic and research purposes only. All Cadence tools are proprietary and used under educational licenses. Do not redistribute without permission.
