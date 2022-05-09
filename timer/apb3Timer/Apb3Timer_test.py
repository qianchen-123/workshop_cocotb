# Apb3Timer_test.py
from doctest import testfile
import random
# from types import UnionType

import cocotb
from cocotb.triggers import RisingEdge,Timer
from cocotb.result import TestFailure


class Timer_intern(object):
    def __init__(self,a,b):
        self.a = a
        self.b = b

class apb_write_state(object):
    def __init__(self,s,w_t_c,w_l):
        self.stop_write = s
        self.write_timer_ticks_clear = w_t_c
        self.write_timer_limit = w_l

class apb_read_state(object):
    def __init__(self,s,r_t_c,r_l,r_v):
        self.stop_read = s
        self.read_ticks_clears = r_t_c
        self.read_limit = r_l
        self.read_value = r_v

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

async def gen_io_external_tick(dut,limit):
    while True:
        dut.io_external_tick = 1
        for i in range(10):
            await RisingEdge(dut.clk)
        # dut.io_external_tick = random.randint(0,1)
        # for i in range (limit):
        #     await RisingEdge(dut.clk)

async def gen_io_external_clear(dut):
    while True:
        dut.io_external_clear = random.randint(0,1)
        for i in range(random.randint(0,10)):
            await RisingEdge(dut.clk)

async def apb_read(dut,timer,state):

    stop_read = 0
    read_a_ticks_clears = 1
    read_a_limit = 2
    read_a_value = 3

    a = 0
    b = 1

    # PREADY = dut.io_apb_PREADY
    # PRDATA = dut.io_apb_PRDATA
    # PSLVERROR = dut.io_apb_PSLVERROR
    
    if(timer == a):
        if(state == stop_read):
            dut.io_apb_PWRITE = 1
        elif(state == read_a_ticks_clears):
            dut.io_apb_PWRITE = 0
            dut.io_apb_PENABLE = 1
            dut.io_apb_PADDR = 0x00
        elif(state == read_a_limit):
            dut.io_apb_PWRITE = 0
            dut.io_apb_PENABLE = 1
            dut.io_apb_PADDR = 0x04
        elif(state == read_a_value):
            dut.io_apb_PWRITE = 0
            dut.io_apb_PENABLE = 1
            dut.io_apb_PADDR = 0x08

    elif(timer == b):
        if(state == stop_read):
            dut.io_apb_PWRITE = 1
        elif(state == read_a_ticks_clears):
            dut.io_apb_PWRITE = 0
            dut.io_apb_PENABLE = 1
            dut.io_apb_PADDR = 0x10
        elif(state == read_a_limit):
            dut.io_apb_PWRITE = 0
            dut.io_apb_PENABLE = 1
            dut.io_apb_PADDR = 0x14
        elif(state == read_a_value):
            dut.io_apb_PWRITE = 0
            dut.io_apb_PENABLE = 1
            dut.io_apb_PADDR = 0x18
            
async def apb_write(dut,timer,state,limit):

    stop_write = 0
    write_timer_a_ticks_clears = 1
    write_timer_a_limit = 2

    a = 0
    b = 1
    
    if (timer == a):
        if state == stop_write:
            dut.io_apb_PADDR = 0x00
            dut.io_apb_PSEL = 1
            dut.io_apb_PENABLE = 0
            dut.io_apb_PWRITE = 0
            dut.io_apb_PWDATA = 0x00000000
        
        elif state == write_timer_a_ticks_clears:
            dut.io_apb_PADDR = 0x00
            dut.io_apb_PSEL = 1
            dut.io_apb_PENABLE = 1
            dut.io_apb_PWRITE = 1
            dut.io_apb_PWDATA = 0x00000007

        elif state == write_timer_a_limit:
            dut.io_apb_PADDR = 0x04
            dut.io_apb_PSEL = 1
            dut.io_apb_PENABLE = 1
            dut.io_apb_PWRITE = 1
            dut.io_apb_PWDATA = limit

    elif(timer == b):

        if state == stop_write:
            dut.io_apb_PADDR = 0x10
            dut.io_apb_PSEL = 1
            dut.io_apb_PENABLE = 0
            dut.io_apb_PWRITE = 0
            dut.io_apb_PWDATA = 0x00000000
        
        elif state == write_timer_a_ticks_clears:
            dut.io_apb_PADDR = 0x10
            dut.io_apb_PSEL = 1
            dut.io_apb_PENABLE = 1
            dut.io_apb_PWRITE = 1
            dut.io_apb_PWDATA = 0x00000007

        elif state == write_timer_a_limit:
            dut.io_apb_PADDR = 0x14
            dut.io_apb_PSEL = 1
            dut.io_apb_PENABLE = 1
            dut.io_apb_PWRITE = 1
            dut.io_apb_PWDATA = limit

        # dut.io_apb_PADDR = random.randint(0,2^8 - 1)
        # dut.io_apb_PSEL = 1
        # dut.io_apb_PENABLE = random.randint(0,1)
        # dut.io_apb_PWRITE = random.randint(0,1)
        # dut.io_apb_PWDATA = random.randint(0,2^32 - 1)

async def write_timer_data(dut,limit_A,limit_B):

    T = Timer_intern(0,1)
    Apb = apb_write_state(0,1,2)

    await RisingEdge(dut.clk)
    cocotb.start_soon(apb_write(dut,T.a,Apb.write_timer_limit,limit_A))
   
    await RisingEdge(dut.clk)
    cocotb.start_soon(apb_write(dut,T.b,Apb.write_timer_limit,limit_B))


@cocotb.test()
async def apb3Timer_test(dut):


    cocotb.start_soon(gen_rst_clk(dut))
    # cocotb.start_soon(gen_io_external_tick(dut,10))
    # cocotb.start_soon(gen_io_external_clear(dut))
    

    for i in range(200):
        limit_A = random.randint(1,2^16-1)
        limit_B = random.randint(1,2^8-1)
        counter_A = 0
        counter_B = 0

        for i in range(10):
            await RisingEdge(dut.clk)

        cocotb.start_soon(write_timer_data(dut,limit_A,limit_B)) # give timer A B limit 0x1F 0x0F

        for i in range(3):
            await RisingEdge(dut.clk)

        # Test timer A function
        await RisingEdge(dut.clk)
        cocotb.start_soon(apb_read(dut,0,2)) # read timer A limit 0x1F
        await RisingEdge(dut.clk)
        cocotb.start_soon(apb_write(dut,0,1,0))  # give timer A tick 
        for i in range(limit_A + 1):
            await RisingEdge(dut.clk)
            cocotb.start_soon(apb_read(dut,0,3)) # read timer A value
            counter_A = counter_A + 1
            if(counter_A != dut.io_apb_PRDATA):
                TestFailure("Timer A incorrect!")
            if(dut.io_apb_PRDATA == limit_A ):
                if(dut.io_fullA != 1):
                    TestFailure("Timer A full signal not work!")


        for i in range(3):
            await RisingEdge(dut.clk)

        # Test timer B function
        await RisingEdge(dut.clk)
        cocotb.start_soon(apb_read(dut,1,2))
        await RisingEdge(dut.clk)
        cocotb.start_soon(apb_write(dut,1,1,0))
        for i in range(limit_B + 1):
            await RisingEdge(dut.clk)
            cocotb.start_soon(apb_read(dut,1,3))
            counter_B = counter_B + 1
            if(counter_B != dut.io_apb_PRDATA):
                TestFailure("Timer B incorrect!")
            if(dut.io_apb_PRDATA == limit_B):
                if(dut.io_fullB == limit_B):
                    TestFailure("Timer B full signal not work!")
            

        for i in range(10):
            await RisingEdge(dut.clk)
