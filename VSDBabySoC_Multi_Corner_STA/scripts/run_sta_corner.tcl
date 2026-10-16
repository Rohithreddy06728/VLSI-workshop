# OpenSTA single-corner template based on the command sequence documented in the report.
# Run from OpenSTA after setting the variables below to files that actually exist.
# Do not assume the report's old VM paths exist on another machine.

if {![info exists ::env(VSDBABYSOC_ROOT)]} {
  puts stderr "Set VSDBABYSOC_ROOT to the folder containing src/lib and src/sdc."
  exit 2
}
if {![info exists ::env(SKY130_LIB)]} {
  puts stderr "Set SKY130_LIB to the selected sky130_fd_sc_hd Liberty file."
  exit 2
}
set root $::env(VSDBABYSOC_ROOT)
set pll_lib [file join $root src lib avsdpll.lib]
set dac_lib [file join $root src lib avsddac.lib]
set netlist [file join $root src lib vsdbabysoc.synth.v]
set sdc [file join $root src sdc vsdbabysoc_synthesis.sdc]
foreach f [list $pll_lib $dac_lib $netlist $sdc $::env(SKY130_LIB)] {
  if {![file exists $f]} { puts stderr "Required input not found: $f"; exit 2 }
}
read_liberty $pll_lib
read_liberty $dac_lib
read_liberty $::env(SKY130_LIB)
read_verilog $netlist
link_design vsdbabysoc
read_sdc $sdc
puts "===== SETUP PATH ====="
report_checks -path_delay max -group_path_count 1 -format full_clock_expanded
puts "===== HOLD PATH ====="
report_checks -path_delay min -group_path_count 1 -format full_clock_expanded
puts "===== WNS ====="
report_wns
puts "===== TNS ====="
report_tns
puts "===== CLOCK SKEW ====="
report_clock_skew
