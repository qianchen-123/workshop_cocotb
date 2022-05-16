# axi_sram_test.py


import random

import cocotb
from cocotb.triggers import RisingEdge, Timer
from cocotb.result import TestFailure

async def gen_clk(dut):
    dut.ACLK = 1
    dut.ARESETn = 1

    await Timer(500)
    dut.ACLK = 0
    dut.ARESETn = 0

    await Timer(500)
    dut.ARESETn = 1

    while True:
        dut.ACLK = 1
        await Timer(500)
        dut.ACLK = 0
        await Timer(500)


async def gen_burst_write_transaction(dut,Burst_len):
    # --- write addr channel transaction --- #
    while dut.AWREADY == 0 :
        await RisingEdge(dut.ACLK)
        dut.AWID = 1
        dut.AWADDR = 0x0000
        dut.AWLEN = Burst_len
        dut.AWSIZE = 0
        dut.AWBURST = 1
        dut.AWVALID = 1

    await RisingEdge(dut.ACLK)
    dut.AWVALID = 0

    # --- write data channel transaction --- #
    Burst_len_counter = 0
    DATA = random.randint(0,2^8-1)
    while  Burst_len_counter < Burst_len - 1:
        await RisingEdge(dut.ACLK)
        dut.WID = 1
        dut.WDATA = DATA
        dut.WVALID = 1

        if dut.WREADY == 1 :
            Burst_len_counter += 1
            DATA = random.randint(0,2^8-1)

        if Burst_len_counter == Burst_len - 1:
            dut.WLAST = 1
    await RisingEdge(dut.ACLK)
    dut.WVALID = 0
    dut.WLAST = 0
    

    # --- write response channel transaction --- #
    await RisingEdge(dut.BVALID)
    dut.BREADY = 1
    if dut.BID != 1 :
        TestFailure("Master ID missmatch !")
    await RisingEdge(dut.ACLK)
    dut.BREADY = 0


async def gen_burst_read_transaction(dut,Burst_len):
    # --- read addr channel transaction --- #
    while dut.ARREADY == 0:
        await RisingEdge(dut.ACLK)
        dut.ARID = 1
        dut.ARADDR = 0x0000
        dut.ARLEN = Burst_len
        dut.ARSIZE = 0
        dut.ARBURST = 1
        dut.ARVALID = 1

    await RisingEdge(dut.ACLK)
    dut.ARVALID = 0

    # --- read data channel transaction --- #
    Burst_len_counter = 0
    DATA = []
    while Burst_len_counter < Burst_len - 1:
        await RisingEdge(dut.ACLK)
        DATA.append(dut.RDATA)
        if dut.RVALID == 1:
            dut.RREADY = 1
            Burst_len_counter += 1

@cocotb.test()
async def axi_sram_test(dut):
    cocotb.start_soon(gen_clk(dut))

    Burst_len = 8

    await Timer(2000)

    await gen_burst_write_transaction(dut,Burst_len)

    await RisingEdge(dut.ACLK)

    await gen_burst_read_transaction(dut,Burst_len)

    await RisingEdge(dut.ACLK)
    await RisingEdge(dut.ACLK)
    await RisingEdge(dut.ACLK)

    


        
        

    

