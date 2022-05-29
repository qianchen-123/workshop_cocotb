# Makefile

#defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES += $(PWD)/streamReg_m2s.v
#VHDL_SOURCES += %(PWD)/StreamUnit.vhd

#TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = streamReg_m2s

#MODULE is the basename of the python test file
MODULE = streamReg_m2s_test

#Include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
