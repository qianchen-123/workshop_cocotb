# Makefile

#defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog


VERILOG_SOURCES += $(PWD)/ApbPwm.v
#VHDL_SOURCES +=$(PWD)/ApbPwm.vhd

#TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = ApbPwm

#MODULE IS THE BASENAME OF THE PYTHON TEST FILE
MODULE = ApbPwm_test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim