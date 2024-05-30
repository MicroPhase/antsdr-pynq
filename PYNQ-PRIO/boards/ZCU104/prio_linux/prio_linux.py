from pynq.overlay import Overlay
from pynq import GPIO

class PrIoOverlay(Overlay):
	FULL_BITSTREAM_PATH = "/usr/local/lib/python3.6/dist-packages/prio/"
	PARTIAL_BITSTREAM_PATH = "/usr/local/lib/python3.6/dist-packages/prio/partial/"
	PARTIAL_BITSTREAM_PATH_LINUX = "/usr/local/lib/python3.6/dist-packages/prio/partial_linux/"

	def __init__(self, bitfile_name, dtbo=None, download=True, ignore_version=False):
		super().__init__(bitfile_name)

	def pr_download(self, partial_region, partial_bit, dtbo_path=None):
		decoupler = GPIO(int(partial_region[3]) + GPIO.get_gpio_base(), 'out')
		decoupler.write(1)
		super().pr_download(partial_region, partial_bit, dtbo_path)
		decoupler.write(0)
