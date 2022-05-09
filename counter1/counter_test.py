# counter_test.py
from asyncore import read
import random

import cocotb
from cocotb.triggers import RisingEdge, Timer
from cocotb.result import TestFailure

@cocotb.coroutine
def genClockAndReset(dut):
    dut.reset = 1
    dut.clk = 0
    dut.io_clear = 0
    yield Timer(1000,units="ps")
    dut.reset = 0

    # TODO Animate the dut.clk and dut.reset
    while True:
        dut.clk = 1
        yield Timer(500)
        dut.clk = 0
        yield Timer(500)


@cocotb.test()
def test1(dut):
    cocotb.fork(genClockAndReset(dut))

    counter = 0 # Used to model the hardware

    for i in range(10):
        yield RisingEdge(dut.clk)
        
        
        # TODO Check that the DUT match with the model(counter variable)
        # read io_value => dut.io_value
        # read io_full => dut.io_full
        # raise TestFailure("io_value missmatch")
        # raise TestFailure("io_full missmatch")

        if dut.io_value != counter :
            raise TestFailure("io_value missmatch")

        # TODO Animate the model depending DUT inputs
        if dut.io_full != 1:
            if counter == 16 :
                raise TestFailure("io_full missmatch")

        if(dut.io_clear == 1):
            counter = 0
        else:
            counter = (counter + 1) & 0xF

        dut.io_clear = (random.random() < 0.03)

    