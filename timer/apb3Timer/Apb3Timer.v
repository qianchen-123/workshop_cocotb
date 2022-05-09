// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : Apb3Timer
// Git hash  : 89d7543c7219f82d1991c9174f1b313aba4435ca

`timescale 1ns/1ps 

module Apb3Timer (
  input      [7:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_apb_PSLVERROR,
  output              io_fullA,
  output              io_fullB,
  input               io_external_tick,
  input               io_external_clear,
  input               clk,
  input               reset
);

  wire                timerA_io_tick;
  wire                timerA_io_clear;
  wire                timerB_io_tick;
  wire                timerB_io_clear;
  wire                timerA_io_full;
  wire       [15:0]   timerA_io_value;
  wire                timerB_io_full;
  wire       [7:0]    timerB_io_value;
  reg        [3:0]    clockDivider_counter;
  wire                clockDivider_full;
  wire                apbCtrl_askWrite;
  wire                apbCtrl_askRead;
  wire                apbCtrl_doWrite;
  wire                apbCtrl_doRead;
  reg        [2:0]    bridgeA_ticksEnable;
  reg        [1:0]    bridgeA_clearEnable;
  reg                 bridgeA_busClearing;
  reg        [15:0]   timerA_io_limit_driver;
  reg                 when_Timer_l67;
  reg                 when_Timer_l72;
  reg        [2:0]    bridgeB_ticksEnable;
  reg        [1:0]    bridgeB_clearEnable;
  reg                 bridgeB_busClearing;
  reg        [7:0]    timerB_io_limit_driver;
  reg                 when_Timer_l67_1;
  reg                 when_Timer_l72_1;

  Timer timerA (
    .io_tick     (timerA_io_tick                ), //i
    .io_clear    (timerA_io_clear               ), //i
    .io_limit    (timerA_io_limit_driver[15:0]  ), //i
    .io_full     (timerA_io_full                ), //o
    .io_value    (timerA_io_value[15:0]         ), //o
    .clk         (clk                           ), //i
    .reset       (reset                         )  //i
  );
  Timer_1 timerB (
    .io_tick     (timerB_io_tick               ), //i
    .io_clear    (timerB_io_clear              ), //i
    .io_limit    (timerB_io_limit_driver[7:0]  ), //i
    .io_full     (timerB_io_full               ), //o
    .io_value    (timerB_io_value[7:0]         ), //o
    .clk         (clk                          ), //i
    .reset       (reset                        )  //i
  );
  assign clockDivider_full = (clockDivider_counter == 4'b1111);
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      8'h0 : begin
        io_apb_PRDATA[2 : 0] = bridgeA_ticksEnable;
        io_apb_PRDATA[17 : 16] = bridgeA_clearEnable;
      end
      8'h04 : begin
        io_apb_PRDATA[15 : 0] = timerA_io_limit_driver;
      end
      8'h08 : begin
        io_apb_PRDATA[15 : 0] = timerA_io_value;
      end
      8'h10 : begin
        io_apb_PRDATA[2 : 0] = bridgeB_ticksEnable;
        io_apb_PRDATA[17 : 16] = bridgeB_clearEnable;
      end
      8'h14 : begin
        io_apb_PRDATA[7 : 0] = timerB_io_limit_driver;
      end
      8'h18 : begin
        io_apb_PRDATA[7 : 0] = timerB_io_value;
      end
      default : begin
      end
    endcase
  end

  assign io_apb_PSLVERROR = 1'b0;
  assign apbCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign apbCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign apbCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign apbCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  always @(*) begin
    bridgeA_busClearing = 1'b0;
    if(when_Timer_l67) begin
      bridgeA_busClearing = 1'b1;
    end
    if(when_Timer_l72) begin
      bridgeA_busClearing = 1'b1;
    end
  end

  assign timerA_io_tick = (|(bridgeA_ticksEnable & {io_external_tick,{clockDivider_full,1'b1}}));
  assign timerA_io_clear = ((|(bridgeA_clearEnable & {io_external_clear,timerA_io_full})) || bridgeA_busClearing);
  always @(*) begin
    when_Timer_l67 = 1'b0;
    case(io_apb_PADDR)
      8'h04 : begin
        if(apbCtrl_doWrite) begin
          when_Timer_l67 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    when_Timer_l72 = 1'b0;
    case(io_apb_PADDR)
      8'h08 : begin
        if(apbCtrl_doWrite) begin
          when_Timer_l72 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    bridgeB_busClearing = 1'b0;
    if(when_Timer_l67_1) begin
      bridgeB_busClearing = 1'b1;
    end
    if(when_Timer_l72_1) begin
      bridgeB_busClearing = 1'b1;
    end
  end

  assign timerB_io_tick = (|(bridgeB_ticksEnable & {io_external_tick,{clockDivider_full,1'b1}}));
  assign timerB_io_clear = ((|(bridgeB_clearEnable & {io_external_clear,timerB_io_full})) || bridgeB_busClearing);
  always @(*) begin
    when_Timer_l67_1 = 1'b0;
    case(io_apb_PADDR)
      8'h14 : begin
        if(apbCtrl_doWrite) begin
          when_Timer_l67_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    when_Timer_l72_1 = 1'b0;
    case(io_apb_PADDR)
      8'h18 : begin
        if(apbCtrl_doWrite) begin
          when_Timer_l72_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign io_fullA = timerA_io_full;
  assign io_fullB = timerB_io_full;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      clockDivider_counter <= 4'b0000;
      bridgeA_ticksEnable <= 3'b000;
      bridgeA_clearEnable <= 2'b00;
      bridgeB_ticksEnable <= 3'b000;
      bridgeB_clearEnable <= 2'b00;
    end else begin
      clockDivider_counter <= (clockDivider_counter + 4'b0001);
      case(io_apb_PADDR)
        8'h0 : begin
          if(apbCtrl_doWrite) begin
            bridgeA_ticksEnable <= io_apb_PWDATA[2 : 0];
            bridgeA_clearEnable <= io_apb_PWDATA[17 : 16];
          end
        end
        8'h10 : begin
          if(apbCtrl_doWrite) begin
            bridgeB_ticksEnable <= io_apb_PWDATA[2 : 0];
            bridgeB_clearEnable <= io_apb_PWDATA[17 : 16];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    case(io_apb_PADDR)
      8'h04 : begin
        if(apbCtrl_doWrite) begin
          timerA_io_limit_driver <= io_apb_PWDATA[15 : 0];
        end
      end
      8'h14 : begin
        if(apbCtrl_doWrite) begin
          timerB_io_limit_driver <= io_apb_PWDATA[7 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Timer_1 (
  input               io_tick,
  input               io_clear,
  input      [7:0]    io_limit,
  output              io_full,
  output     [7:0]    io_value,
  input               clk,
  input               reset
);

  reg        [7:0]    counter;
  wire                when_Timer_l22;

  assign when_Timer_l22 = (io_tick && (! io_full));
  assign io_full = (counter == io_limit);
  assign io_value = counter;
  always @(posedge clk) begin
    if(when_Timer_l22) begin
      counter <= (counter + 8'h01);
    end
    if(io_clear) begin
      counter <= 8'h0;
    end
  end


endmodule

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
    $dumpfile("Apb3Timer_test.vcd");
    $dumpvars(0,Apb3Timer);
  end
  `endif


endmodule
