# timer.py
import random

import cocotb
from cocotb.triggers import RisingEdge,Timer,FallingEdge
from cocotb.result import TestFailure

async def gen_rst_clk(dut):
    dut.clk = 1
    dut.reset = 1

    await Timer(500)
    dut.clk = 0
    dut.reset = 0

    while True:
        dut.clk = 1
        dut.reset = 0
        await Timer(500)
        dut.clk = 0
        await Timer(500)

async def gen_io_tick_limit(dut):
    while True:
        dut.io_tick = random.randint(0,1)
        a = random.randint(0,2^16-1)
        dut.io_limit = a
        for i in range (a):
            await RisingEdge(dut.clk)

async def gen_io_clear(dut):
    while True:
        dut.io_clear = random.randint(0,1)
        for i in range (random.randint(0,10)):
            await RisingEdge(dut.clk)  

@cocotb.test()
async def timer_test(dut):

    # await gen_rst_clk(dut)
    # cocotb.start_soon(gen_rst_clk(dut))
    cocotb.start_soon(gen_io_tick_limit(dut))
    cocotb.start_soon(gen_io_clear(dut))

    counter = 0

    for i in range (1000):
        await RisingEdge(dut.clk)

        if (i > 20):
            if(dut.io_clear == 0) & (dut.reset == 0):
                if(dut.io_tick == 1):
                    counter = counter + 1
                    if(counter != dut.io_limit):
                        if(counter != dut.io_value):
                            TestFailure("value not match !")
                    else :
                        if(dut.io_full != 1):
                            TestFailure("dut.io_full not work !")
            else:
                counter = 0

            