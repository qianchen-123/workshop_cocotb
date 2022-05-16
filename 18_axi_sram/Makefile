#axi_sram Makefile

#defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES += $(PWD)/rtl/axi_sram.v
VERILOG_SOURCES += $(PWD)/rtl/sram.v
#VHDL_SOURCES += $(PWD)/Apb3Decoder.vhd

#TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = axi_sram

#MODULE is the basename of the python test file
MODULE = axi_sram_test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
