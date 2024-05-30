from pynq.overlay import Overlay


class PrIoOverlay(Overlay):

	PARTIAL_BITSTREAM_PATH = "/usr/local/lib/python3.6/dist-packages/prio/partial/"

	def __init__(self, bitfile_name):
		super().__init__(bitfile_name)

	def download(self, partial_bit=None):
		if partial_bit is not None:
			partial_bit = self.PARTIAL_BITSTREAM_PATH + partial_bit 
		super().download(partial_bit)