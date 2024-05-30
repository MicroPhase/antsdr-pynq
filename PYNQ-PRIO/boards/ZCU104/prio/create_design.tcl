set overlay_name "prio"
set design_name "prio"

# open block design
open_project ./${overlay_name}/${overlay_name}.xpr
open_bd_design ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/${design_name}.bd
validate_bd_design
save_bd_design

# change synthesis option to out of context per IP
set_property generate_synth_checkpoint true [get_files ${design_name}.bd]

# create the top wrapper file for bd design
add_files -norecurse [make_wrapper -files [get_files ${design_name}.bd] -top]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# save the design
save_bd_design
