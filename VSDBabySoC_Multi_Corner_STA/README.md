# VSDBabySoC — Multi-Corner Static Timing Analysis (OpenSTA / SKY130)

**Author:** B. Rohith Reddy  
**Roll number:** 25EG504B06  
**Department / section:** ECE / B  
**Design:** VSDBabySoC  
**Tool documented:** OpenSTA 3.1.0  
**Clock constraint:** `clk`, 11.00 ns  
**Original environment:** Ubuntu VM / VirtualBox + Docker

## Overview

This repository organizes the work documented in the accompanying 156-page report: linking the synthesized VSDBabySoC netlist with the PLL, DAC and SKY130 HD timing libraries, applying the 11 ns clock constraint, and running setup/hold checks across 18 recorded timing-library cases. The original report is retained in `docs/` and includes terminal screenshots, intermediate debugging, path reports, and raw copied output.

## Repository map

```text
VSDBabySoC_Multi_Corner_STA_Repository/
├── README.md
├── .gitignore
├── LICENSE-NOTICE.md
├── docs/
│   └── VSDBabySoC_STA_Full_Evidence_Report.pdf
├── src/
│   └── sdc/vsdbabysoc_synthesis.sdc
├── scripts/
│   ├── run_opensta_docker_example.sh
│   └── run_sta_corner.tcl
├── results/
│   ├── tables/18_corner_results.csv
│   └── logs/report_text_extracted.txt
└── evidence/
    └── terminal-pages/README.md
```

## Reported inputs

The report lists these files from the original VM project directory:

- `src/lib/vsdbabysoc.synth.v` — synthesized netlist.
- `src/lib/avsdpll.lib` — PLL timing library.
- `src/lib/avsddac.lib` — DAC timing library.
- `src/lib/sky130_fd_sc_hd__*.lib` — selected SKY130 HD standard-cell timing libraries.
- `src/sdc/vsdbabysoc_synthesis.sdc` — clock/timing constraints.
- `18_corner_results.txt` — original run's summarized results.

**Important:** those original netlist and Liberty files were referenced in the report but were not supplied as standalone files with the PDF available for this repository build. They are not fabricated or replaced with dummy files. To rerun analysis, provide the actual files from your VM/project folder. Respect the original PDK/library licensing and distribution rules.

## Timing method

The documented command sequence is:

1. Read the PLL Liberty file.
2. Read the DAC Liberty file.
3. Read one SKY130 HD corner Liberty file.
4. Read the synthesized Verilog netlist and `link_design vsdbabysoc`.
5. Read the SDC.
6. Report max-delay (setup) and min-delay (hold) paths, WNS, TNS, and clock skew.
7. Repeat for each listed corner and record results.

The clock constraint excerpt in `src/sdc/vsdbabysoc_synthesis.sdc` reflects the report: `create_clock -name clk -period 11 [get_pins {pll/CLK}]`. It is a documented excerpt, not a claim that the complete original SDC has been recovered. The report notes that explicit input/output delays were not identified, so interface timing coverage may be incomplete.

## Running (after restoring the real input files)

1. Install Docker and make sure the OpenSTA image used in your working environment is available. The report used `docker run --rm -it -v "$HOME":/data opensta`.
2. Restore the actual source inputs in the layout listed above.
3. Start OpenSTA and use `scripts/run_sta_corner.tcl` as a template. Set `VSDBABYSOC_ROOT` to the project root and `SKY130_LIB` to one exact corner `.lib` file in the OpenSTA environment.
4. Repeat the run for each corner. Preserve the exact stdout/stderr and record the library filename used for each result.

The Tcl file is a reusable template derived from the commands in the report; it has not been independently run here because the original netlist and libraries were not available as separate files.

## Results summary from the report

- 18 cases are listed, including two CCS-noise-labelled cases that the report preserves separately.
- Six listed cases show negative setup WNS / `VIOLATED` setup status.
- The most negative recorded setup WNS is **−62.56 ns** at `ss_n40C_1v28`.
- The most negative recorded setup TNS is **−13957.59 ns** at `ss_n40C_1v28`.
- The recorded hold slack values are positive in all listed rows.
- The report's `PASS`/`CORNER_STATUS` label indicates that a corner run completed; it must not be interpreted as setup timing passing.

The CSV is transcribed from the table in the report and keeps both CCS-noise-labelled rows. See the original PDF for context and raw terminal evidence.

## Limitations and interpretation

- This repository is an evidence-backed analysis package, not the full original RTL/design source tree.
- It does not claim that setup timing is closed; several slow-process cases violate setup timing.
- Positive hold slack does not cancel setup violations.
- The report describes a repeated `default_fanout_load` warning and early unresolved-linking/black-box issues that were later addressed by loading the standard-cell library and linking the design.
- Reproducibility depends on restoring the exact netlist, SDC, Liberty libraries, OpenSTA/Docker version, and working paths.
- The PDF's terminal output and results are the primary evidence; scripts here are templates to help organize a rerun, not a claim of a fresh run.

## Evidence and report

Open `docs/VSDBabySoC_STA_Full_Evidence_Report.pdf` for the full submitted report, including the terminal evidence and appended raw output. `results/logs/report_text_extracted.txt` is a searchable text extraction of that PDF; use the PDF for screenshots and page layout.

## Suggested GitHub repository name

`VSDBabySoC-Multi-Corner-STA`
