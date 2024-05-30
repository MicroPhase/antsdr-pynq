create_pblock pblock_pr_0
resize_pblock pblock_pr_0 -add {SLICE_X28Y25:SLICE_X35Y124}
add_cells_to_pblock pblock_pr_0 [get_cells -quiet [list prio_linux_i/pr_0]]
set_property RESET_AFTER_RECONFIG 1 [get_pblocks pblock_pr_0]
set_property SNAPPING_MODE ROUTING [get_pblocks pblock_pr_0]
set_property PARTPIN_SPREADING 1 [get_pblocks pblock_pr_0]
