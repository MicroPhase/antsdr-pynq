
# PYNQ Framework for ANTSDR

![alt tag](images/logo.png)

This project  was inspired by [PYNQ](https://github.com/Xilinx/PYNQ) and  [PlutoSDR](https://github.com/analogdevicesinc/plutosdr-fw.git).  There are already many SDR platforms based on ZYNQ and AD9361,  so does ANTSDR.

When we saw the [PYNQ_RFSOC](https://github.com/Xilinx/PYNQ_RFSOC_Workshop), we thought PYNQ might also be a good SDR Framework.  Due to the high price of RFSOC, we think we can make a product with similar functions based on ANTSDR.

Finally, we  transplanted PYNQ framework into ANTSDR successfully. Through the python binding of [libiio](https://github.com/analogdevicesinc/libiio.git) and python interface [pyadi-iio](https://github.com/analogdevicesinc/pyadi-iio.git) provided by [ADI](https://www.analog.com/en/index.html), we can use PYNQ to interact with AD9361.  Although the performance of ZYNQ7020+AD9361 may not be the same as RFSoC, it is also a good attempt for us.

## Build instruction 

In this section, I will briefly introduce how to make PYNQ SD card Image for ANTSDR. For detail information, please refer to [PYNQ SD card](https://pynq.readthedocs.io/en/latest/pynq_sd_card.html).

- Pre-conditions:
	- Host computer: Ubuntu16.04 LTS ( this is the tested version)
	-  Vivado 2018.3 (intall path /opt/Xilinx)
	-  petalinux 2018.3 (intall path /opt/pkg/petalinux/2018.3)
	You should install the required software into the corresponding path first.


- Set up the host
	```bash
	git clone --recursive https://github.com/MicroPhase/ANTSDR_PYNQ.git
	cd ANTSDR_PYNQ/sdbuild/scripts/
	./setup_host.sh
	```
	This will take a few minutes to setup the host environment. After it finished, you will the the  **quem** and **crosstool-ng** folder in  /opt .

	```bash
	wcc@wcc-dev:/opt$ ls -l /opt/
	total 32
	drwxr-xr-x 6 root root 4096 1月   7  2020 crosstool-ng
	drwxr-xr-x 3 wcc  wcc  4096 1月   4  2020 pkg
	drwxr-xr-x 6 root root 4096 1月   7  2020 qemu
	drwxrwxrwx 6 wcc  wcc  4096 1月   7  2020 Xilinx
	```

- Build the SD card Image
Now you can build the image from scratch, you can either build from source code or build from offline root file system. I would recommend the second way.
	- Build from offline rootfs 
	You can download the offline PYNQ rootfs from this link: https://www.xilinx.com/member/forms/download/xef.html?filename=pynq_rootfs_arm_v2.4.zip.
	You can unzip this file to a folder and start to build the image. For example
        ```bash
        mkdir sdbuild/prebuilt
        unzip -d  sdbuild/prebuilt  pynq_rootfs_arm_v2.4.zip
        cd sdbuild
        make BOARDS=../../antsdr  PREBUILT=./prebuilt/bionic.arm.2.4.img
        ```
	- Build from source code
        ```bash
        cd sdbuild
        make BOARDS=ANTSDR 
        ```
	You can find the output image **ANTSDR-2.4.img** in the **sdbuild/output** folder.

## Setup the PYNQ for antsdr

Once you have finished building the image, you can let ANTSDR to become a  PYNQ  SDR.

- Burn the image into  a SD card
	- In linux
		```bash
		sudo dd if=sdbuild/output/ANTSDR-2.4.img of=/dev/sdb bs=4M
		```
	- In windows
	you can use win32diskmanger or other software to burn the sd card.

- Boot up antsdr 

You should insert the SD card into antsdr, connect antsdr to the router with a network cable(the antsdr needs to acess to the internet for building libiio from source), connect to the serial port of antsdr and computer with usb, and power on.
![antsdr connection](images/connect_antsdr.png)

	
## Licenses

**PYNQ** License : [BSD 3-Clause License](https://github.com/Xilinx/PYNQ/blob/master/LICENSE)

**Xilinx Embedded SW** License : [Multiple License File](https://github.com/Xilinx/embeddedsw/blob/master/license.txt)

**Digilent IP** License: [MIT License](https://github.com/Xilinx/PYNQ/blob/master/THIRD_PARTY_LIC)

**ADI meta layer** License: [MIT License](https://github.com/analogdevicesinc/meta-adi/blob/master/LICENSE)

**ADI hdl** License: [Multiple License File](https://github.com/analogdevicesinc/hdl/blob/master/LICENSE)