create_pblock pblock_pr_4
resize_pblock pblock_pr_4 -add {SLICE_X94Y25:SLICE_X101Y124}
add_cells_to_pblock pblock_pr_4 [get_cells -quiet [list prio_linux_i/pr_4]]
set_property RESET_AFTER_RECONFIG 1 [get_pblocks pblock_pr_4]
set_property SNAPPING_MODE ROUTING [get_pblocks pblock_pr_4]
set_property PARTPIN_SPREADING 1 [get_pblocks pblock_pr_4]
