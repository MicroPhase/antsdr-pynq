create_pblock pblock_pr_0
resize_pblock pblock_pr_0 -add {SLICE_X89Y300:SLICE_X99Y359 DSP48E2_X12Y120:DSP48E2_X12Y143 RAMB18_X3Y120:RAMB18_X3Y143 RAMB36_X3Y60:RAMB36_X3Y71}
add_cells_to_pblock pblock_pr_0 [get_cells -quiet [list prio_linux_i/pr_0]]
set_property SNAPPING_MODE ON [get_pblocks pblock_pr_0]
