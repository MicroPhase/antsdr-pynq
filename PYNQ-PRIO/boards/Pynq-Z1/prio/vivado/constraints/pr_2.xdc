create_pblock pblock_pr_2
resize_pblock pblock_pr_2 -add {SLICE_X44Y50:SLICE_X47Y99}
add_cells_to_pblock pblock_pr_2 [get_cells -quiet [list prio_i/pr_2]]
set_property RESET_AFTER_RECONFIG 1 [get_pblocks pblock_pr_2]
set_property SNAPPING_MODE ROUTING [get_pblocks pblock_pr_2]
