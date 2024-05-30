set overlay_name "prio_linux"
set design_name "prio_linux"

# six of each of these
#variable pr_array
array set pr_array {
  0 pr_0
  1 pr_1
  2 pr_2
  3 pr_3
  4 pr_4
  5 pr_5
}

array set pd_array {
  0 pd_pr_0
  1 pd_pr_1
  2 pd_pr_2
  3 pd_pr_3
  4 pd_pr_4
  5 pd_pr_5
}

# as many of these as we have sub designs
array set rm_array {
  0 uart
  1 gpio
  2 led_pattern
  3 iic
}

# open project and block design
open_project -quiet ./${overlay_name}/${overlay_name}.xpr
open_bd_design ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/${design_name}.bd
set_param project.enablePRFlowIPI 1
set_param bitstream.enablePR 2341
set_param hd.enablePR 1234

# synthesis
launch_runs synth_1 -jobs 8
wait_on_run synth_1

set proj_pr_flow [get_property PR_FLOW [current_project]]
if {$proj_pr_flow == 1} {
   setup_pr_configuration -v
}

# implementation
set_property flow {Vivado Implementation 2018} [get_runs impl_1]
set_property STEPS.PLACE_DESIGN.DIRECTIVE AltSpreadLogic_high [get_runs impl_1]
set_property STEPS.PHYS_OPT_DESIGN.IS_ENABLED true [get_runs impl_1]
set_property STEPS.PHYS_OPT_DESIGN.DIRECTIVE AggressiveExplore [get_runs impl_1]
set_property STEPS.ROUTE_DESIGN.DIRECTIVE AlternateCLBRouting [get_runs impl_1]


launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
file copy -force ./${overlay_name}/${overlay_name}.runs/impl_1/${design_name}_wrapper.bit ${overlay_name}.bit

set child_impl_runs [get_runs child_*]
foreach  { impl_run } $child_impl_runs  {

    set_property flow {Vivado Implementation 2018} $impl_run
    set_property STEPS.PLACE_DESIGN.DIRECTIVE AltSpreadLogic_high $impl_run
    set_property STEPS.PHYS_OPT_DESIGN.IS_ENABLED true $impl_run
    set_property STEPS.PHYS_OPT_DESIGN.DIRECTIVE AggressiveExplore $impl_run
    set_property STEPS.ROUTE_DESIGN.DIRECTIVE AlternateCLBRouting $impl_run

    launch_runs $impl_run -to_step write_bitstream -jobs 8
    wait_on_run $impl_run
    set bits [glob -type f ./${overlay_name}/${overlay_name}.runs/${impl_run}/*_partial.bit]
    foreach { bit } $bits {
        file copy -force $bit ./partial/
    }
}

# copy project hwh file
file copy -force ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/hw_handoff/${design_name}.hwh ${overlay_name}.hwh

# rename partial bit files and copy over hwh files
foreach n [array names pr_array] {
  foreach r [array names rm_array] {
    file rename -force ./partial/${design_name}_i_$pr_array($n)_rm_$rm_array($r)_$pd_array($n)_partial.bit ./partial/$pr_array($n)_$rm_array($r).bit
    file copy -force ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/rm_$rm_array($r)_$pd_array($n)/hw_handoff/rm_$rm_array($r)_$pd_array($n).hwh ./partial/$pr_array($n)_$rm_array($r).hwh
  }
}
