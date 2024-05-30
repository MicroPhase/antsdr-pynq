# PYNQ image for AntSDR
## Build instruction

In this section, I will briefly introduce how to make PYNQ SD card Image for ANTSDR. For detail information, please refer to PYNQ SD card.

Pre-conditions:

    Host computer: Ubuntu18.04 LTS ( this is the tested version)
    petalinux 2022.1 (install path /opt/pkg/petalinux/2022.1)
    Vivado/Vitis 2021.1 (This is fine for me to create the e200 Boot.bin, and hdl project)

You should install the required software into the corresponding path .

- Set up the host
```bash
cd PYNQ/sdbuild/scripts/
./setup_host.sh
```

This will take a few minutes to setup the host environment. After it finished, you will the the quem and crosstool-ng folder in /opt .

```bash
 wcc@wcc-dev:/opt$ ls -l /opt/
 total 32
 drwxr-xr-x 6 root root 4096 1月   7  2020 crosstool-ng
 drwxr-xr-x 3 wcc  wcc  4096 1月   4  2020 pkg
 drwxr-xr-x 6 root root 4096 1月   7  2020 qemu
 drwxrwxrwx 6 wcc  wcc  4096 1月   7  2020 Xilinx
```



- Build the SD card Image

```bash
source /opt/pkg/petalinux/2022.1/settings.sh 
source /opt/Xilinx/Vivado/2021.1/settings64.sh
source /opt/Xilinx/Vitis/2021.1/settings64.sh 

cd sdbuild
make BOARDS=e200 # if your board is e310, there should be e310
```

Once PYNQ image is ready, you can find e200's PYNQ image at output folder.
Burn that image into a SD Card.

## Special Note for E200
The Ethernet of E200 is located at PL side, the default Boot.BIN doesn't contain bitstream, this will cause the ethernet could not be detected at boot time, so we need to package bitstream into the Boot.BIN file.
We have a folder `e200_boot_gen`, you can created the Boot.BIN file using this folder.
```bash
cd e200_boot_gen
make sdimg
```
You can find the BOOT.BIN file at `build_sdimg` folder. 
Now you can replace the BOOT.bin file in the boot partition of the SD card with the generated BOOT.BIN file.


## Setup PYNQ for AntSDR
You should insert the SD card into antsdr, connect antsdr to the router with a network cable(the antsdr needs to acess to the internet for building libiio from source at first time), connect to the serial port of antsdr and computer with usb, and power on.

From the serial port terminal, you can see the printed information about PYNQ startup.

Once the PYNQ boot up, you can interact with antsdr through serial port.
```bash
xilinx@pynq:~$ ls
jupyter_notebooks  pynq  REVISION
xilinx@pynq:~$ ifconfig
eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.3.226  netmask 255.255.255.0  broadcast 192.168.3.255
        ether 6a:c7:37:d0:cd:8a  txqueuelen 1000  (Ethernet)
        RX packets 4305  bytes 3915132 (3.9 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 2803  bytes 240798 (240.7 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 29  base 0xb000

eth0:1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.2.99  netmask 255.255.255.0  broadcast 192.168.2.255
        ether 6a:c7:37:d0:cd:8a  txqueuelen 1000  (Ethernet)
        device interrupt 29  base 0xb000

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 726  bytes 74719 (74.7 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 726  bytes 74719 (74.7 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

xilinx@pynq:~$
```
You need to connect the ethernet cable to a router, the following steps will needs antsdr to have an access to network.
```bash
sudo apt update
sudo apt install libxml2 libxml2-dev bison flex cmake git libaio-dev libboost-all-dev libusb-1.0-0-dev libavahi-common-dev libavahi-client-dev
```
- Build and install libiio from source: 
```bash
git clone -b v0.24 https://github.com/analogdevicesinc/libiio.git
cd libiio
mkdir build
cd build
cmake .. -DPYTHON_BINDINGS=ON
make 
sudo make install
cd ../..
```

```bash
git clone https://github.com/analogdevicesinc/libad9361-iio.git
cd libad9361-iio
mkdir build
cd build
cmake .. -DPYTHON_BINDINGS=ON
make 
sudo make install
cd ../..
```
- Install pyadi-iio
```bash
pip3 install pylibiio
pip3 install pyadi-iio
sudo pip3 install pylibiio
sudo pip3 install pyadi-iio
```

## FPGA bitstream reload and devicetree overlay
Since reloading the bit file each time can cause the IIO driver to not work properly, it is necessary to dynamically load the drivers related to AD9361 using device tree overlay. This requires the use of device tree plugins.
You should build the devicetree overlay at your host computer, inside the project, we have a PYNQ-PRIO folder, this folder will help us build the dtbo file.
```bash
wcc@wcc-pc:~/wcc_demo/PYNQ/PYNQ-PRIO$ tree -L 2
.
├── boards
│   ├── e200
│   ├── e310
│   ├── Pynq-Z1
│   └── ZCU104
├── device_tree_overlays
│   ├── dtc-1.4.4
│   ├── install.sh
│   ├── Makefile
│   └── README.md
├── LICENSE
├── README.md
└── setup.py
```

- Run "Install.sh" script.

```bash
cd PYNQ-PRIO/device_tree_overlays
./install.sh
```
Now we can create our overlay:
```bash
make BOARDS=e200
```
You can find the pl.dtbo file at e200's subfolder.
```bash
wcc@wcc-pc:~/wcc_demo/PYNQ/PYNQ-PRIO/boards/e200$ tree -L 3
.
└── prio_linux
    ├── dtbo
    │   └── pl.dtbo
    └── dtso
        └── pl.dts
```

## HDL base project
If you need to develop your own FPGA project, the basic project for E200 is available in the [following link](https://github.com/MicroPhase/hdl/tree/antsdr_fmcomms), this could be your starting point of your own project.
```bash
git clone -b antsdr_fmcomms https://github.com/MicroPhase/hdl.git
source /opt/Xilinx/Vivado/2021.1/settings64.sh 
cd hdl/projects/antsdre200/
make
```