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
    dut.io_Arbiter_Out_ready = 1

    for i in range(100):
        yield RisingEdge(dut.clk)
        
        
        # TODO Check that the DUT match with the model(counter variable)
        # read io_value => dut.io_value
        # read io_full => dut.io_full
        # raise TestFailure("io_value missmatch")
        # raise TestFailure("io_full missmatch")
        
        if (counter % 4 == 0) :
            dut.io_Arbiter_In_0_valid = 1
            dut.io_Arbiter_In_0_payload = counter
        elif (counter % 4 == 1) :
            dut.io_Arbiter_In_1_valid = 1
            dut.io_Arbiter_In_1_payload = counter
        elif (counter % 4 == 2) :
            dut.io_Arbiter_In_2_valid = 1
            dut.io_Arbiter_In_2_payload = counter
        elif (counter % 4 == 3) :
            dut.io_Arbiter_In_3_valid = 1
            dut.io_Arbiter_In_3_payload = counter

        counter = (counter + 1 )&0xFFFF_FFFF

        
    
