// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : Timer
// Git hash  : 89d7543c7219f82d1991c9174f1b313aba4435ca

`timescale 1ns/1ps 

module Timer (
  input               io_tick,
  input               io_clear,
  input      [15:0]   io_limit,
  output              io_full,
  output     [15:0]   io_value,
  input               clk,
  input               reset
);

  reg        [15:0]   counter;
  wire                when_Timer_l22;

  assign when_Timer_l22 = (io_tick && (! io_full));
  assign io_full = (counter == io_limit);
  assign io_value = counter;
  always @(posedge clk) begin
    if(when_Timer_l22) begin
      counter <= (counter + 16'h0001);
    end
    if(io_clear) begin
      counter <= 16'h0;
    end
  end

  `ifdef COCOTB_SIM
  initial begin
    $dumpfile("Timer_test.vcd");
    $dumpvars(0,Timer);
  end
  `endif


endmodule
