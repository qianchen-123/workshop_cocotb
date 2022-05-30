# axi_sram_test.py


import random

import cocotb
from cocotb.triggers import RisingEdge, Timer
from cocotb.result import TestFailure

async def gen_clk(dut):
    dut.clk.value = 1
    dut.reset.value = 0

    await Timer(500)
    dut.clk.value = 0
    dut.reset.value = 1

    await Timer(500)
    dut.reset.value = 0

    while True:
        dut.clk.value = 1
        await Timer(500)
        dut.clk.value = 0
        await Timer(500)


async def gen_burst_write_transaction(dut,Burst_len):
    # --- write addr channel transaction --- #
    while dut.io_axi_in_aw_ready.value == 0 :        
        dut.io_axi_in_aw_payload_id.value = 1
        dut.io_axi_in_aw_payload_addr.value = 0x0000
        dut.io_axi_in_aw_payload_len.value = Burst_len
        dut.io_axi_in_aw_payload_size.value = 0
        dut.io_axi_in_aw_payload_burst.value = 1
        dut.io_axi_in_aw_valid.value = 1
        await RisingEdge(dut.clk)

    await RisingEdge(dut.clk)
    dut.io_axi_in_aw_valid.value = 0
    # print("hahahahahhah")

    # --- write data channel transaction --- #
    Burst_len_counter = 0
    DATA = random.randint(0,2^8-1)
    while  Burst_len_counter < Burst_len - 1:
        print("hahahahahhah")
        await RisingEdge(dut.clk)
        # dut.WID = 1
        dut.io_axi_in_w_payload_data.value = DATA
        dut.io_axi_in_w_valid.value = 1

        if dut.io_axi_in_w_ready.value == 1 :
            Burst_len_counter += 1
            DATA = random.randint(0,2^8-1)

        if Burst_len_counter == Burst_len - 1:
            dut.io_axi_in_w_payload_last.value = 1
    await RisingEdge(dut.clk)
    dut.io_axi_in_w_valid.value = 0
    dut.io_axi_in_w_payload_last.value = 0
    

    # --- write response channel transaction --- #
    await RisingEdge(dut.io_axi_in_b_valid)
    dut.io_axi_in_b_ready.value = 1
    if dut.io_axi_in_b_payload_id != 1 :
        TestFailure("Master ID missmatch !")
    await RisingEdge(dut.clk)
    dut.io_axi_in_b_ready.value = 0


async def gen_burst_read_transaction(dut,Burst_len):
    # --- read addr channel transaction --- #
    while dut.io_axi_in_ar_ready == 0:
        dut.io_axi_in_ar_payload_id.value = 1
        dut.io_axi_in_ar_payload_addr.value = 0x0000
        dut.io_axi_in_ar_payload_len.value = Burst_len
        dut.io_axi_in_ar_payload_size.value = 0
        dut.io_axi_in_ar_payload_burst.value = 1
        dut.io_axi_in_ar_valid.value = 1
        await RisingEdge(dut.clk)
        

    # await RisingEdge(dut.clk)
    dut.io_axi_in_ar_valid.value = 0

    # --- read data channel transaction --- #
    Burst_len_counter = 0
    DATA = []
    while Burst_len_counter < Burst_len - 1:
        DATA.append(dut.io_axi_in_r_payload_data)
        if dut.io_axi_in_r_valid == 1:
            dut.io_axi_in_r_ready.value = 1
            Burst_len_counter += 1
        await RisingEdge(dut.clk)

@cocotb.test()
async def axi_sram_test(dut):
    cocotb.start_soon(gen_clk(dut))

    Burst_len = 8

    await Timer(2000)

    await gen_burst_write_transaction(dut,Burst_len)

    await RisingEdge(dut.clk)

    await gen_burst_read_transaction(dut,Burst_len)

    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)

    


        
        

    

