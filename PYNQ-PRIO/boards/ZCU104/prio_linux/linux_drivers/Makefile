# obj-y := iic/ xil_gpio/ spidev/ uart/
obj-y :=  byu_gpio/ # uart/ iic/ 

BUILDSYSTEM_DIR:=/lib/modules/$(shell uname -r)/build
PWD:=$(shell pwd)

all: 
	# run kernel build system to make module
	$(MAKE) -C $(BUILDSYSTEM_DIR) M=$(PWD) modules

clean: 
	# run kernel build system to clean modules
	$(MAKE) -C $(BUILDSYSTEM_DIR) M=$(PWD) clean

install:
	# run kernel build system to install modules
	$(MAKE) -C $(BUILDSYSTEM_DIR) M=$(PWD) modules_install
	depmod -a
	echo "go add the prefix of the .ko for the drivers you want loaded at boot in /etc/modules"

