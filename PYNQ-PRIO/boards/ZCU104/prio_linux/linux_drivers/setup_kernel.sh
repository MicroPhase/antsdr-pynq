#!/bin/bash

PWD=$(pwd)
cd /
sudo tar xvzf /kernel.tgz # extract the kernel headers: this may take a couple of minutes
cd /usr/src/kernel
sudo make modules_prepare # this won't complete, that is okay
sudo make scripts # this should finish to completion
sudo ln -s /usr/src/kernel/ /lib/modules/$(uname -r)/build # create symbolic link to kernel source
cd $PWD
