// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : UdpApp
// Git hash  : 89d7543c7219f82d1991c9174f1b313aba4435ca

`timescale 1ns/1ps 

module UdpApp (
  input               io_rx_cmd_valid,
  output reg          io_rx_cmd_ready,
  input      [31:0]   io_rx_cmd_payload_ip,
  input      [15:0]   io_rx_cmd_payload_srcPort,
  input      [15:0]   io_rx_cmd_payload_dstPort,
  input      [15:0]   io_rx_cmd_payload_length,
  input               io_rx_data_valid,
  output reg          io_rx_data_ready,
  input               io_rx_data_payload_last,
  input      [7:0]    io_rx_data_payload_fragment,
  output reg          io_tx_cmd_valid,
  input               io_tx_cmd_ready,
  output     [31:0]   io_tx_cmd_payload_ip,
  output     [15:0]   io_tx_cmd_payload_srcPort,
  output     [15:0]   io_tx_cmd_payload_dstPort,
  output     [15:0]   io_tx_cmd_payload_length,
  output reg          io_tx_data_valid,
  input               io_tx_data_ready,
  output reg          io_tx_data_payload_last,
  output reg [7:0]    io_tx_data_payload_fragment,
  input               clk,
  input               reset
);
  localparam fsm_discoveringRspTx_fsms_0_enumDef_BOOT = 1'd0;
  localparam fsm_discoveringRspTx_fsms_0_enumDef_sendCmd = 1'd1;
  localparam fsm_discoveringRspTx_fsms_1_enumDef_BOOT = 2'd0;
  localparam fsm_discoveringRspTx_fsms_1_enumDef_sendHeader = 2'd1;
  localparam fsm_discoveringRspTx_fsms_1_enumDef_sendMessage = 2'd2;
  localparam fsm_enumDef_BOOT = 2'd0;
  localparam fsm_enumDef_idle = 2'd1;
  localparam fsm_enumDef_helloHeader = 2'd2;
  localparam fsm_enumDef_discoveringRspTx = 2'd3;

  reg        [7:0]    _zz_io_tx_data_payload_fragment;
  reg                 flushRx_active;
  wire                when_UdpApp_l55;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 fsm_discoveringRspTx_fsms_0_wantExit;
  reg                 fsm_discoveringRspTx_fsms_0_wantStart;
  wire                fsm_discoveringRspTx_fsms_0_wantKill;
  reg                 fsm_discoveringRspTx_fsms_1_wantExit;
  reg                 fsm_discoveringRspTx_fsms_1_wantStart;
  wire                fsm_discoveringRspTx_fsms_1_wantKill;
  reg        [2:0]    fsm_discoveringRspTx_fsms_1_sendMessage_counter;
  reg        [0:0]    fsm_discoveringRspTx_fsms_0_stateReg;
  reg        [0:0]    fsm_discoveringRspTx_fsms_0_stateNext;
  reg        [1:0]    fsm_discoveringRspTx_fsms_1_stateReg;
  reg        [1:0]    fsm_discoveringRspTx_fsms_1_stateNext;
  wire                when_StateMachine_l238;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire                when_UdpApp_l67;
  wire                when_State_l179;
  wire                when_StateMachine_l238_1;
  `ifndef SYNTHESIS
  reg [55:0] fsm_discoveringRspTx_fsms_0_stateReg_string;
  reg [55:0] fsm_discoveringRspTx_fsms_0_stateNext_string;
  reg [87:0] fsm_discoveringRspTx_fsms_1_stateReg_string;
  reg [87:0] fsm_discoveringRspTx_fsms_1_stateNext_string;
  reg [127:0] fsm_stateReg_string;
  reg [127:0] fsm_stateNext_string;
  `endif


  always @(*) begin
    case(fsm_discoveringRspTx_fsms_1_sendMessage_counter)
      3'b000 : _zz_io_tx_data_payload_fragment = 8'h30;
      3'b001 : _zz_io_tx_data_payload_fragment = 8'h31;
      3'b010 : _zz_io_tx_data_payload_fragment = 8'h32;
      3'b011 : _zz_io_tx_data_payload_fragment = 8'h33;
      3'b100 : _zz_io_tx_data_payload_fragment = 8'h34;
      default : _zz_io_tx_data_payload_fragment = 8'h35;
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_discoveringRspTx_fsms_0_stateReg)
      fsm_discoveringRspTx_fsms_0_enumDef_BOOT : fsm_discoveringRspTx_fsms_0_stateReg_string = "BOOT   ";
      fsm_discoveringRspTx_fsms_0_enumDef_sendCmd : fsm_discoveringRspTx_fsms_0_stateReg_string = "sendCmd";
      default : fsm_discoveringRspTx_fsms_0_stateReg_string = "???????";
    endcase
  end
  always @(*) begin
    case(fsm_discoveringRspTx_fsms_0_stateNext)
      fsm_discoveringRspTx_fsms_0_enumDef_BOOT : fsm_discoveringRspTx_fsms_0_stateNext_string = "BOOT   ";
      fsm_discoveringRspTx_fsms_0_enumDef_sendCmd : fsm_discoveringRspTx_fsms_0_stateNext_string = "sendCmd";
      default : fsm_discoveringRspTx_fsms_0_stateNext_string = "???????";
    endcase
  end
  always @(*) begin
    case(fsm_discoveringRspTx_fsms_1_stateReg)
      fsm_discoveringRspTx_fsms_1_enumDef_BOOT : fsm_discoveringRspTx_fsms_1_stateReg_string = "BOOT       ";
      fsm_discoveringRspTx_fsms_1_enumDef_sendHeader : fsm_discoveringRspTx_fsms_1_stateReg_string = "sendHeader ";
      fsm_discoveringRspTx_fsms_1_enumDef_sendMessage : fsm_discoveringRspTx_fsms_1_stateReg_string = "sendMessage";
      default : fsm_discoveringRspTx_fsms_1_stateReg_string = "???????????";
    endcase
  end
  always @(*) begin
    case(fsm_discoveringRspTx_fsms_1_stateNext)
      fsm_discoveringRspTx_fsms_1_enumDef_BOOT : fsm_discoveringRspTx_fsms_1_stateNext_string = "BOOT       ";
      fsm_discoveringRspTx_fsms_1_enumDef_sendHeader : fsm_discoveringRspTx_fsms_1_stateNext_string = "sendHeader ";
      fsm_discoveringRspTx_fsms_1_enumDef_sendMessage : fsm_discoveringRspTx_fsms_1_stateNext_string = "sendMessage";
      default : fsm_discoveringRspTx_fsms_1_stateNext_string = "???????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT            ";
      fsm_enumDef_idle : fsm_stateReg_string = "idle            ";
      fsm_enumDef_helloHeader : fsm_stateReg_string = "helloHeader     ";
      fsm_enumDef_discoveringRspTx : fsm_stateReg_string = "discoveringRspTx";
      default : fsm_stateReg_string = "????????????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT            ";
      fsm_enumDef_idle : fsm_stateNext_string = "idle            ";
      fsm_enumDef_helloHeader : fsm_stateNext_string = "helloHeader     ";
      fsm_enumDef_discoveringRspTx : fsm_stateNext_string = "discoveringRspTx";
      default : fsm_stateNext_string = "????????????????";
    endcase
  end
  `endif

  always @(*) begin
    io_rx_cmd_ready = 1'b0;
    if(flushRx_active) begin
      if(when_UdpApp_l55) begin
        io_rx_cmd_ready = 1'b1;
      end
    end
  end

  always @(*) begin
    io_rx_data_ready = 1'b0;
    if(flushRx_active) begin
      io_rx_data_ready = 1'b1;
    end
  end

  always @(*) begin
    io_tx_cmd_valid = 1'b0;
    case(fsm_discoveringRspTx_fsms_0_stateReg)
      fsm_discoveringRspTx_fsms_0_enumDef_sendCmd : begin
        io_tx_cmd_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign io_tx_cmd_payload_ip = io_rx_cmd_payload_ip;
  assign io_tx_cmd_payload_srcPort = io_rx_cmd_payload_dstPort;
  assign io_tx_cmd_payload_dstPort = io_rx_cmd_payload_srcPort;
  assign io_tx_cmd_payload_length = 16'h0007;
  always @(*) begin
    io_tx_data_valid = 1'b0;
    case(fsm_discoveringRspTx_fsms_1_stateReg)
      fsm_discoveringRspTx_fsms_1_enumDef_sendHeader : begin
        io_tx_data_valid = 1'b1;
      end
      fsm_discoveringRspTx_fsms_1_enumDef_sendMessage : begin
        io_tx_data_valid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_tx_data_payload_last = 1'b0;
    case(fsm_discoveringRspTx_fsms_1_stateReg)
      fsm_discoveringRspTx_fsms_1_enumDef_sendHeader : begin
      end
      fsm_discoveringRspTx_fsms_1_enumDef_sendMessage : begin
        io_tx_data_payload_last = (fsm_discoveringRspTx_fsms_1_sendMessage_counter == 3'b101);
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_tx_data_payload_fragment = 8'h0;
    case(fsm_discoveringRspTx_fsms_1_stateReg)
      fsm_discoveringRspTx_fsms_1_enumDef_sendHeader : begin
        io_tx_data_payload_fragment = 8'h22;
      end
      fsm_discoveringRspTx_fsms_1_enumDef_sendMessage : begin
        io_tx_data_payload_fragment = _zz_io_tx_data_payload_fragment;
      end
      default : begin
      end
    endcase
  end

  assign when_UdpApp_l55 = (io_rx_data_valid && io_rx_data_payload_last);
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_idle : begin
      end
      fsm_enumDef_helloHeader : begin
      end
      fsm_enumDef_discoveringRspTx : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    fsm_discoveringRspTx_fsms_0_wantExit = 1'b0;
    case(fsm_discoveringRspTx_fsms_0_stateReg)
      fsm_discoveringRspTx_fsms_0_enumDef_sendCmd : begin
        if(io_tx_cmd_ready) begin
          fsm_discoveringRspTx_fsms_0_wantExit = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_discoveringRspTx_fsms_0_wantStart = 1'b0;
    if(when_StateMachine_l238_1) begin
      fsm_discoveringRspTx_fsms_0_wantStart = 1'b1;
    end
  end

  assign fsm_discoveringRspTx_fsms_0_wantKill = 1'b0;
  always @(*) begin
    fsm_discoveringRspTx_fsms_1_wantExit = 1'b0;
    case(fsm_discoveringRspTx_fsms_1_stateReg)
      fsm_discoveringRspTx_fsms_1_enumDef_sendHeader : begin
      end
      fsm_discoveringRspTx_fsms_1_enumDef_sendMessage : begin
        if(io_tx_data_ready) begin
          if(io_tx_data_payload_last) begin
            fsm_discoveringRspTx_fsms_1_wantExit = 1'b1;
          end
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_discoveringRspTx_fsms_1_wantStart = 1'b0;
    if(when_StateMachine_l238_1) begin
      fsm_discoveringRspTx_fsms_1_wantStart = 1'b1;
    end
  end

  assign fsm_discoveringRspTx_fsms_1_wantKill = 1'b0;
  always @(*) begin
    fsm_discoveringRspTx_fsms_0_stateNext = fsm_discoveringRspTx_fsms_0_stateReg;
    case(fsm_discoveringRspTx_fsms_0_stateReg)
      fsm_discoveringRspTx_fsms_0_enumDef_sendCmd : begin
        if(io_tx_cmd_ready) begin
          fsm_discoveringRspTx_fsms_0_stateNext = fsm_discoveringRspTx_fsms_0_enumDef_BOOT;
        end
      end
      default : begin
      end
    endcase
    if(fsm_discoveringRspTx_fsms_0_wantStart) begin
      fsm_discoveringRspTx_fsms_0_stateNext = fsm_discoveringRspTx_fsms_0_enumDef_sendCmd;
    end
    if(fsm_discoveringRspTx_fsms_0_wantKill) begin
      fsm_discoveringRspTx_fsms_0_stateNext = fsm_discoveringRspTx_fsms_0_enumDef_BOOT;
    end
  end

  always @(*) begin
    fsm_discoveringRspTx_fsms_1_stateNext = fsm_discoveringRspTx_fsms_1_stateReg;
    case(fsm_discoveringRspTx_fsms_1_stateReg)
      fsm_discoveringRspTx_fsms_1_enumDef_sendHeader : begin
        if(io_tx_data_ready) begin
          fsm_discoveringRspTx_fsms_1_stateNext = fsm_discoveringRspTx_fsms_1_enumDef_sendMessage;
        end
      end
      fsm_discoveringRspTx_fsms_1_enumDef_sendMessage : begin
        if(io_tx_data_ready) begin
          if(io_tx_data_payload_last) begin
            fsm_discoveringRspTx_fsms_1_stateNext = fsm_discoveringRspTx_fsms_1_enumDef_BOOT;
          end
        end
      end
      default : begin
      end
    endcase
    if(fsm_discoveringRspTx_fsms_1_wantStart) begin
      fsm_discoveringRspTx_fsms_1_stateNext = fsm_discoveringRspTx_fsms_1_enumDef_sendHeader;
    end
    if(fsm_discoveringRspTx_fsms_1_wantKill) begin
      fsm_discoveringRspTx_fsms_1_stateNext = fsm_discoveringRspTx_fsms_1_enumDef_BOOT;
    end
  end

  assign when_StateMachine_l238 = ((! (fsm_discoveringRspTx_fsms_1_stateReg == fsm_discoveringRspTx_fsms_1_enumDef_sendMessage)) && (fsm_discoveringRspTx_fsms_1_stateNext == fsm_discoveringRspTx_fsms_1_enumDef_sendMessage));
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_idle : begin
        if(when_UdpApp_l67) begin
          case(io_rx_cmd_payload_dstPort)
            16'h9460 : begin
              fsm_stateNext = fsm_enumDef_helloHeader;
            end
            default : begin
            end
          endcase
        end
      end
      fsm_enumDef_helloHeader : begin
        if(io_rx_data_valid) begin
          case(io_rx_data_payload_fragment)
            8'h11 : begin
              fsm_stateNext = fsm_enumDef_discoveringRspTx;
            end
            default : begin
              fsm_stateNext = fsm_enumDef_idle;
            end
          endcase
        end
      end
      fsm_enumDef_discoveringRspTx : begin
        if(when_State_l179) begin
          fsm_stateNext = fsm_enumDef_idle;
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_idle;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign when_UdpApp_l67 = (io_rx_cmd_valid && (! flushRx_active));
  assign when_State_l179 = (((fsm_discoveringRspTx_fsms_0_stateReg == fsm_discoveringRspTx_fsms_0_enumDef_BOOT) || fsm_discoveringRspTx_fsms_0_wantExit) && ((fsm_discoveringRspTx_fsms_1_stateReg == fsm_discoveringRspTx_fsms_1_enumDef_BOOT) || fsm_discoveringRspTx_fsms_1_wantExit));
  assign when_StateMachine_l238_1 = ((! (fsm_stateReg == fsm_enumDef_discoveringRspTx)) && (fsm_stateNext == fsm_enumDef_discoveringRspTx));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      flushRx_active <= 1'b0;
      fsm_discoveringRspTx_fsms_0_stateReg <= fsm_discoveringRspTx_fsms_0_enumDef_BOOT;
      fsm_discoveringRspTx_fsms_1_stateReg <= fsm_discoveringRspTx_fsms_1_enumDef_BOOT;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      if(flushRx_active) begin
        if(when_UdpApp_l55) begin
          flushRx_active <= 1'b0;
        end
      end
      fsm_discoveringRspTx_fsms_0_stateReg <= fsm_discoveringRspTx_fsms_0_stateNext;
      fsm_discoveringRspTx_fsms_1_stateReg <= fsm_discoveringRspTx_fsms_1_stateNext;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_idle : begin
          if(when_UdpApp_l67) begin
            case(io_rx_cmd_payload_dstPort)
              16'h9460 : begin
              end
              default : begin
                flushRx_active <= 1'b1;
              end
            endcase
          end
        end
        fsm_enumDef_helloHeader : begin
          if(io_rx_data_valid) begin
            case(io_rx_data_payload_fragment)
              8'h11 : begin
              end
              default : begin
                flushRx_active <= 1'b1;
              end
            endcase
          end
        end
        fsm_enumDef_discoveringRspTx : begin
          if(when_State_l179) begin
            flushRx_active <= 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    case(fsm_discoveringRspTx_fsms_1_stateReg)
      fsm_discoveringRspTx_fsms_1_enumDef_sendHeader : begin
      end
      fsm_discoveringRspTx_fsms_1_enumDef_sendMessage : begin
        if(io_tx_data_ready) begin
          fsm_discoveringRspTx_fsms_1_sendMessage_counter <= (fsm_discoveringRspTx_fsms_1_sendMessage_counter + 3'b001);
        end
      end
      default : begin
      end
    endcase
    if(when_StateMachine_l238) begin
      fsm_discoveringRspTx_fsms_1_sendMessage_counter <= 3'b000;
    end
  end


  initial begin
    $dumpfile("UdpApp_test.vcd");
    $dumpvars(0, UdpApp);
  end

endmodule
