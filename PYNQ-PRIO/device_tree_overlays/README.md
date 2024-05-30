Device Tree Overlays
--------------------
To build the device tree overlays, simply run 'make' in this directory.

The makefile in this directory does two things: 
1. Installs a device tree compiler that supports the use of symbols, as well as any needed dependencies.
2. Builds the device tree overlays for the specified boards. 

To build for a specific board, use BOARDS={board name}. If the BOARDS variable is not set as a command line arguement, then it will default to create overlays for both the Pynq-Z1 and ZCU104. 

All device tree overlay source files should be placed in {BOARDS}/prio_linux/dtso/. The produced files will be located in {BOARDS}/prio_linux/dtbo/.
