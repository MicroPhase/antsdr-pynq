create_pblock pblock_pr_2
resize_pblock pblock_pr_2 -add {SLICE_X89Y240:SLICE_X99Y299 DSP48E2_X12Y96:DSP48E2_X12Y119 RAMB18_X3Y96:RAMB18_X3Y119 RAMB36_X3Y48:RAMB36_X3Y59}
add_cells_to_pblock pblock_pr_2 [get_cells -quiet [list prio_linux_i/pr_2]]
set_property SNAPPING_MODE ON [get_pblocks pblock_pr_2]
