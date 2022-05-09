import random

import cocotb

from cocotblib.misc import SimulationTimeout
from common import pixelSolverTester


@cocotb.test()
def test1(dut):
    cocotb.fork(SimulationTimeout(1000 * 80000))
    yield pixelSolverTester(dut)
