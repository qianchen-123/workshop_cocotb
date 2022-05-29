# Author : Qianchen ZHANG
# Date : 26/05/2022
# function : streamFIFO_test


# note : first transaction payload must be 0

import logging
import random
import math


import cocotb
from cocotb.triggers import RisingEdge, Timer
from cocotb.result import TestFailure,TestSuccess

from logging.handlers import RotatingFileHandler
from cocotb.log import SimLogFormatter


#--- clk  ---#
# period = 1ns
async def gen_clk(dut):
    dut.clk.value = 0
    dut.reset.value = 1

    await Timer(1000)
    dut.reset.value = 0

    while True:
        await Timer(500)
        dut.clk.value = 1
        await Timer(500)
        dut.clk.value = 0


#--- initial all signal ---#
async def init_input_signal(dut):
    dut.io_s_in_valid.value = 0
    dut.io_s_in_payload.value = 0
    dut.io_m_out_ready.value = 0


#--- master behavior simulator ---#
# 1. give a random valid signal
# 2. when valid signal == 1 , give a random payload
# 3. when valid == ready == 1, begin a next transaction (transaction strat time is random)
async def m_bhv_sim(dut,transaction_time):

    begin = False
    transaction_counter = 0

    while transaction_counter < transaction_time:
        await RisingEdge(dut.clk)
        if begin == False:
            if dut.io_s_in_valid.value == 1:
                begin = True
                # dut.io_s_in_payload.value = random.randint(0,math.pow(2,32)-1)
            else :
                dut.io_s_in_valid.value = random.randint(0,1)
        else :
            if Sfire(dut):
                transaction_counter += 1
                dut.io_s_in_valid.value = 0
                dut.io_s_in_payload.value = 0

            else:
                if dut.io_s_in_valid.value != 1:
                    v = random.randint(0,1)
                    if v == 1:
                        dut.io_s_in_valid.value = 1
                        dut.io_s_in_payload.value = random.randint(0,math.pow(2,32)-1)
        
                

#--- slave behavior simulator --- #
#1. give a random ready signal
#2. when ready == 1 , we mast make sure slave get 1 transaction, that say we must need 1 handshake of m port, then we can chake value of mready
async def s_bhv_sim(dut):

    r = 0

    while True:
        await RisingEdge(dut.clk)
        if r == 0 :
            r = random.randint(0,1)
        else :
            if Mfire(dut):
                r = 0
        dut.io_m_out_ready.value = r
        


#--- scoreboard section ---#
#1. record s port handshake statue and payload 
#2. record m port handshake statue and payload 
#3. when s port handshake satisfied and m port handshake satisfied, compare their payloads
#4. when not equal, rising test filure message 
async def scoreboard(dut,transaction_time):
    s_payload_list = []
    m_payload_list = []

    root_logger = logging.getLogger()

    # # undo the setup cocotb did
    # for handler in root_logger.handlers:
    #     root_logger.removeHandler(handler)
    #     handler.close()

    # do whatever configuration you want instead
    # file_handler = RotatingFileHandler("rotating.log", maxBytes=(5 * 1024 * 1024), backupCount=2)
    # file_handler.setFormatter(SimLogFormatter())
    # root_logger.addHandler(file_handler)

    while not (len(s_payload_list) == len(m_payload_list) == transaction_time+1):
        await RisingEdge(dut.clk)

        if Sfire(dut):
            s_payload_list.append(dut.io_s_in_payload.value)
        if Mfire(dut):
            m_payload_list.append(dut.io_m_out_payload.value)

    assert len(s_payload_list) == len(m_payload_list) == transaction_time+1 , "transaction not finish"
    print("scoreboard task info: all transaction finish.")
    assert s_payload_list == m_payload_list, "input and output payload missmatch!"




        





#--- Slave port handshake ---#
def Sfire(dut):
    return (dut.io_s_in_valid == 1) and  (dut.io_s_in_ready == 1)

#--- Master port handshake ---#
def Mfire(dut):
    return (dut.io_m_out_valid == 1) and  (dut.io_m_out_ready == 1)



@cocotb.test()
async def streamFIFO_test(dut):
    
    transaction_time = random.randint(200,500) # random number of transactions
    cocotb.start_soon(gen_clk(dut))
    await Timer(1000)
    cocotb.start_soon(init_input_signal(dut)) # initial all input signals
    await Timer(2000)    
    cocotb.start_soon(s_bhv_sim(dut))
    cocotb.start_soon(m_bhv_sim(dut,transaction_time))
    await scoreboard(dut,transaction_time)

    


    




    


        
        

    
