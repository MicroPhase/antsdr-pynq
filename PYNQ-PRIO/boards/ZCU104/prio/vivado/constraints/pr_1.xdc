create_pblock pblock_pr_1
resize_pblock pblock_pr_1 -add {SLICE_X100Y300:SLICE_X111Y359 DSP48E2_X13Y120:DSP48E2_X13Y143 RAMB18_X4Y120:RAMB18_X4Y143 RAMB36_X4Y60:RAMB36_X4Y71}
add_cells_to_pblock pblock_pr_1 [get_cells -quiet [list prio_i/pr_1]]
set_property SNAPPING_MODE ON [get_pblocks pblock_pr_1]
