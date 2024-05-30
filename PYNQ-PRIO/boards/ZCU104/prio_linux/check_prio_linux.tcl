set overlay_name "prio_linux"
set design_name "prio_linux"

set fd [open ./${overlay_name}/${overlay_name}.runs/impl_1/${design_name}_wrapper_timing_summary_routed.rpt r]
set timing_met 0
while { [gets $fd line] >= 0 } {
    if [string match {All user specified timing constraints are met.} $line]  {
        set timing_met 1
        break
    }
}
if {$timing_met == 0} {
    puts "ERROR: ${overlay_name} bitstream does not meet timing."
    exit 1
}

set rpts [glob -type f ./${overlay_name}/${overlay_name}.runs/child_*_impl_1/${design_name}_wrapper_timing_summary_routed.rpt]
foreach { rpt } $rpts {
    set fd [open $rpt r]
    set timing_met 0
    while { [gets $fd line] >= 0 } {
        if [string match {All user specified timing constraints are met.} $line]  {
            set timing_met 1
            break
        }
    }
    if {$timing_met == 0} {
    puts "ERROR: ${overlay_name} partial bitstream does not meet timing."
    exit 1
    }
}

puts "Timing constraints are met."
