// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : Arbiter
// Git hash  : 89d7543c7219f82d1991c9174f1b313aba4435ca

`timescale 1ns/1ps 

module Arbiter (
  input               io_Arbiter_In_0_valid,
  output              io_Arbiter_In_0_ready,
  input      [31:0]   io_Arbiter_In_0_payload,
  input               io_Arbiter_In_1_valid,
  output              io_Arbiter_In_1_ready,
  input      [31:0]   io_Arbiter_In_1_payload,
  input               io_Arbiter_In_2_valid,
  output              io_Arbiter_In_2_ready,
  input      [31:0]   io_Arbiter_In_2_payload,
  input               io_Arbiter_In_3_valid,
  output              io_Arbiter_In_3_ready,
  input      [31:0]   io_Arbiter_In_3_payload,
  output              io_Arbiter_Out_valid,
  input               io_Arbiter_Out_ready,
  output     [31:0]   io_Arbiter_Out_payload,
  input               clk,
  input               reset
);

  wire                streamArbiter_1_io_output_ready;
  wire                streamArbiter_1_io_inputs_0_ready;
  wire                streamArbiter_1_io_inputs_1_ready;
  wire                streamArbiter_1_io_inputs_2_ready;
  wire                streamArbiter_1_io_inputs_3_ready;
  wire                streamArbiter_1_io_output_valid;
  wire       [31:0]   streamArbiter_1_io_output_payload;
  wire       [1:0]    streamArbiter_1_io_chosen;
  wire       [3:0]    streamArbiter_1_io_chosenOH;
  wire                Arbiter_InterSignal_0_valid;
  wire                Arbiter_InterSignal_0_ready;
  wire       [31:0]   Arbiter_InterSignal_0_payload;
  wire                Arbiter_InterSignal_1_valid;
  wire                Arbiter_InterSignal_1_ready;
  wire       [31:0]   Arbiter_InterSignal_1_payload;
  wire                Arbiter_InterSignal_2_valid;
  wire                Arbiter_InterSignal_2_ready;
  wire       [31:0]   Arbiter_InterSignal_2_payload;
  wire                Arbiter_InterSignal_3_valid;
  wire                Arbiter_InterSignal_3_ready;
  wire       [31:0]   Arbiter_InterSignal_3_payload;
  wire                Arbiter_InterSignal_4_valid;
  wire                Arbiter_InterSignal_4_ready;
  wire       [31:0]   Arbiter_InterSignal_4_payload;
  wire                io_Arbiter_In_0_s2mPipe_valid;
  reg                 io_Arbiter_In_0_s2mPipe_ready;
  wire       [31:0]   io_Arbiter_In_0_s2mPipe_payload;
  reg                 io_Arbiter_In_0_rValid;
  reg        [31:0]   io_Arbiter_In_0_rData;
  wire                io_Arbiter_In_0_s2mPipe_m2sPipe_valid;
  wire                io_Arbiter_In_0_s2mPipe_m2sPipe_ready;
  wire       [31:0]   io_Arbiter_In_0_s2mPipe_m2sPipe_payload;
  reg                 io_Arbiter_In_0_s2mPipe_rValid;
  reg        [31:0]   io_Arbiter_In_0_s2mPipe_rData;
  wire                when_Stream_l342;
  wire                io_Arbiter_In_1_s2mPipe_valid;
  reg                 io_Arbiter_In_1_s2mPipe_ready;
  wire       [31:0]   io_Arbiter_In_1_s2mPipe_payload;
  reg                 io_Arbiter_In_1_rValid;
  reg        [31:0]   io_Arbiter_In_1_rData;
  wire                io_Arbiter_In_1_s2mPipe_m2sPipe_valid;
  wire                io_Arbiter_In_1_s2mPipe_m2sPipe_ready;
  wire       [31:0]   io_Arbiter_In_1_s2mPipe_m2sPipe_payload;
  reg                 io_Arbiter_In_1_s2mPipe_rValid;
  reg        [31:0]   io_Arbiter_In_1_s2mPipe_rData;
  wire                when_Stream_l342_1;
  wire                io_Arbiter_In_2_s2mPipe_valid;
  reg                 io_Arbiter_In_2_s2mPipe_ready;
  wire       [31:0]   io_Arbiter_In_2_s2mPipe_payload;
  reg                 io_Arbiter_In_2_rValid;
  reg        [31:0]   io_Arbiter_In_2_rData;
  wire                io_Arbiter_In_2_s2mPipe_m2sPipe_valid;
  wire                io_Arbiter_In_2_s2mPipe_m2sPipe_ready;
  wire       [31:0]   io_Arbiter_In_2_s2mPipe_m2sPipe_payload;
  reg                 io_Arbiter_In_2_s2mPipe_rValid;
  reg        [31:0]   io_Arbiter_In_2_s2mPipe_rData;
  wire                when_Stream_l342_2;
  wire                io_Arbiter_In_3_s2mPipe_valid;
  reg                 io_Arbiter_In_3_s2mPipe_ready;
  wire       [31:0]   io_Arbiter_In_3_s2mPipe_payload;
  reg                 io_Arbiter_In_3_rValid;
  reg        [31:0]   io_Arbiter_In_3_rData;
  wire                io_Arbiter_In_3_s2mPipe_m2sPipe_valid;
  wire                io_Arbiter_In_3_s2mPipe_m2sPipe_ready;
  wire       [31:0]   io_Arbiter_In_3_s2mPipe_m2sPipe_payload;
  reg                 io_Arbiter_In_3_s2mPipe_rValid;
  reg        [31:0]   io_Arbiter_In_3_s2mPipe_rData;
  wire                when_Stream_l342_3;
  wire                streamArbiter_1_io_output_s2mPipe_valid;
  reg                 streamArbiter_1_io_output_s2mPipe_ready;
  wire       [31:0]   streamArbiter_1_io_output_s2mPipe_payload;
  reg                 streamArbiter_1_io_output_rValid;
  reg        [31:0]   streamArbiter_1_io_output_rData;
  wire                streamArbiter_1_io_output_s2mPipe_m2sPipe_valid;
  wire                streamArbiter_1_io_output_s2mPipe_m2sPipe_ready;
  wire       [31:0]   streamArbiter_1_io_output_s2mPipe_m2sPipe_payload;
  reg                 streamArbiter_1_io_output_s2mPipe_rValid;
  reg        [31:0]   streamArbiter_1_io_output_s2mPipe_rData;
  wire                when_Stream_l342_4;

  StreamArbiter streamArbiter_1 (
    .io_inputs_0_valid      (Arbiter_InterSignal_0_valid              ), //i
    .io_inputs_0_ready      (streamArbiter_1_io_inputs_0_ready        ), //o
    .io_inputs_0_payload    (Arbiter_InterSignal_0_payload[31:0]      ), //i
    .io_inputs_1_valid      (Arbiter_InterSignal_1_valid              ), //i
    .io_inputs_1_ready      (streamArbiter_1_io_inputs_1_ready        ), //o
    .io_inputs_1_payload    (Arbiter_InterSignal_1_payload[31:0]      ), //i
    .io_inputs_2_valid      (Arbiter_InterSignal_2_valid              ), //i
    .io_inputs_2_ready      (streamArbiter_1_io_inputs_2_ready        ), //o
    .io_inputs_2_payload    (Arbiter_InterSignal_2_payload[31:0]      ), //i
    .io_inputs_3_valid      (Arbiter_InterSignal_3_valid              ), //i
    .io_inputs_3_ready      (streamArbiter_1_io_inputs_3_ready        ), //o
    .io_inputs_3_payload    (Arbiter_InterSignal_3_payload[31:0]      ), //i
    .io_output_valid        (streamArbiter_1_io_output_valid          ), //o
    .io_output_ready        (streamArbiter_1_io_output_ready          ), //i
    .io_output_payload      (streamArbiter_1_io_output_payload[31:0]  ), //o
    .io_chosen              (streamArbiter_1_io_chosen[1:0]           ), //o
    .io_chosenOH            (streamArbiter_1_io_chosenOH[3:0]         ), //o
    .clk                    (clk                                      ), //i
    .reset                  (reset                                    )  //i
  );
  assign io_Arbiter_In_0_ready = (! io_Arbiter_In_0_rValid);
  assign io_Arbiter_In_0_s2mPipe_valid = (io_Arbiter_In_0_valid || io_Arbiter_In_0_rValid);
  assign io_Arbiter_In_0_s2mPipe_payload = (io_Arbiter_In_0_rValid ? io_Arbiter_In_0_rData : io_Arbiter_In_0_payload);
  always @(*) begin
    io_Arbiter_In_0_s2mPipe_ready = io_Arbiter_In_0_s2mPipe_m2sPipe_ready;
    if(when_Stream_l342) begin
      io_Arbiter_In_0_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! io_Arbiter_In_0_s2mPipe_m2sPipe_valid);
  assign io_Arbiter_In_0_s2mPipe_m2sPipe_valid = io_Arbiter_In_0_s2mPipe_rValid;
  assign io_Arbiter_In_0_s2mPipe_m2sPipe_payload = io_Arbiter_In_0_s2mPipe_rData;
  assign Arbiter_InterSignal_0_valid = io_Arbiter_In_0_s2mPipe_m2sPipe_valid;
  assign io_Arbiter_In_0_s2mPipe_m2sPipe_ready = Arbiter_InterSignal_0_ready;
  assign Arbiter_InterSignal_0_payload = io_Arbiter_In_0_s2mPipe_m2sPipe_payload;
  assign io_Arbiter_In_1_ready = (! io_Arbiter_In_1_rValid);
  assign io_Arbiter_In_1_s2mPipe_valid = (io_Arbiter_In_1_valid || io_Arbiter_In_1_rValid);
  assign io_Arbiter_In_1_s2mPipe_payload = (io_Arbiter_In_1_rValid ? io_Arbiter_In_1_rData : io_Arbiter_In_1_payload);
  always @(*) begin
    io_Arbiter_In_1_s2mPipe_ready = io_Arbiter_In_1_s2mPipe_m2sPipe_ready;
    if(when_Stream_l342_1) begin
      io_Arbiter_In_1_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! io_Arbiter_In_1_s2mPipe_m2sPipe_valid);
  assign io_Arbiter_In_1_s2mPipe_m2sPipe_valid = io_Arbiter_In_1_s2mPipe_rValid;
  assign io_Arbiter_In_1_s2mPipe_m2sPipe_payload = io_Arbiter_In_1_s2mPipe_rData;
  assign Arbiter_InterSignal_1_valid = io_Arbiter_In_1_s2mPipe_m2sPipe_valid;
  assign io_Arbiter_In_1_s2mPipe_m2sPipe_ready = Arbiter_InterSignal_1_ready;
  assign Arbiter_InterSignal_1_payload = io_Arbiter_In_1_s2mPipe_m2sPipe_payload;
  assign io_Arbiter_In_2_ready = (! io_Arbiter_In_2_rValid);
  assign io_Arbiter_In_2_s2mPipe_valid = (io_Arbiter_In_2_valid || io_Arbiter_In_2_rValid);
  assign io_Arbiter_In_2_s2mPipe_payload = (io_Arbiter_In_2_rValid ? io_Arbiter_In_2_rData : io_Arbiter_In_2_payload);
  always @(*) begin
    io_Arbiter_In_2_s2mPipe_ready = io_Arbiter_In_2_s2mPipe_m2sPipe_ready;
    if(when_Stream_l342_2) begin
      io_Arbiter_In_2_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_2 = (! io_Arbiter_In_2_s2mPipe_m2sPipe_valid);
  assign io_Arbiter_In_2_s2mPipe_m2sPipe_valid = io_Arbiter_In_2_s2mPipe_rValid;
  assign io_Arbiter_In_2_s2mPipe_m2sPipe_payload = io_Arbiter_In_2_s2mPipe_rData;
  assign Arbiter_InterSignal_2_valid = io_Arbiter_In_2_s2mPipe_m2sPipe_valid;
  assign io_Arbiter_In_2_s2mPipe_m2sPipe_ready = Arbiter_InterSignal_2_ready;
  assign Arbiter_InterSignal_2_payload = io_Arbiter_In_2_s2mPipe_m2sPipe_payload;
  assign io_Arbiter_In_3_ready = (! io_Arbiter_In_3_rValid);
  assign io_Arbiter_In_3_s2mPipe_valid = (io_Arbiter_In_3_valid || io_Arbiter_In_3_rValid);
  assign io_Arbiter_In_3_s2mPipe_payload = (io_Arbiter_In_3_rValid ? io_Arbiter_In_3_rData : io_Arbiter_In_3_payload);
  always @(*) begin
    io_Arbiter_In_3_s2mPipe_ready = io_Arbiter_In_3_s2mPipe_m2sPipe_ready;
    if(when_Stream_l342_3) begin
      io_Arbiter_In_3_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_3 = (! io_Arbiter_In_3_s2mPipe_m2sPipe_valid);
  assign io_Arbiter_In_3_s2mPipe_m2sPipe_valid = io_Arbiter_In_3_s2mPipe_rValid;
  assign io_Arbiter_In_3_s2mPipe_m2sPipe_payload = io_Arbiter_In_3_s2mPipe_rData;
  assign Arbiter_InterSignal_3_valid = io_Arbiter_In_3_s2mPipe_m2sPipe_valid;
  assign io_Arbiter_In_3_s2mPipe_m2sPipe_ready = Arbiter_InterSignal_3_ready;
  assign Arbiter_InterSignal_3_payload = io_Arbiter_In_3_s2mPipe_m2sPipe_payload;
  assign Arbiter_InterSignal_0_ready = streamArbiter_1_io_inputs_0_ready;
  assign Arbiter_InterSignal_1_ready = streamArbiter_1_io_inputs_1_ready;
  assign Arbiter_InterSignal_2_ready = streamArbiter_1_io_inputs_2_ready;
  assign Arbiter_InterSignal_3_ready = streamArbiter_1_io_inputs_3_ready;
  assign streamArbiter_1_io_output_ready = (! streamArbiter_1_io_output_rValid);
  assign streamArbiter_1_io_output_s2mPipe_valid = (streamArbiter_1_io_output_valid || streamArbiter_1_io_output_rValid);
  assign streamArbiter_1_io_output_s2mPipe_payload = (streamArbiter_1_io_output_rValid ? streamArbiter_1_io_output_rData : streamArbiter_1_io_output_payload);
  always @(*) begin
    streamArbiter_1_io_output_s2mPipe_ready = streamArbiter_1_io_output_s2mPipe_m2sPipe_ready;
    if(when_Stream_l342_4) begin
      streamArbiter_1_io_output_s2mPipe_ready = 1'b1;
    end
  end

  assign when_Stream_l342_4 = (! streamArbiter_1_io_output_s2mPipe_m2sPipe_valid);
  assign streamArbiter_1_io_output_s2mPipe_m2sPipe_valid = streamArbiter_1_io_output_s2mPipe_rValid;
  assign streamArbiter_1_io_output_s2mPipe_m2sPipe_payload = streamArbiter_1_io_output_s2mPipe_rData;
  assign Arbiter_InterSignal_4_valid = streamArbiter_1_io_output_s2mPipe_m2sPipe_valid;
  assign streamArbiter_1_io_output_s2mPipe_m2sPipe_ready = Arbiter_InterSignal_4_ready;
  assign Arbiter_InterSignal_4_payload = streamArbiter_1_io_output_s2mPipe_m2sPipe_payload;
  assign io_Arbiter_Out_valid = Arbiter_InterSignal_4_valid;
  assign Arbiter_InterSignal_4_ready = io_Arbiter_Out_ready;
  assign io_Arbiter_Out_payload = Arbiter_InterSignal_4_payload;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      io_Arbiter_In_0_rValid <= 1'b0;
      io_Arbiter_In_0_s2mPipe_rValid <= 1'b0;
      io_Arbiter_In_1_rValid <= 1'b0;
      io_Arbiter_In_1_s2mPipe_rValid <= 1'b0;
      io_Arbiter_In_2_rValid <= 1'b0;
      io_Arbiter_In_2_s2mPipe_rValid <= 1'b0;
      io_Arbiter_In_3_rValid <= 1'b0;
      io_Arbiter_In_3_s2mPipe_rValid <= 1'b0;
      streamArbiter_1_io_output_rValid <= 1'b0;
      streamArbiter_1_io_output_s2mPipe_rValid <= 1'b0;
    end else begin
      if(io_Arbiter_In_0_valid) begin
        io_Arbiter_In_0_rValid <= 1'b1;
      end
      if(io_Arbiter_In_0_s2mPipe_ready) begin
        io_Arbiter_In_0_rValid <= 1'b0;
      end
      if(io_Arbiter_In_0_s2mPipe_ready) begin
        io_Arbiter_In_0_s2mPipe_rValid <= io_Arbiter_In_0_s2mPipe_valid;
      end
      if(io_Arbiter_In_1_valid) begin
        io_Arbiter_In_1_rValid <= 1'b1;
      end
      if(io_Arbiter_In_1_s2mPipe_ready) begin
        io_Arbiter_In_1_rValid <= 1'b0;
      end
      if(io_Arbiter_In_1_s2mPipe_ready) begin
        io_Arbiter_In_1_s2mPipe_rValid <= io_Arbiter_In_1_s2mPipe_valid;
      end
      if(io_Arbiter_In_2_valid) begin
        io_Arbiter_In_2_rValid <= 1'b1;
      end
      if(io_Arbiter_In_2_s2mPipe_ready) begin
        io_Arbiter_In_2_rValid <= 1'b0;
      end
      if(io_Arbiter_In_2_s2mPipe_ready) begin
        io_Arbiter_In_2_s2mPipe_rValid <= io_Arbiter_In_2_s2mPipe_valid;
      end
      if(io_Arbiter_In_3_valid) begin
        io_Arbiter_In_3_rValid <= 1'b1;
      end
      if(io_Arbiter_In_3_s2mPipe_ready) begin
        io_Arbiter_In_3_rValid <= 1'b0;
      end
      if(io_Arbiter_In_3_s2mPipe_ready) begin
        io_Arbiter_In_3_s2mPipe_rValid <= io_Arbiter_In_3_s2mPipe_valid;
      end
      if(streamArbiter_1_io_output_valid) begin
        streamArbiter_1_io_output_rValid <= 1'b1;
      end
      if(streamArbiter_1_io_output_s2mPipe_ready) begin
        streamArbiter_1_io_output_rValid <= 1'b0;
      end
      if(streamArbiter_1_io_output_s2mPipe_ready) begin
        streamArbiter_1_io_output_s2mPipe_rValid <= streamArbiter_1_io_output_s2mPipe_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(io_Arbiter_In_0_ready) begin
      io_Arbiter_In_0_rData <= io_Arbiter_In_0_payload;
    end
    if(io_Arbiter_In_0_s2mPipe_ready) begin
      io_Arbiter_In_0_s2mPipe_rData <= io_Arbiter_In_0_s2mPipe_payload;
    end
    if(io_Arbiter_In_1_ready) begin
      io_Arbiter_In_1_rData <= io_Arbiter_In_1_payload;
    end
    if(io_Arbiter_In_1_s2mPipe_ready) begin
      io_Arbiter_In_1_s2mPipe_rData <= io_Arbiter_In_1_s2mPipe_payload;
    end
    if(io_Arbiter_In_2_ready) begin
      io_Arbiter_In_2_rData <= io_Arbiter_In_2_payload;
    end
    if(io_Arbiter_In_2_s2mPipe_ready) begin
      io_Arbiter_In_2_s2mPipe_rData <= io_Arbiter_In_2_s2mPipe_payload;
    end
    if(io_Arbiter_In_3_ready) begin
      io_Arbiter_In_3_rData <= io_Arbiter_In_3_payload;
    end
    if(io_Arbiter_In_3_s2mPipe_ready) begin
      io_Arbiter_In_3_s2mPipe_rData <= io_Arbiter_In_3_s2mPipe_payload;
    end
    if(streamArbiter_1_io_output_ready) begin
      streamArbiter_1_io_output_rData <= streamArbiter_1_io_output_payload;
    end
    if(streamArbiter_1_io_output_s2mPipe_ready) begin
      streamArbiter_1_io_output_s2mPipe_rData <= streamArbiter_1_io_output_s2mPipe_payload;
    end
  end


endmodule

module StreamArbiter (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [31:0]   io_inputs_0_payload,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [31:0]   io_inputs_1_payload,
  input               io_inputs_2_valid,
  output              io_inputs_2_ready,
  input      [31:0]   io_inputs_2_payload,
  input               io_inputs_3_valid,
  output              io_inputs_3_ready,
  input      [31:0]   io_inputs_3_payload,
  output              io_output_valid,
  input               io_output_ready,
  output     [31:0]   io_output_payload,
  output     [1:0]    io_chosen,
  output     [3:0]    io_chosenOH,
  input               clk,
  input               reset
);

  wire       [7:0]    _zz__zz_maskProposal_0_2;
  wire       [7:0]    _zz__zz_maskProposal_0_2_1;
  wire       [3:0]    _zz__zz_maskProposal_0_2_2;
  reg        [31:0]   _zz_io_output_payload_2;
  wire       [1:0]    _zz_io_output_payload_3;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  wire                maskProposal_2;
  wire                maskProposal_3;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  reg                 maskLocked_2;
  reg                 maskLocked_3;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire                maskRouted_2;
  wire                maskRouted_3;
  wire       [3:0]    _zz_maskProposal_0;
  wire       [7:0]    _zz_maskProposal_0_1;
  wire       [7:0]    _zz_maskProposal_0_2;
  wire       [3:0]    _zz_maskProposal_0_3;
  wire                io_output_fire;
  wire                _zz_io_output_payload;
  wire                _zz_io_output_payload_1;
  wire                _zz_io_chosen;
  wire                _zz_io_chosen_1;
  wire                _zz_io_chosen_2;

  assign _zz__zz_maskProposal_0_2 = (_zz_maskProposal_0_1 - _zz__zz_maskProposal_0_2_1);
  assign _zz__zz_maskProposal_0_2_2 = {maskLocked_2,{maskLocked_1,{maskLocked_0,maskLocked_3}}};
  assign _zz__zz_maskProposal_0_2_1 = {4'd0, _zz__zz_maskProposal_0_2_2};
  assign _zz_io_output_payload_3 = {_zz_io_output_payload_1,_zz_io_output_payload};
  always @(*) begin
    case(_zz_io_output_payload_3)
      2'b00 : _zz_io_output_payload_2 = io_inputs_0_payload;
      2'b01 : _zz_io_output_payload_2 = io_inputs_1_payload;
      2'b10 : _zz_io_output_payload_2 = io_inputs_2_payload;
      default : _zz_io_output_payload_2 = io_inputs_3_payload;
    endcase
  end

  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign maskRouted_2 = (locked ? maskLocked_2 : maskProposal_2);
  assign maskRouted_3 = (locked ? maskLocked_3 : maskProposal_3);
  assign _zz_maskProposal_0 = {io_inputs_3_valid,{io_inputs_2_valid,{io_inputs_1_valid,io_inputs_0_valid}}};
  assign _zz_maskProposal_0_1 = {_zz_maskProposal_0,_zz_maskProposal_0};
  assign _zz_maskProposal_0_2 = (_zz_maskProposal_0_1 & (~ _zz__zz_maskProposal_0_2));
  assign _zz_maskProposal_0_3 = (_zz_maskProposal_0_2[7 : 4] | _zz_maskProposal_0_2[3 : 0]);
  assign maskProposal_0 = _zz_maskProposal_0_3[0];
  assign maskProposal_1 = _zz_maskProposal_0_3[1];
  assign maskProposal_2 = _zz_maskProposal_0_3[2];
  assign maskProposal_3 = _zz_maskProposal_0_3[3];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1)) || (io_inputs_2_valid && maskRouted_2)) || (io_inputs_3_valid && maskRouted_3));
  assign _zz_io_output_payload = (maskRouted_1 || maskRouted_3);
  assign _zz_io_output_payload_1 = (maskRouted_2 || maskRouted_3);
  assign io_output_payload = _zz_io_output_payload_2;
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_inputs_2_ready = (maskRouted_2 && io_output_ready);
  assign io_inputs_3_ready = (maskRouted_3 && io_output_ready);
  assign io_chosenOH = {maskRouted_3,{maskRouted_2,{maskRouted_1,maskRouted_0}}};
  assign _zz_io_chosen = io_chosenOH[3];
  assign _zz_io_chosen_1 = (io_chosenOH[1] || _zz_io_chosen);
  assign _zz_io_chosen_2 = (io_chosenOH[2] || _zz_io_chosen);
  assign io_chosen = {_zz_io_chosen_2,_zz_io_chosen_1};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      locked <= 1'b0;
      maskLocked_0 <= 1'b0;
      maskLocked_1 <= 1'b0;
      maskLocked_2 <= 1'b0;
      maskLocked_3 <= 1'b1;
    end else begin
      if(io_output_valid) begin
        maskLocked_0 <= maskRouted_0;
        maskLocked_1 <= maskRouted_1;
        maskLocked_2 <= maskRouted_2;
        maskLocked_3 <= maskRouted_3;
      end
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end
  
 initial begin
  $dumpfile("Arbiter.vcd");
  $dumpvars(0,Arbiter);
 end


endmodule
