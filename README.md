# VLSI Workshop — RTL to GLS, Physical Design, Routing & STA

This repository documents VLSI workshop learning and practical work across RTL design, simulation, synthesis, physical design, routing, and static timing analysis. It is organized into learning modules, lab evidence, and a VSDBabySoC multi-corner STA report package.

## Repository roadmap

### 1. RTL to GLS — five learning modules

| Folder | Main contents |
|---|---|
| [`Module 1/`](Module%201/README.md) | Introduction to Verilog RTL design and simulation: RTL flow, design and testbench, 2:1 MUX, Verilog code, Icarus Verilog, GTKWave, Yosys, libraries, library-based synthesis, simulation vs synthesis. |
| [`Module 2/`](Module%202/README.md) | Sequential logic and hierarchical RTL synthesis: D flip-flops with synchronous reset/asynchronous set/reset, RTL simulation, Yosys synthesis, multiply-by-2 and multiply-by-8 designs, hierarchical vs flat synthesis and netlists. |
| [`Module 3/`](Module%203/README.md) | Combinational and sequential optimizations: optimization checks, DFF constant optimization, unused-output optimization, counter optimization, optimized diagrams and waveforms. |
| [`Module 4/`](Module%204/README.md) | Gate-Level Simulation (GLS), Icarus Verilog GLS, synthesis-simulation mismatch, blocking vs non-blocking assignments, blocking caveats, Bad MUX vs Good MUX, ternary MUX and verification. |
| [`Module 5/`](Module%205/README.md) | Synthesis optimization: bad-case example, DEMUX using case/generate, MUX using generate, incomplete case/if examples, testbenches, ripple-carry adder and generate constructs. |

Each module folder contains its own `README.md` and supporting diagrams, screenshots, synthesized-logic images, or waveforms. See the complete file tree below for exact filenames.

### 2. Physical Design — five learning modules

| Folder | Main contents |
|---|---|
| [`Physical Design/Module 1/`](Physical%20Design/Module%201/README.md) | Open-source EDA, OpenLANE and SKY130 PDK; processor/SoC, pads/core/die, macros/foundry IPs, RISC-V, RTL-to-GDSII and ASIC flow, PicoRV32 synthesis and configuration. |
| [`Physical Design/Module 2/`](Physical%20Design/Module%202/README.md) | Good vs bad floorplanning: core/die dimensions, pre-placed cells, decoupling capacitors, power planning, pin placement, placement blockages, PicoRV32A floorplan, placement optimization and cell-library characterization. |
| [`Physical Design/Module 3/`](Physical%20Design/Module%203/README.md) | Library-cell design using Magic and ngspice: pin placement, SPICE/VTC simulation, switching threshold, CMOS inverter layout, CMOS process layers, inverter SPICE code and waveforms. |
| [`Physical Design/Module 4/`](Physical%20Design/Module%204/README.md) | Pre-layout timing and clock tree: routing tracks/grids, cell dimensions, ports, LEF and typical/fast/slow Liberty corners, synthesis, NAND/NOR, placement, SDC, STA, CTS, clock buffers, shielding, glitches and skew. |
| [`Physical Design/Module 5/`](Physical%20Design/Module%205/README.md) | Final RTL-to-GDS steps with TritonRoute/OpenSTA: maze routing and Lee's algorithm, DRC, parasitic extraction, route guides, global/detailed routing, panel routing, access points and routing topology. |

### 3. Physical Design & Global Routing

[`Physical Design & Global Routing/ReadME.md`](Physical%20Design%20%26%20Global%20Routing/ReadME.md) documents the VSDBabySoC physical-design stages and includes images for floorplanning, placement, clock-tree synthesis (CTS), global routing and detailed routing.

### 4. RTL / GLS / Test lab evidence

[`Lab_work RTL_GLS & Test/README.md`](Lab_work%20RTL_GLS%20%26%20Test/README.md) collects additional practical evidence for RTL simulation, GTKWave, Yosys synthesis, technology mapping, Good/Bad MUX comparison, sequential logic/counters, power reports, BabySoC synthesis/netlists and sequence-detector simulation/GLS.

### 5. Static Timing Analysis (STA)

[`VSDBabySoC_Multi_Corner_STA/README.md`](VSDBabySoC_Multi_Corner_STA/README.md) contains the multi-corner OpenSTA/SKY130 analysis package:

- `docs/VSDBabySoC_STA_Full_Evidence_Report.pdf` — full report and embedded terminal evidence.
- `results/tables/18_corner_results.csv` — tabulated results for 18 timing-library cases.
- `results/tables/results_readme.md` — table interpretation and setup/hold status.
- `results/logs/report_text_extracted.txt` — searchable text extracted from the report.
- `scripts/run_sta_corner.tcl` — STA Tcl template.
- `scripts/run_opensta_docker_example.sh` — Docker example.
- `src/sdc/vsdbabysoc_synthesis.sdc` — documented SDC clock-constraint excerpt.
- `evidence/terminal-pages/README.md` — explains where the terminal evidence is retained.
- `LICENSE-NOTICE.md` — library/report and reuse notice.

**STA interpretation:** the report records 18 cases; six have negative setup WNS. The worst recorded setup WNS is −62.56 ns for `ss_n40C_1v28`. A completed corner run does not necessarily mean setup timing passed. The package README describes input files that must be restored before rerunning; it does not claim the original netlist and Liberty files are included.

## Tools and technologies represented

Verilog HDL, Icarus Verilog, GTKWave, Yosys, SKY130 standard-cell libraries, OpenLANE, Magic, ngspice, OpenSTA, TritonRoute, SDC/Liberty/LEF concepts, and Docker (for the documented STA workflow).

## How to explore this repository

1. Start with the README inside the module or project folder that interests you.
2. Open the associated images to see design diagrams, synthesis results, waveforms and physical-design stages.
3. For timing analysis, begin with `VSDBabySoC_Multi_Corner_STA/README.md`, then review the CSV and full PDF report.

## Complete repository file tree

The tree below is generated from the uploaded repository ZIP and lists the actual directory and file names present in that archive.

```text
VLSI-workshop/
├── Lab_work RTL_GLS & Test/
│   ├── babysoc_netlist.png
│   ├── babysoc_netlist2.png
│   ├── babysocsynthesis_diagram-1.png
│   ├── babysocsynthesis_diagram.png
│   ├── bad_mux _waveformcomparison.png
│   ├── Comparison.png.jpeg
│   ├── good_counter.jpeg
│   ├── goodmuxdiagram.png
│   ├── goodmuxnetlistand code.png
│   ├── gtkwave badmux.png
│   ├── gtkwavegoodmux.png
│   ├── Multiple_modules.jpeg
│   ├── output_report.png
│   ├── Post Synth.png
│   ├── power-reports.jpeg
│   ├── PreSynth.png
│   ├── README.md
│   ├── Screenshot (114).png
│   ├── Screenshot (117).png
│   ├── Screenshot (122).png
│   ├── Screenshot (137).png
│   ├── sequence detector synth.png
│   ├── tb_goodmux_comparison.jpeg
│   ├── tbwave_seqdet.png
│   ├── tbwave_seqdetgls.png
│   ├── vadbabysoctbsynthdiagram-1.jpeg
│   ├── vadbabysoctbsynthdiagram.jpeg
│   └── vsdbaby_abc.png
├── Module 1/
│   ├── Design.png
│   ├── goodmuxwave.png
│   ├── image.png
│   ├── Iverilog based simulation flow.png
│   ├── muxcode.png
│   ├── README.md
│   ├── Synthesiser yosys.png
│   ├── Test bench.png
│   ├── What is lib.png
│   └── yosys setup.png
├── Module 2/
│   ├── asyncresdiag.png
│   ├── asyncsetdiag.png
│   ├── asyncsetwave-1.png
│   ├── asyncsetwave-2.png
│   ├── mul2.png
│   ├── multimodules.png
│   └── README.md
├── Module 3/
│   ├── counteroptimization2diagram.png
│   ├── counteroptimizationdiagram.png
│   ├── dffconst1diagram.png
│   ├── dffconst2diagram.png
│   ├── dffconst2waveform.png
│   ├── dffconst3diagram.png
│   ├── dffconst3waveform.png
│   ├── dffconst4diagram.png
│   ├── dffconst4waveform.png
│   ├── dffcont1waveform.png
│   ├── optcheck1ordiagram.png
│   ├── optcheck2anddiagram.png
│   ├── optcheck3anddiagram.png
│   ├── optcheck4diagram.png
│   └── README.md
├── Module 4/
│   ├── badmuxdiagram.png
│   ├── badmuxwaveform.png
│   ├── blockingcaveatcode.png
│   ├── blockingcaveatdiagram.png
│   ├── blockingcaveatwaveform.png
│   ├── glsusingiverilog.png
│   ├── README.md
│   ├── tbternaryoperatormuxvcdwaveform.png
│   ├── ternaryoperatorglswaveform.png
│   ├── ternaryoperatormux.....png
│   └── ternaryoperatormuxdiagram.png
├── Module 5/
│   ├── badcasediagram.png
│   ├── badcasewaveform.png
│   ├── demuxcasediagram.png
│   ├── demuxcasewaveform.png
│   ├── demuxgeneratediagram.png
│   ├── demuxgeneratewaveform.png
│   ├── generatemuxdiagram.png
│   ├── generatemuxwaveform.png
│   ├── incompcasediagram.png
│   ├── incompcasewaveform.png
│   ├── incompif2diagram.png
│   ├── incompif2waveform.png
│   ├── incompifdiagram.png
│   ├── incompifwaveform.png
│   ├── rcawaveform.png
│   └── README.md
├── Physical Design & Global Routing/
│   ├── CTS .png
│   ├── CTS zoomed.png
│   ├── Detailed Routing.png
│   ├── Floor Plan.png
│   ├── Floorplan Zoomed-1.png
│   ├── Floorplan Zoomed.png
│   ├── Global Routing Zoomed.png
│   ├── Global Routing.png
│   ├── Placement.png
│   └── ReadME.md
├── Physical Design/
├── VSDBabySoC_Multi_Corner_STA/
│   ├── LICENSE-NOTICE.md
│   └── README.md
└── README.md
```

---

*Workshop notes, module-wise practical evidence, physical-design screenshots and STA analysis are organized here for easier navigation.*
