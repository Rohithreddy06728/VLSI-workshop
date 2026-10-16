# Constraint excerpt documented in the report.
# Verify that pll/CLK exists in the exact netlist before use.
set_units -time ns
create_clock -name clk -period 11 [get_pins {pll/CLK}]

# The report states that explicit input/output delay constraints were not identified.
# Add interface constraints only when actual interface requirements are known.
