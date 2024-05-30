create_pblock pblock_pr_3
resize_pblock pblock_pr_3 -add {SLICE_X60Y25:SLICE_X67Y124}
add_cells_to_pblock pblock_pr_3 [get_cells -quiet [list prio_linux_i/pr_3]]
set_property RESET_AFTER_RECONFIG 1 [get_pblocks pblock_pr_3]
set_property SNAPPING_MODE ROUTING [get_pblocks pblock_pr_3]
set_property PARTPIN_SPREADING 1 [get_pblocks pblock_pr_3]
