// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : Counter
// Git hash  : 89d7543c7219f82d1991c9174f1b313aba4435ca

`timescale 1ns/1ps 

module Counter (
  input               io_clear,
  output     [3:0]    io_value,
  output              io_full,
  input               clk,
  input               reset
);

  wire       [4:0]    _zz_io_full;
  wire       [4:0]    _zz_io_full_1;
  wire       [4:0]    _zz_io_full_2;
  reg        [3:0]    counter_1;

  assign _zz_io_full = {1'd0, counter_1};
  assign _zz_io_full_1 = (_zz_io_full_2 - 5'h01);
  assign _zz_io_full_2 = ({4'd0,1'b1} <<< 4);
  assign io_value = counter_1;
  assign io_full = (_zz_io_full == _zz_io_full_1);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      counter_1 <= 4'b0000;
    end else begin
      counter_1 <= (counter_1 + 4'b0001);
      if(io_clear) begin
        counter_1 <= 4'b0000;
      end
    end
  end

  initial begin
    $dumpfile("Counter.vcd");
    $dumpvars(0, Counter);
  end


endmodule
