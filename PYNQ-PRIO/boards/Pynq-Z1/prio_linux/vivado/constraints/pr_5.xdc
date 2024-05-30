create_pblock pblock_pr_5
resize_pblock pblock_pr_5 -add {SLICE_X106Y25:SLICE_X113Y124}
add_cells_to_pblock pblock_pr_5 [get_cells -quiet [list prio_linux_i/pr_5]]
set_property RESET_AFTER_RECONFIG 1 [get_pblocks pblock_pr_5]
set_property SNAPPING_MODE ROUTING [get_pblocks pblock_pr_5]
set_property PARTPIN_SPREADING 1 [get_pblocks pblock_pr_5]
