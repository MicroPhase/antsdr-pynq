create_pblock pblock_pr_3
resize_pblock pblock_pr_3 -add {SLICE_X56Y50:SLICE_X59Y99}
add_cells_to_pblock pblock_pr_3 [get_cells -quiet [list prio_i/pr_3]]
set_property RESET_AFTER_RECONFIG 1 [get_pblocks pblock_pr_3]
set_property SNAPPING_MODE ROUTING [get_pblocks pblock_pr_3]
