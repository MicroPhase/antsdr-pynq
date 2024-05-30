# PYNQ-PRIO PIP INSTALL Package

This repository contains the pip install package for the Partially-Reconfigurable Input/Output (PRIO) Project on the PYNQ. It demonstrates how to leverage the PYNQ package in the following ways:
 - Using partial reconfiguration to create more flexible and dynamic designs
 - Using device tree overlay's to better integrate dynamically changing designs and Linux

Below is a high level overview of our flow for using partial reconfiguration and device tree overlays.

![alt text](https://github.com/byuccl/PYNQ-PRIO/blob/master/.images/Partial_Reconfig_Flow.jpeg "Partial Reconfig Flow")

![alt text](https://github.com/byuccl/PYNQ-PRIO/blob/master/.images/Device_Tree_Overlay_Flow.jpeg "Device Tree Overlay Flow")

## Quick Start

In order to install it on your PYNQ, you're PYNQ must be running the v2.5 image. The 2.5 image for the PYNQ-Z1 can be found <a href="http://pynq.io" target="_blank">here</a>. See the <a href="http://pynq.readthedocs.io/en/latest/getting_started.html" target="_blank">Quickstart guide</a> for details on writing the image to an SD card.

To install the PRIO project, run the following command from a terminal connected to your board:

```console
sudo -H pip3 install git+https://github.com/byuccl/PYNQ-PRIO.git
```
The pip install will create a partial_reconfig folder in  ~/pynq/overlays/ on the PYNQ board. This directory will contain the necessary files, including bitstreams and python files, that are needed for Partial-Reconfiguration on the PYNQ.

The pip package will also create a partial_reconfig directory in ~/jupyter_notebooks on the PYNQ. This folder will contain documentation to help you get started, as well as demos that can you show how to use Partial-Reconfigurable Input/Output in various applications.

To get started go, to ~/jupyter_notebooks/prio/Getting_Started_Partial_Reconfiguration_Input_Output.ipynb in Jupyter Notebooks for further details.

## Board Files and Overlays

All board related files including Vivado projects, bitstreams, and example notebooks, can be found in the `/boards` folder.

In Linux, you can rebuild the overlay by running *make* in the corresponding overlay folder (e.g. `/boards/Pynq-Z1/prio`). In Windows, you need to source the appropriate tcl files in the corresponding overlay folder.
