# UartCtrlRx_test.py
import random

import cocotb
from cocotb.triggers import RisingEdge,Timer
from cocotb.result import TestFailure


# @cocotb.coroutine
async def gen_io_clk_reset_rxd(dut):
    dut.reset = 1
    dut.clk = 0
    dut.io_rxd = 1

    await Timer(500)
    dut.clk = 1
    
    await Timer(500)
    dut.clk = 0
    dut.reset = 0

    # Animate the dut.clk

    while True:
        dut.clk = 1
        await Timer(500)
        dut.clk = 0
        await Timer(500)


# @cocotb.coroutine
async def gen_io_samplingTick(dut):
    dut.io_samplingTick = 0

    while True:
        dut.io_samplingTick = 1
        await Timer(500)
        dut.io_samplingTick = 0
        await Timer(500)        

# @cocotb.coroutine
async def gen_io_rxd(dut,value_rxd):
    
    for i in range (10):
        
        if i == 0 :
            dut.io_rxd = 0
        else :
            if i == 9:
                dut.io_rxd = 1
            else :
                dut.io_rxd = random.randint(0,1)
        await Timer(8000)

        value_rxd.append(dut.io_rxd)


@cocotb.test()
async def test1(dut):
    # cocotb.fork(gen_io_clk_reset_rxd(dut))
    # cocotb.fork(gen_io_samplingTick(dut))

    cocotb.start_soon(gen_io_clk_reset_rxd(dut))
    cocotb.start_soon(gen_io_samplingTick(dut))
    

    counter = 0
    value_rxd = []
    for i in range(1000):
        await RisingEdge(dut.clk)
        counter = counter + 1

        if counter == 9:
            # cocotb.fork(gen_io_rxd(dut,value_rxd))
            cocotb.start_soon(gen_io_rxd(dut,value_rxd))
        if dut.io_read_valid == 1:
            if dut.io_read_payload != value_rxd[1:8]:
                TestFailure( "The output of component not match input rxd signal!")
            counter = 0
            value_rxd = []

        

        


