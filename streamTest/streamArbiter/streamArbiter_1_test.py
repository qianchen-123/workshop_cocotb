# Author : Qianchen ZHANG
# Date : 26/05/2022
# function : streamArbiter_test


# note : first transaction payload must be 0

import random
import math


import cocotb
from cocotb.triggers import RisingEdge, Timer
from cocotb.result import TestFailure


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
    dut.io_s_in_0_valid.value = 0
    dut.io_s_in_0_payload.value = 0

    dut.io_s_in_1_valid.value = 0
    dut.io_s_in_1_payload.value = 0

    dut.io_s_in_2_valid.value = 0
    dut.io_s_in_2_payload.value = 0

    dut.io_s_in_3_valid.value = 0
    dut.io_s_in_3_payload.value = 0

    dut.io_m_out_ready.value = 0


#--- master behavior simulator ---#
# 1. give a random valid signal
# 2. when valid signal == 1 , give a random payload
# 3. when valid == ready == 1, begin a next transaction (transaction strat time is random)
async def m_0_bhv_sim(dut,transaction_time):

    begin = False
    transaction_counter = 0

    while transaction_counter < transaction_time:
        await RisingEdge(dut.clk)
        if begin == False:
            if dut.io_s_in_0_valid.value == 1:
                begin = True
                # dut.io_s_in_payload.value = random.randint(0,math.pow(2,32)-1)
            else :
                dut.io_s_in_0_valid.value = random.randint(0,1)
        else :
            if Sfire0(dut):
                transaction_counter += 1
                dut.io_s_in_0_valid.value = 0
                dut.io_s_in_0_payload.value = 0

            else:
                if dut.io_s_in_0_valid.value != 1:
                    v = random.randint(0,1)
                    if v == 1:
                        dut.io_s_in_0_valid.value = 1
                        dut.io_s_in_0_payload.value = random.randint(0,math.pow(2,32)-1)

async def m_0_bhv_sim(dut,transaction_time):

    begin = False
    transaction_counter = 0

    while transaction_counter < transaction_time:
        await RisingEdge(dut.clk)
        if begin == False:
            if dut.io_s_in_0_valid.value == 1:
                begin = True
                # dut.io_s_in_payload.value = random.randint(0,math.pow(2,32)-1)
            else :
                dut.io_s_in_0_valid.value = random.randint(0,1)
        else :
            if Sfire0(dut):
                transaction_counter += 1
                dut.io_s_in_0_valid.value = 0
                dut.io_s_in_0_payload.value = 0

            else:
                if dut.io_s_in_0_valid.value != 1:
                    v = random.randint(0,1)
                    if v == 1:
                        dut.io_s_in_0_valid.value = 1
                        dut.io_s_in_0_payload.value = random.randint(0,math.pow(2,32)-1)        
                
async def m_1_bhv_sim(dut,transaction_time):

    begin = False
    transaction_counter = 0

    while transaction_counter < transaction_time:
        await RisingEdge(dut.clk)
        if begin == False:
            if dut.io_s_in_1_valid.value == 1:
                begin = True
                # dut.io_s_in_payload.value = random.randint(0,math.pow(2,32)-1)
            else :
                dut.io_s_in_1_valid.value = random.randint(0,1)
        else :
            if Sfire1(dut):
                transaction_counter += 1
                dut.io_s_in_1_valid.value = 0
                dut.io_s_in_1_payload.value = 0

            else:
                if dut.io_s_in_1_valid.value != 1:
                    v = random.randint(0,1)
                    if v == 1:
                        dut.io_s_in_1_valid.value = 1
                        dut.io_s_in_1_payload.value = random.randint(0,math.pow(2,32)-1)

async def m_2_bhv_sim(dut,transaction_time):

    begin = False
    transaction_counter = 0

    while transaction_counter < transaction_time:
        await RisingEdge(dut.clk)
        if begin == False:
            if dut.io_s_in_2_valid.value == 1:
                begin = True
                # dut.io_s_in_payload.value = random.randint(0,math.pow(2,32)-1)
            else :
                dut.io_s_in_2_valid.value = random.randint(0,1)
        else :
            if Sfire2(dut):
                transaction_counter += 1
                dut.io_s_in_2_valid.value = 0
                dut.io_s_in_2_payload.value = 0

            else:
                if dut.io_s_in_2_valid.value != 1:
                    v = random.randint(0,1)
                    if v == 1:
                        dut.io_s_in_2_valid.value = 1
                        dut.io_s_in_2_payload.value = random.randint(0,math.pow(2,32)-1)

async def m_3_bhv_sim(dut,transaction_time):

    begin = False
    transaction_counter = 0

    while transaction_counter < transaction_time:
        await RisingEdge(dut.clk)
        if begin == False:
            if dut.io_s_in_3_valid.value == 1:
                begin = True
                # dut.io_s_in_payload.value = random.randint(0,math.pow(2,32)-1)
            else :
                dut.io_s_in_3_valid.value = random.randint(0,1)
        else :
            if Sfire3(dut):
                transaction_counter += 1
                dut.io_s_in_3_valid.value = 0
                dut.io_s_in_3_payload.value = 0

            else:
                if dut.io_s_in_3_valid.value != 1:
                    v = random.randint(0,1)
                    if v == 1:
                        dut.io_s_in_3_valid.value = 1
                        dut.io_s_in_3_payload.value = random.randint(0,math.pow(2,32)-1)                                                

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
async def scoreboard(dut):
    s_0_payload_value = dut.io_s_in_0_payload.value
    s_1_payload_value = dut.io_s_in_1_payload.value
    s_2_payload_value = dut.io_s_in_2_payload.value
    s_3_payload_value = dut.io_s_in_3_payload.value
    m_payload_value = dut.io_m_out_payload.value

    s_0_fire_mark = False
    s_1_fire_mark = False
    s_2_fire_mark = False
    s_3_fire_mark = False
    m_fire_mark = False

    while True:
        await RisingEdge(dut.clk)

        if Sfire0(dut):
            s_0_fire_mark = True
            s_0_payload_value = dut.io_s_in_0_payload.value

        if Sfire1(dut):
            s_1_fire_mark = True
            s_1_payload_value = dut.io_s_in_1_payload.value

        if Sfire2(dut):
            s_2_fire_mark = True
            s_2_payload_value = dut.io_s_in_2_payload.value

        if Sfire3(dut):
            s_3_fire_mark = True
            s_3_payload_value = dut.io_s_in_3_payload.value

        if Mfire(dut):
            m_fire_mark = True
            m_payload_value = dut.io_m_out_payload.value

        if s_0_fire_mark and m_fire_mark :
            if s_0_payload_value == m_payload_value :
                s_0_payload_value = 0
                m_payload_value = 0
                s_0_fire_mark = False
                m_fire_mark = False
            else :
                TestFailure("input s0 and output payload missmatch!")

        if s_1_fire_mark and m_fire_mark :
            if s_1_payload_value == m_payload_value :
                s_1_payload_value = 0
                m_payload_value = 0
                s_1_fire_mark = False
                m_fire_mark = False
            else :
                TestFailure("input s1 and output payload missmatch!")

        if s_2_fire_mark and m_fire_mark :
            if s_2_payload_value == m_payload_value :
                s_2_payload_value = 0
                m_payload_value = 0
                s_2_fire_mark = False
                m_fire_mark = False
            else :
                TestFailure("input s2 and output payload missmatch!")                

        if s_3_fire_mark and m_fire_mark :
            if s_3_payload_value == m_payload_value :
                s_3_payload_value = 0
                m_payload_value = 0
                s_3_fire_mark = False
                m_fire_mark = False
            else :
                TestFailure("input s3 and output payload missmatch!")                



#--- Slave port handshake ---#
def Sfire0(dut):
    return (dut.io_s_in_0_valid == 1) and  (dut.io_s_in_0_ready == 1)

def Sfire1(dut):
    return (dut.io_s_in_1_valid == 1) and  (dut.io_s_in_1_ready == 1)

def Sfire2(dut):
    return (dut.io_s_in_2_valid == 1) and  (dut.io_s_in_2_ready == 1)

def Sfire3(dut):
    return (dut.io_s_in_3_valid == 1) and  (dut.io_s_in_3_ready == 1)

#--- Master port handshake ---#
def Mfire(dut):
    return (dut.io_m_out_valid == 1) and  (dut.io_m_out_ready == 1)






@cocotb.test()
async def streamArbiter_1_test(dut):

    transaction_time = random.randint(200,500) # random number of transactions
    cocotb.start_soon(gen_clk(dut))
    await Timer(1000)
    cocotb.start_soon(init_input_signal(dut)) # initial all input signals
    await Timer(2000)    
    cocotb.start_soon(s_bhv_sim(dut))
    cocotb.start_soon(scoreboard(dut))

    cocotb.start_soon(m_0_bhv_sim(dut,transaction_time))
    cocotb.start_soon(m_1_bhv_sim(dut,transaction_time))
    cocotb.start_soon(m_2_bhv_sim(dut,transaction_time))
    cocotb.start_soon(m_3_bhv_sim(dut,transaction_time))

    await Timer(1000 * transaction_time)


    




    


        
        

    
