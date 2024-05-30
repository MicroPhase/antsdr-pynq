create_pblock pblock_pr_3
resize_pblock pblock_pr_3 -add {SLICE_X100Y240:SLICE_X111Y299 DSP48E2_X13Y96:DSP48E2_X13Y119 RAMB18_X4Y96:RAMB18_X4Y119 RAMB36_X4Y48:RAMB36_X4Y59}
add_cells_to_pblock pblock_pr_3 [get_cells -quiet [list prio_linux_i/pr_3]]
set_property SNAPPING_MODE ON [get_pblocks pblock_pr_3]
