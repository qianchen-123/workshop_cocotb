#Apb3Decoder Makefile

#defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog

VERILOG_SOURCES += $(PWD)/Apb3Decoder.v
#VHDL_SOURCES += $(PWD)/Apb3Decoder.vhd

#TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL = Apb3Decoder

#MODULE is the basename of the python test file
MODULE = Apb3Decoder_test

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
