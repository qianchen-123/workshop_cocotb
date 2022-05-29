# Makefile

#defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES += $(PWD)/streamReg_halfPipe.v
#VHDL_SOURCES += %(PWD)/StreamUnit.vhd

#TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = streamReg_halfPipe

#MODULE is the basename of the python test file
MODULE = streamReg_halfPipe_test

#Include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
