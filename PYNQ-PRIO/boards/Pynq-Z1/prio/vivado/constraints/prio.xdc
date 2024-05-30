## Switches
#set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS33} [get_ports {sws_2bits_tri_i[0]}]
#set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS33} [get_ports {sws_2bits_tri_i[1]}]

## Buttons
#set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS33} [get_ports {btns_4bits_tri_i[0]}]
#set_property -dict {PACKAGE_PIN D20 IOSTANDARD LVCMOS33} [get_ports {btns_4bits_tri_i[1]}]
#set_property -dict {PACKAGE_PIN L20 IOSTANDARD LVCMOS33} [get_ports {btns_4bits_tri_i[2]}]
#set_property -dict {PACKAGE_PIN L19 IOSTANDARD LVCMOS33} [get_ports {btns_4bits_tri_i[3]}]

## LEDs
#set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS33} [get_ports {pr_0_tri_io[0]}]
#set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {pr_0_tri_io[1]}]
#set_property -dict {PACKAGE_PIN N16 IOSTANDARD LVCMOS33} [get_ports {pr_0_tri_io[2]}]
#set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {pr_0_tri_io[3]}]

## RGBLEDs
#set_property -dict { PACKAGE_PIN L15   IOSTANDARD LVCMOS33 } [get_ports { rgbleds_6bits_tri_o[0] }];
#set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { rgbleds_6bits_tri_o[1] }];
#set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { rgbleds_6bits_tri_o[2] }];
#set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { rgbleds_6bits_tri_o[3] }];
#set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { rgbleds_6bits_tri_o[4] }];
#set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { rgbleds_6bits_tri_o[5] }];



## Arduino shield digital io pins 0-7, pr__0
set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports {pr_0_tri_io[0]}]
set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports {pr_0_tri_io[1]}]
set_property -dict {PACKAGE_PIN U13 IOSTANDARD LVCMOS33} [get_ports {pr_0_tri_io[2]}]
set_property -dict {PACKAGE_PIN V13 IOSTANDARD LVCMOS33} [get_ports {pr_0_tri_io[3]}]
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {pr_0_tri_io[4]}]
set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports {pr_0_tri_io[5]}]
set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS33} [get_ports {pr_0_tri_io[6]}]
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {pr_0_tri_io[7]}]

### Arduino shield digital io pins 8-13, pr__1
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {pr_1_tri_io[0]}]
set_property -dict {PACKAGE_PIN V18 IOSTANDARD LVCMOS33} [get_ports {pr_1_tri_io[1]}]
set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports {pr_1_tri_io[2]}]
set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports {pr_1_tri_io[3]}]
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports {pr_1_tri_io[4]}]
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports {pr_1_tri_io[5]}]

### Map the last two pins in pr_1 elsewhere, they are not being used
set_property -dict {PACKAGE_PIN V11 IOSTANDARD LVCMOS33} [get_ports {pr_1_tri_io[6]}]
set_property -dict {PACKAGE_PIN V20 IOSTANDARD LVCMOS33} [get_ports {pr_1_tri_io[7]}]

### ChipKit GPIO signals top inner header pins 26-33, pr_2
set_property -dict { PACKAGE_PIN U5    IOSTANDARD LVCMOS33 } [get_ports { pr_2_tri_io[0] }]; #IO_L19N_T3_VREF_13 Sch=ck_io[26]
set_property -dict { PACKAGE_PIN V5    IOSTANDARD LVCMOS33 } [get_ports { pr_2_tri_io[1] }]; #IO_L6N_T0_VREF_13 Sch=ck_io[27]
set_property -dict { PACKAGE_PIN V6    IOSTANDARD LVCMOS33 } [get_ports { pr_2_tri_io[2] }]; #IO_L22P_T3_13 Sch=ck_io[28]
set_property -dict { PACKAGE_PIN U7    IOSTANDARD LVCMOS33 } [get_ports { pr_2_tri_io[3] }]; #IO_L11P_T1_SRCC_13 Sch=ck_io[29]
set_property -dict { PACKAGE_PIN V7    IOSTANDARD LVCMOS33 } [get_ports { pr_2_tri_io[4] }]; #IO_L11N_T1_SRCC_13 Sch=ck_io[30]
set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS33 } [get_ports { pr_2_tri_io[5] }]; #IO_L17N_T2_13 Sch=ck_io[31]
set_property -dict { PACKAGE_PIN V8    IOSTANDARD LVCMOS33 } [get_ports { pr_2_tri_io[6] }]; #IO_L15P_T2_DQS_13 Sch=ck_io[32]
set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { pr_2_tri_io[7] }]; #IO_L21N_T3_DQS_13 Sch=ck_io[33]

### ChipKit GPIO signals top inner header pins 34-41, pr_3
set_property -dict { PACKAGE_PIN W10   IOSTANDARD LVCMOS33 } [get_ports { pr_3_tri_io[0] }]; #IO_L16P_T2_13 Sch=ck_io[34]
set_property -dict { PACKAGE_PIN W6    IOSTANDARD LVCMOS33 } [get_ports { pr_3_tri_io[1] }]; #IO_L22N_T3_13 Sch=ck_io[35]
set_property -dict { PACKAGE_PIN Y6    IOSTANDARD LVCMOS33 } [get_ports { pr_3_tri_io[2] }]; #IO_L13N_T2_MRCC_13 Sch=ck_io[36]
set_property -dict { PACKAGE_PIN Y7    IOSTANDARD LVCMOS33 } [get_ports { pr_3_tri_io[3] }]; #IO_L13P_T2_MRCC_13 Sch=ck_io[37]
set_property -dict { PACKAGE_PIN W8    IOSTANDARD LVCMOS33 } [get_ports { pr_3_tri_io[4] }]; #IO_L15N_T2_DQS_13 Sch=ck_io[38]
set_property -dict { PACKAGE_PIN Y8    IOSTANDARD LVCMOS33 } [get_ports { pr_3_tri_io[5] }]; #IO_L14N_T2_SRCC_13 Sch=ck_io[39]
set_property -dict { PACKAGE_PIN W9    IOSTANDARD LVCMOS33 } [get_ports { pr_3_tri_io[6] }]; #IO_L16N_T2_13 Sch=ck_io[40]
set_property -dict { PACKAGE_PIN Y9    IOSTANDARD LVCMOS33 } [get_ports { pr_3_tri_io[7] }]; #IO_L14P_T2_SRCC_13 Sch=ck_io[41]

### pmod Header JA, pr_4
set_property -dict {PACKAGE_PIN Y18 IOSTANDARD LVCMOS33} [get_ports {pr_4_tri_io[0]}]
set_property -dict {PACKAGE_PIN Y19 IOSTANDARD LVCMOS33} [get_ports {pr_4_tri_io[1]}]
set_property -dict {PACKAGE_PIN Y17 IOSTANDARD LVCMOS33} [get_ports {pr_4_tri_io[3]}]
set_property -dict {PACKAGE_PIN Y16 IOSTANDARD LVCMOS33} [get_ports {pr_4_tri_io[2]}]
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports {pr_4_tri_io[5]}]
set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports {pr_4_tri_io[4]}]
set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports {pr_4_tri_io[7]}]
set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports {pr_4_tri_io[6]}]

### pmod Header JB, pr_5
set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports {pr_5_tri_io[0]}]
set_property -dict {PACKAGE_PIN Y14 IOSTANDARD LVCMOS33} [get_ports {pr_5_tri_io[1]}]
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {pr_5_tri_io[3]}]
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {pr_5_tri_io[2]}]
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports {pr_5_tri_io[5]}]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {pr_5_tri_io[4]}]
set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33} [get_ports {pr_5_tri_io[7]}]
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {pr_5_tri_io[6]}]
