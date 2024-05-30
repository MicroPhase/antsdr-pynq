create_pblock pblock_pr_1
resize_pblock pblock_pr_1 -add {SLICE_X38Y25:SLICE_X45Y124}
add_cells_to_pblock pblock_pr_1 [get_cells -quiet [list prio_linux_i/pr_1]]
set_property RESET_AFTER_RECONFIG 1 [get_pblocks pblock_pr_1]
set_property SNAPPING_MODE ROUTING [get_pblocks pblock_pr_1]
set_property PARTPIN_SPREADING 1 [get_pblocks pblock_pr_1]
