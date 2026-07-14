# Verilog Traffic Light Controller (FSM Practice Project)

This is a personal project I created for **practice and self-learning** to master the fundamentals of digital design, Finite State Machines (FSMs), and RTL simulation using Verilog.

---

## 🎯 Project Motivation & Goals

The main objective of this project was to move from theory to practice by designing a synchronous system. Through this project, I practiced:
* Designing a 4-state Finite State Machine (FSM).
* Separating sequential logic (state memory and counter) from combinational logic (outputs).
* Writing a proper testbench with safe reset timing and clock generation.
* Generating and analyzing simulation waveforms using GTKWave/EPWave.

---

## 🚦 System Architecture & States

The controller regulates traffic at a junction between a **Main Road** and a **Side Road** using a timer-based cycle:
* **Green Light Duration:** 10 clock cycles ($100\ ns$)
* **Yellow Light Duration:** 3 clock cycles ($30\ ns$)

### The FSM States:
1. **`s_green` (State 00):** Main Road is **Green** (10 cycles) | Side Road is **Red**
2. **`s_yellow` (State 01):** Main Road is **Yellow** (3 cycles) | Side Road is **Red**
3. **`m_green` (State 10):** Main Road is **Red** | Side Road is **Green** (10 cycles)
4. **`m_yellow` (State 11):** Main Road is **Red** | Side Road is **Yellow** (3 cycles)

---

## 📊 Simulation & Waveform Analysis

The design was verified using **Icarus Verilog** and analyzed with **EPWave**. 

In the testbench, the system is initialized with an active-high reset for $10\ ns$ (1 clock cycle). After the reset is deasserted, the FSM runs freely for $400\ ns$.

### Waveform:

<img width="1852" height="585" alt="Στιγμιότυπο οθόνης 2026-07-14 171745" src="https://github.com/user-attachments/assets/dce1b127-06fd-4f20-9c54-7f91c049e8ed" />


### Timing Breakdown from Waveform:
* **$15\ ns \rightarrow 115\ ns$ ($100\ ns$):** State `s_green`. Main Light is Green (value `1`), Side Light is Red (value `4`).
* **$115\ ns \rightarrow 145\ ns$ ($30\ ns$):** State `s_yellow`. Main Light turns Yellow (value `2`).
* **$145\ ns \rightarrow 245\ ns$ ($100\ ns$):** State `m_green`. Main Light turns Red, Side Light becomes Green (value `1`).

---

## 🛠️ Tools Used
* **HDL:** Verilog / SystemVerilog
* **Simulator:** Icarus Verilog 0.12.0
* **Waveform Viewer:** EPWave (EDA Playground)
