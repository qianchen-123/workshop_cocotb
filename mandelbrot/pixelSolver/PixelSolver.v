// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : PixelSolver
// Git hash  : 89d7543c7219f82d1991c9174f1b313aba4435ca

`timescale 1ns/1ps 

module PixelSolver (
  input               io_cmd_valid,
  output              io_cmd_ready,
  input      [27:0]   io_cmd_payload_x,
  input      [27:0]   io_cmd_payload_y,
  output              io_rsp_valid,
  input               io_rsp_ready,
  output     [5:0]    io_rsp_payload_iteration,
  input               clk,
  input               reset
);

  wire       [2:0]    _zz_Inserter_taskId_valueNext;
  wire       [0:0]    _zz_Inserter_taskId_valueNext_1;
  wire       [35:0]   _zz_Mulstage_output_payload_xx;
  wire       [55:0]   _zz_Mulstage_output_payload_xx_1;
  wire       [35:0]   _zz_Mulstage_output_payload_yy;
  wire       [55:0]   _zz_Mulstage_output_payload_yy_1;
  wire       [35:0]   _zz_Mulstage_output_payload_xy;
  wire       [55:0]   _zz_Mulstage_output_payload_xy_1;
  wire       [27:0]   _zz_AddStage_output_payload_x;
  wire       [28:0]   _zz_AddStage_output_payload_y;
  wire       [28:0]   _zz_AddStage_output_payload_y_1;
  wire       [28:0]   _zz_AddStage_output_payload_y_2;
  wire       [27:0]   _zz_AddStage_output_payload_done;
  wire       [27:0]   _zz_AddStage_output_payload_done_1;
  wire       [5:0]    _zz_AddStage_output_payload_iteration;
  wire       [0:0]    _zz_AddStage_output_payload_iteration_1;
  wire       [2:0]    _zz_Rounter_taskId_valueNext;
  wire       [0:0]    _zz_Rounter_taskId_valueNext_1;
  wire       [2:0]    Inserter_cmdContext_id;
  wire       [27:0]   Inserter_cmdContext_x0;
  wire       [27:0]   Inserter_cmdContext_y0;
  wire       [5:0]    Inserter_cmdContext_iteration;
  wire                Inserter_cmdContext_done;
  wire       [27:0]   Inserter_cmdContext_x;
  wire       [27:0]   Inserter_cmdContext_y;
  wire                Inserter_loopBack_valid;
  wire       [2:0]    Inserter_loopBack_payload_id;
  wire       [27:0]   Inserter_loopBack_payload_x0;
  wire       [27:0]   Inserter_loopBack_payload_y0;
  wire       [5:0]    Inserter_loopBack_payload_iteration;
  wire                Inserter_loopBack_payload_done;
  wire       [27:0]   Inserter_loopBack_payload_x;
  wire       [27:0]   Inserter_loopBack_payload_y;
  wire                Inserter_output_valid;
  reg        [2:0]    Inserter_output_payload_id;
  reg        [27:0]   Inserter_output_payload_x0;
  reg        [27:0]   Inserter_output_payload_y0;
  reg        [5:0]    Inserter_output_payload_iteration;
  reg                 Inserter_output_payload_done;
  reg        [27:0]   Inserter_output_payload_x;
  reg        [27:0]   Inserter_output_payload_y;
  wire                io_cmd_fire;
  reg                 Inserter_taskId_willIncrement;
  wire                Inserter_taskId_willClear;
  reg        [2:0]    Inserter_taskId_valueNext;
  reg        [2:0]    Inserter_taskId_value;
  wire                Inserter_taskId_willOverflowIfInc;
  wire                Inserter_taskId_willOverflow;
  reg                 Mulstage_input_valid;
  reg        [2:0]    Mulstage_input_payload_id;
  reg        [27:0]   Mulstage_input_payload_x0;
  reg        [27:0]   Mulstage_input_payload_y0;
  reg        [5:0]    Mulstage_input_payload_iteration;
  reg                 Mulstage_input_payload_done;
  reg        [27:0]   Mulstage_input_payload_x;
  reg        [27:0]   Mulstage_input_payload_y;
  wire                Mulstage_output_valid;
  wire       [2:0]    Mulstage_output_payload_id;
  wire       [27:0]   Mulstage_output_payload_x0;
  wire       [27:0]   Mulstage_output_payload_y0;
  wire       [5:0]    Mulstage_output_payload_iteration;
  wire                Mulstage_output_payload_done;
  wire       [27:0]   Mulstage_output_payload_xx;
  wire       [27:0]   Mulstage_output_payload_yy;
  wire       [27:0]   Mulstage_output_payload_xy;
  reg                 AddStage_input_valid;
  reg        [2:0]    AddStage_input_payload_id;
  reg        [27:0]   AddStage_input_payload_x0;
  reg        [27:0]   AddStage_input_payload_y0;
  reg        [5:0]    AddStage_input_payload_iteration;
  reg                 AddStage_input_payload_done;
  reg        [27:0]   AddStage_input_payload_xx;
  reg        [27:0]   AddStage_input_payload_yy;
  reg        [27:0]   AddStage_input_payload_xy;
  wire                AddStage_output_valid;
  wire       [2:0]    AddStage_output_payload_id;
  wire       [27:0]   AddStage_output_payload_x0;
  wire       [27:0]   AddStage_output_payload_y0;
  reg        [5:0]    AddStage_output_payload_iteration;
  reg                 AddStage_output_payload_done;
  wire       [27:0]   AddStage_output_payload_x;
  wire       [27:0]   AddStage_output_payload_y;
  reg                 Rounter_input_valid;
  reg        [2:0]    Rounter_input_payload_id;
  reg        [27:0]   Rounter_input_payload_x0;
  reg        [27:0]   Rounter_input_payload_y0;
  reg        [5:0]    Rounter_input_payload_iteration;
  reg                 Rounter_input_payload_done;
  reg        [27:0]   Rounter_input_payload_x;
  reg        [27:0]   Rounter_input_payload_y;
  wire                io_rsp_fire;
  reg                 Rounter_taskId_willIncrement;
  wire                Rounter_taskId_willClear;
  reg        [2:0]    Rounter_taskId_valueNext;
  reg        [2:0]    Rounter_taskId_value;
  wire                Rounter_taskId_willOverflowIfInc;
  wire                Rounter_taskId_willOverflow;

  assign _zz_Inserter_taskId_valueNext_1 = Inserter_taskId_willIncrement;
  assign _zz_Inserter_taskId_valueNext = {2'd0, _zz_Inserter_taskId_valueNext_1};
  assign _zz_Mulstage_output_payload_xx = (_zz_Mulstage_output_payload_xx_1 >>> 20);
  assign _zz_Mulstage_output_payload_xx_1 = ($signed(Mulstage_input_payload_x) * $signed(Mulstage_input_payload_x));
  assign _zz_Mulstage_output_payload_yy = (_zz_Mulstage_output_payload_yy_1 >>> 20);
  assign _zz_Mulstage_output_payload_yy_1 = ($signed(Mulstage_input_payload_y) * $signed(Mulstage_input_payload_y));
  assign _zz_Mulstage_output_payload_xy = (_zz_Mulstage_output_payload_xy_1 >>> 20);
  assign _zz_Mulstage_output_payload_xy_1 = ($signed(Mulstage_input_payload_x) * $signed(Mulstage_input_payload_y));
  assign _zz_AddStage_output_payload_x = ($signed(AddStage_input_payload_xx) - $signed(AddStage_input_payload_yy));
  assign _zz_AddStage_output_payload_y = ($signed(_zz_AddStage_output_payload_y_1) + $signed(_zz_AddStage_output_payload_y_2));
  assign _zz_AddStage_output_payload_y_1 = ({1'd0,AddStage_input_payload_xy} <<< 1);
  assign _zz_AddStage_output_payload_y_2 = {{1{AddStage_input_payload_y0[27]}}, AddStage_input_payload_y0};
  assign _zz_AddStage_output_payload_done = 28'h0400000;
  assign _zz_AddStage_output_payload_done_1 = ($signed(AddStage_input_payload_xx) + $signed(AddStage_input_payload_yy));
  assign _zz_AddStage_output_payload_iteration_1 = (! AddStage_output_payload_done);
  assign _zz_AddStage_output_payload_iteration = {5'd0, _zz_AddStage_output_payload_iteration_1};
  assign _zz_Rounter_taskId_valueNext_1 = Rounter_taskId_willIncrement;
  assign _zz_Rounter_taskId_valueNext = {2'd0, _zz_Rounter_taskId_valueNext_1};
  assign io_cmd_fire = (io_cmd_valid && io_cmd_ready);
  always @(*) begin
    Inserter_taskId_willIncrement = 1'b0;
    if(io_cmd_fire) begin
      Inserter_taskId_willIncrement = 1'b1;
    end
  end

  assign Inserter_taskId_willClear = 1'b0;
  assign Inserter_taskId_willOverflowIfInc = (Inserter_taskId_value == 3'b111);
  assign Inserter_taskId_willOverflow = (Inserter_taskId_willOverflowIfInc && Inserter_taskId_willIncrement);
  always @(*) begin
    Inserter_taskId_valueNext = (Inserter_taskId_value + _zz_Inserter_taskId_valueNext);
    if(Inserter_taskId_willClear) begin
      Inserter_taskId_valueNext = 3'b000;
    end
  end

  assign Inserter_cmdContext_id = Inserter_taskId_value;
  assign Inserter_cmdContext_x0 = io_cmd_payload_x;
  assign Inserter_cmdContext_y0 = io_cmd_payload_y;
  assign Inserter_cmdContext_x = 28'h0;
  assign Inserter_cmdContext_y = 28'h0;
  assign Inserter_cmdContext_iteration = 6'h0;
  assign Inserter_cmdContext_done = 1'b0;
  assign Inserter_output_valid = (io_cmd_valid || Inserter_loopBack_valid);
  always @(*) begin
    if(Inserter_loopBack_valid) begin
      Inserter_output_payload_id = Inserter_loopBack_payload_id;
    end else begin
      Inserter_output_payload_id = Inserter_cmdContext_id;
    end
  end

  always @(*) begin
    if(Inserter_loopBack_valid) begin
      Inserter_output_payload_x0 = Inserter_loopBack_payload_x0;
    end else begin
      Inserter_output_payload_x0 = Inserter_cmdContext_x0;
    end
  end

  always @(*) begin
    if(Inserter_loopBack_valid) begin
      Inserter_output_payload_y0 = Inserter_loopBack_payload_y0;
    end else begin
      Inserter_output_payload_y0 = Inserter_cmdContext_y0;
    end
  end

  always @(*) begin
    if(Inserter_loopBack_valid) begin
      Inserter_output_payload_iteration = Inserter_loopBack_payload_iteration;
    end else begin
      Inserter_output_payload_iteration = Inserter_cmdContext_iteration;
    end
  end

  always @(*) begin
    if(Inserter_loopBack_valid) begin
      Inserter_output_payload_done = Inserter_loopBack_payload_done;
    end else begin
      Inserter_output_payload_done = Inserter_cmdContext_done;
    end
  end

  always @(*) begin
    if(Inserter_loopBack_valid) begin
      Inserter_output_payload_x = Inserter_loopBack_payload_x;
    end else begin
      Inserter_output_payload_x = Inserter_cmdContext_x;
    end
  end

  always @(*) begin
    if(Inserter_loopBack_valid) begin
      Inserter_output_payload_y = Inserter_loopBack_payload_y;
    end else begin
      Inserter_output_payload_y = Inserter_cmdContext_y;
    end
  end

  assign io_cmd_ready = (! Inserter_loopBack_valid);
  assign Mulstage_output_valid = Mulstage_input_valid;
  assign Mulstage_output_payload_id = Mulstage_input_payload_id;
  assign Mulstage_output_payload_x0 = Mulstage_input_payload_x0;
  assign Mulstage_output_payload_y0 = Mulstage_input_payload_y0;
  assign Mulstage_output_payload_iteration = Mulstage_input_payload_iteration;
  assign Mulstage_output_payload_done = Mulstage_input_payload_done;
  assign Mulstage_output_payload_xx = _zz_Mulstage_output_payload_xx[27:0];
  assign Mulstage_output_payload_yy = _zz_Mulstage_output_payload_yy[27:0];
  assign Mulstage_output_payload_xy = _zz_Mulstage_output_payload_xy[27:0];
  assign AddStage_output_valid = AddStage_input_valid;
  assign AddStage_output_payload_id = AddStage_input_payload_id;
  assign AddStage_output_payload_x0 = AddStage_input_payload_x0;
  assign AddStage_output_payload_y0 = AddStage_input_payload_y0;
  always @(*) begin
    AddStage_output_payload_iteration = AddStage_input_payload_iteration;
    AddStage_output_payload_iteration = (AddStage_input_payload_iteration + _zz_AddStage_output_payload_iteration);
  end

  always @(*) begin
    AddStage_output_payload_done = AddStage_input_payload_done;
    AddStage_output_payload_done = ((AddStage_input_payload_done || ($signed(_zz_AddStage_output_payload_done) <= $signed(_zz_AddStage_output_payload_done_1))) || (AddStage_input_payload_iteration == 6'h3f));
  end

  assign AddStage_output_payload_x = ($signed(_zz_AddStage_output_payload_x) + $signed(AddStage_input_payload_x0));
  assign AddStage_output_payload_y = _zz_AddStage_output_payload_y[27:0];
  assign io_rsp_fire = (io_rsp_valid && io_rsp_ready);
  always @(*) begin
    Rounter_taskId_willIncrement = 1'b0;
    if(io_rsp_fire) begin
      Rounter_taskId_willIncrement = 1'b1;
    end
  end

  assign Rounter_taskId_willClear = 1'b0;
  assign Rounter_taskId_willOverflowIfInc = (Rounter_taskId_value == 3'b111);
  assign Rounter_taskId_willOverflow = (Rounter_taskId_willOverflowIfInc && Rounter_taskId_willIncrement);
  always @(*) begin
    Rounter_taskId_valueNext = (Rounter_taskId_value + _zz_Rounter_taskId_valueNext);
    if(Rounter_taskId_willClear) begin
      Rounter_taskId_valueNext = 3'b000;
    end
  end

  assign io_rsp_valid = ((Rounter_input_valid && Rounter_input_payload_done) && (Rounter_taskId_value == Rounter_input_payload_id));
  assign io_rsp_payload_iteration = Rounter_input_payload_iteration;
  assign Inserter_loopBack_valid = (Rounter_input_valid && ((! (Rounter_input_payload_done && (Rounter_taskId_value == Rounter_input_payload_id))) || (! io_rsp_ready)));
  assign Inserter_loopBack_payload_id = Rounter_input_payload_id;
  assign Inserter_loopBack_payload_x0 = Rounter_input_payload_x0;
  assign Inserter_loopBack_payload_y0 = Rounter_input_payload_y0;
  assign Inserter_loopBack_payload_iteration = Rounter_input_payload_iteration;
  assign Inserter_loopBack_payload_done = Rounter_input_payload_done;
  assign Inserter_loopBack_payload_x = Rounter_input_payload_x;
  assign Inserter_loopBack_payload_y = Rounter_input_payload_y;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      Inserter_taskId_value <= 3'b000;
      Mulstage_input_valid <= 1'b0;
      AddStage_input_valid <= 1'b0;
      Rounter_input_valid <= 1'b0;
      Rounter_taskId_value <= 3'b000;
    end else begin
      Inserter_taskId_value <= Inserter_taskId_valueNext;
      Mulstage_input_valid <= Inserter_output_valid;
      AddStage_input_valid <= Mulstage_output_valid;
      Rounter_input_valid <= AddStage_output_valid;
      Rounter_taskId_value <= Rounter_taskId_valueNext;
    end
  end

  always @(posedge clk) begin
    Mulstage_input_payload_id <= Inserter_output_payload_id;
    Mulstage_input_payload_x0 <= Inserter_output_payload_x0;
    Mulstage_input_payload_y0 <= Inserter_output_payload_y0;
    Mulstage_input_payload_iteration <= Inserter_output_payload_iteration;
    Mulstage_input_payload_done <= Inserter_output_payload_done;
    Mulstage_input_payload_x <= Inserter_output_payload_x;
    Mulstage_input_payload_y <= Inserter_output_payload_y;
    AddStage_input_payload_id <= Mulstage_output_payload_id;
    AddStage_input_payload_x0 <= Mulstage_output_payload_x0;
    AddStage_input_payload_y0 <= Mulstage_output_payload_y0;
    AddStage_input_payload_iteration <= Mulstage_output_payload_iteration;
    AddStage_input_payload_done <= Mulstage_output_payload_done;
    AddStage_input_payload_xx <= Mulstage_output_payload_xx;
    AddStage_input_payload_yy <= Mulstage_output_payload_yy;
    AddStage_input_payload_xy <= Mulstage_output_payload_xy;
    Rounter_input_payload_id <= AddStage_output_payload_id;
    Rounter_input_payload_x0 <= AddStage_output_payload_x0;
    Rounter_input_payload_y0 <= AddStage_output_payload_y0;
    Rounter_input_payload_iteration <= AddStage_output_payload_iteration;
    Rounter_input_payload_done <= AddStage_output_payload_done;
    Rounter_input_payload_x <= AddStage_output_payload_x;
    Rounter_input_payload_y <= AddStage_output_payload_y;
  end

  initial begin
    $dumpfile("PixelSolver_test.vcd");
    $dumpvars(0, PixelSolver);
  end


endmodule
