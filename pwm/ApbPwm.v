// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : ApbPwm
// Git hash  : 89d7543c7219f82d1991c9174f1b313aba4435ca

`timescale 1ns/1ps 

module ApbPwm (
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  input               io_apb_PWRITE,
  input      [7:0]    io_apb_PADDR,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_apb_PREADY,
  output              io_pwm,
  input               clk,
  input               reset
);

  wire       [7:0]    _zz_io_apb_PRDATA;
  wire       [31:0]   _zz_logic_dutyCycle;
  reg                 logic_enable;
  reg        [7:0]    logic_timer;
  reg        [7:0]    logic_dutyCycle;
  reg                 logic_output;
  wire                when_ApbPwm_l50;
  wire                when_ApbPwm_l54;
  wire                control_doWrite;

  assign _zz_io_apb_PRDATA = logic_dutyCycle;
  assign _zz_logic_dutyCycle = io_apb_PWDATA;
  assign when_ApbPwm_l50 = (logic_timer == 8'h0);
  assign when_ApbPwm_l54 = (logic_timer == logic_dutyCycle);
  assign io_pwm = logic_output;
  assign control_doWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      8'h0 : begin
        io_apb_PRDATA[0] = logic_enable;
      end
      8'h04 : begin
        io_apb_PRDATA = {24'd0, _zz_io_apb_PRDATA};
      end
      default : begin
      end
    endcase
  end

  assign io_apb_PREADY = 1'b1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      logic_enable <= 1'b0;
      logic_timer <= 8'h0;
      logic_output <= 1'b0;
    end else begin
      if(logic_enable) begin
        logic_timer <= (logic_timer + 8'h01);
      end
      if(when_ApbPwm_l50) begin
        logic_output <= 1'b1;
      end
      if(when_ApbPwm_l54) begin
        logic_output <= 1'b0;
      end
      case(io_apb_PADDR)
        8'h0 : begin
          if(control_doWrite) begin
            logic_enable <= io_apb_PWDATA[0];
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
        if(control_doWrite) begin
          logic_dutyCycle <= _zz_logic_dutyCycle[7:0];
        end
      end
      default : begin
      end
    endcase
  end

  initial begin
    $dumpfile("ApbPwm.vcd");
    $dumpvars(0, ApbPwm);
  end


endmodule
