# Makefile

#defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES += $(PWD)/streamReg_s2m.v
#VHDL_SOURCES += %(PWD)/StreamUnit.vhd

#TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = streamReg_s2m

#MODULE is the basename of the python test file
MODULE = streamReg_s2m_test

#Include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
