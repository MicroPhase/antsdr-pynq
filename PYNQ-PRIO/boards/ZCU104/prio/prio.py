from pynq.overlay import Overlay
from pynq import GPIO

class PrIoOverlay(Overlay):
	FULL_BITSTREAM_PATH = "/usr/local/lib/python3.6/dist-packages/prio/"
	PARTIAL_BITSTREAM_PATH = "/usr/local/lib/python3.6/dist-packages/prio/partial/"

	def __init__(self, bitfile_name):
		super().__init__(bitfile_name)

	def download(self, partial_bit=None):
		if partial_bit is not None:
			decoupler = GPIO(int(partial_bit[len(self.PARTIAL_BITSTREAM_PATH) + 3]) + GPIO.get_gpio_base(), 'out')
			decoupler.write(1)
		super().download(partial_bit)
		if partial_bit is not None:
			decoupler.write(0)
