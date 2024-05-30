#PATH=$PATH:/opt/Xilinx/SDK/2015.4/gnu/arm/lin/bin

VIVADO_VERSION ?= 2019.1
CROSS_COMPILE ?= arm-linux-gnueabihf-

SDIMGDIR = $(CURDIR)/build_sdimg
sdimg: 
	mkdir $(SDIMGDIR)

	touch 	$(SDIMGDIR)/boot.bif
	echo "img : {[bootloader] ./zynq_fsbl.elf  system_top.bit  u-boot.elf [load=0x00100000]system.dtb}" >  $(SDIMGDIR)/boot.bif
	bash -c "bootgen -image $(SDIMGDIR)/boot.bif -o i $(SDIMGDIR)/BOOT.bin"

clean:
	rm -rf $(SDIMGDIR)