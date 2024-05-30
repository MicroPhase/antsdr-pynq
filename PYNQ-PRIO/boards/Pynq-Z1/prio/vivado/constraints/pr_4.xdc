create_pblock pblock_pr_4
resize_pblock pblock_pr_4 -add {SLICE_X60Y50:SLICE_X63Y99}
add_cells_to_pblock pblock_pr_4 [get_cells -quiet [list prio_i/pr_4]]
set_property RESET_AFTER_RECONFIG 1 [get_pblocks pblock_pr_4]
set_property SNAPPING_MODE ROUTING [get_pblocks pblock_pr_4]
