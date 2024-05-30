create_pblock pblock_pr_1
resize_pblock pblock_pr_1 -add {SLICE_X40Y50:SLICE_X43Y99}
add_cells_to_pblock pblock_pr_1 [get_cells -quiet [list prio_i/pr_1]]
set_property RESET_AFTER_RECONFIG 1 [get_pblocks pblock_pr_1]
set_property SNAPPING_MODE ROUTING [get_pblocks pblock_pr_1]
