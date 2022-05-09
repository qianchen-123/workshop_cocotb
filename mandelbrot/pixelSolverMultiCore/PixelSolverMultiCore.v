// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : PixelSolverMultiCore
// Git hash  : 89d7543c7219f82d1991c9174f1b313aba4435ca

`timescale 1ns/1ps 

module PixelSolverMultiCore (
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

  reg                 pixelTaskDispatcher_io_outputs_0_ready;
  reg                 pixelTaskDispatcher_io_outputs_1_ready;
  reg                 pixelTaskDispatcher_io_outputs_2_ready;
  reg                 pixelTaskDispatcher_io_outputs_3_ready;
  reg                 pixelTaskDispatcher_io_outputs_4_ready;
  reg                 pixelTaskDispatcher_io_outputs_5_ready;
  reg                 pixelTaskDispatcher_io_outputs_6_ready;
  reg                 pixelTaskDispatcher_io_outputs_7_ready;
  reg                 pixelTaskSolver_0_io_rsp_ready;
  reg                 pixelTaskSolver_1_io_rsp_ready;
  reg                 pixelTaskSolver_2_io_rsp_ready;
  reg                 pixelTaskSolver_3_io_rsp_ready;
  reg                 pixelTaskSolver_4_io_rsp_ready;
  reg                 pixelTaskSolver_5_io_rsp_ready;
  reg                 pixelTaskSolver_6_io_rsp_ready;
  reg                 pixelTaskSolver_7_io_rsp_ready;
  wire                pixelTaskDispatcher_io_input_ready;
  wire                pixelTaskDispatcher_io_outputs_0_valid;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_0_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_0_payload_y;
  wire                pixelTaskDispatcher_io_outputs_1_valid;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_1_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_1_payload_y;
  wire                pixelTaskDispatcher_io_outputs_2_valid;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_2_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_2_payload_y;
  wire                pixelTaskDispatcher_io_outputs_3_valid;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_3_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_3_payload_y;
  wire                pixelTaskDispatcher_io_outputs_4_valid;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_4_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_4_payload_y;
  wire                pixelTaskDispatcher_io_outputs_5_valid;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_5_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_5_payload_y;
  wire                pixelTaskDispatcher_io_outputs_6_valid;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_6_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_6_payload_y;
  wire                pixelTaskDispatcher_io_outputs_7_valid;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_7_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_7_payload_y;
  wire                pixelTaskSolver_0_io_cmd_ready;
  wire                pixelTaskSolver_0_io_rsp_valid;
  wire       [5:0]    pixelTaskSolver_0_io_rsp_payload_iteration;
  wire                pixelTaskSolver_1_io_cmd_ready;
  wire                pixelTaskSolver_1_io_rsp_valid;
  wire       [5:0]    pixelTaskSolver_1_io_rsp_payload_iteration;
  wire                pixelTaskSolver_2_io_cmd_ready;
  wire                pixelTaskSolver_2_io_rsp_valid;
  wire       [5:0]    pixelTaskSolver_2_io_rsp_payload_iteration;
  wire                pixelTaskSolver_3_io_cmd_ready;
  wire                pixelTaskSolver_3_io_rsp_valid;
  wire       [5:0]    pixelTaskSolver_3_io_rsp_payload_iteration;
  wire                pixelTaskSolver_4_io_cmd_ready;
  wire                pixelTaskSolver_4_io_rsp_valid;
  wire       [5:0]    pixelTaskSolver_4_io_rsp_payload_iteration;
  wire                pixelTaskSolver_5_io_cmd_ready;
  wire                pixelTaskSolver_5_io_rsp_valid;
  wire       [5:0]    pixelTaskSolver_5_io_rsp_payload_iteration;
  wire                pixelTaskSolver_6_io_cmd_ready;
  wire                pixelTaskSolver_6_io_rsp_valid;
  wire       [5:0]    pixelTaskSolver_6_io_rsp_payload_iteration;
  wire                pixelTaskSolver_7_io_cmd_ready;
  wire                pixelTaskSolver_7_io_rsp_valid;
  wire       [5:0]    pixelTaskSolver_7_io_rsp_payload_iteration;
  wire                pixelResultArbiter_io_inputs_0_ready;
  wire                pixelResultArbiter_io_inputs_1_ready;
  wire                pixelResultArbiter_io_inputs_2_ready;
  wire                pixelResultArbiter_io_inputs_3_ready;
  wire                pixelResultArbiter_io_inputs_4_ready;
  wire                pixelResultArbiter_io_inputs_5_ready;
  wire                pixelResultArbiter_io_inputs_6_ready;
  wire                pixelResultArbiter_io_inputs_7_ready;
  wire                pixelResultArbiter_io_output_valid;
  wire       [5:0]    pixelResultArbiter_io_output_payload_iteration;
  wire                pixelTaskDispatcher_io_outputs_0_m2sPipe_valid;
  wire                pixelTaskDispatcher_io_outputs_0_m2sPipe_ready;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_0_m2sPipe_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_0_m2sPipe_payload_y;
  reg                 pixelTaskDispatcher_io_outputs_0_rValid;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_0_rData_x;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_0_rData_y;
  wire                when_Stream_l342;
  wire                pixelTaskSolver_0_io_rsp_m2sPipe_valid;
  wire                pixelTaskSolver_0_io_rsp_m2sPipe_ready;
  wire       [5:0]    pixelTaskSolver_0_io_rsp_m2sPipe_payload_iteration;
  reg                 pixelTaskSolver_0_io_rsp_rValid;
  reg        [5:0]    pixelTaskSolver_0_io_rsp_rData_iteration;
  wire                when_Stream_l342_1;
  wire                pixelTaskDispatcher_io_outputs_1_m2sPipe_valid;
  wire                pixelTaskDispatcher_io_outputs_1_m2sPipe_ready;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_1_m2sPipe_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_1_m2sPipe_payload_y;
  reg                 pixelTaskDispatcher_io_outputs_1_rValid;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_1_rData_x;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_1_rData_y;
  wire                when_Stream_l342_2;
  wire                pixelTaskSolver_1_io_rsp_m2sPipe_valid;
  wire                pixelTaskSolver_1_io_rsp_m2sPipe_ready;
  wire       [5:0]    pixelTaskSolver_1_io_rsp_m2sPipe_payload_iteration;
  reg                 pixelTaskSolver_1_io_rsp_rValid;
  reg        [5:0]    pixelTaskSolver_1_io_rsp_rData_iteration;
  wire                when_Stream_l342_3;
  wire                pixelTaskDispatcher_io_outputs_2_m2sPipe_valid;
  wire                pixelTaskDispatcher_io_outputs_2_m2sPipe_ready;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_2_m2sPipe_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_2_m2sPipe_payload_y;
  reg                 pixelTaskDispatcher_io_outputs_2_rValid;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_2_rData_x;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_2_rData_y;
  wire                when_Stream_l342_4;
  wire                pixelTaskSolver_2_io_rsp_m2sPipe_valid;
  wire                pixelTaskSolver_2_io_rsp_m2sPipe_ready;
  wire       [5:0]    pixelTaskSolver_2_io_rsp_m2sPipe_payload_iteration;
  reg                 pixelTaskSolver_2_io_rsp_rValid;
  reg        [5:0]    pixelTaskSolver_2_io_rsp_rData_iteration;
  wire                when_Stream_l342_5;
  wire                pixelTaskDispatcher_io_outputs_3_m2sPipe_valid;
  wire                pixelTaskDispatcher_io_outputs_3_m2sPipe_ready;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_3_m2sPipe_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_3_m2sPipe_payload_y;
  reg                 pixelTaskDispatcher_io_outputs_3_rValid;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_3_rData_x;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_3_rData_y;
  wire                when_Stream_l342_6;
  wire                pixelTaskSolver_3_io_rsp_m2sPipe_valid;
  wire                pixelTaskSolver_3_io_rsp_m2sPipe_ready;
  wire       [5:0]    pixelTaskSolver_3_io_rsp_m2sPipe_payload_iteration;
  reg                 pixelTaskSolver_3_io_rsp_rValid;
  reg        [5:0]    pixelTaskSolver_3_io_rsp_rData_iteration;
  wire                when_Stream_l342_7;
  wire                pixelTaskDispatcher_io_outputs_4_m2sPipe_valid;
  wire                pixelTaskDispatcher_io_outputs_4_m2sPipe_ready;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_4_m2sPipe_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_4_m2sPipe_payload_y;
  reg                 pixelTaskDispatcher_io_outputs_4_rValid;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_4_rData_x;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_4_rData_y;
  wire                when_Stream_l342_8;
  wire                pixelTaskSolver_4_io_rsp_m2sPipe_valid;
  wire                pixelTaskSolver_4_io_rsp_m2sPipe_ready;
  wire       [5:0]    pixelTaskSolver_4_io_rsp_m2sPipe_payload_iteration;
  reg                 pixelTaskSolver_4_io_rsp_rValid;
  reg        [5:0]    pixelTaskSolver_4_io_rsp_rData_iteration;
  wire                when_Stream_l342_9;
  wire                pixelTaskDispatcher_io_outputs_5_m2sPipe_valid;
  wire                pixelTaskDispatcher_io_outputs_5_m2sPipe_ready;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_5_m2sPipe_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_5_m2sPipe_payload_y;
  reg                 pixelTaskDispatcher_io_outputs_5_rValid;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_5_rData_x;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_5_rData_y;
  wire                when_Stream_l342_10;
  wire                pixelTaskSolver_5_io_rsp_m2sPipe_valid;
  wire                pixelTaskSolver_5_io_rsp_m2sPipe_ready;
  wire       [5:0]    pixelTaskSolver_5_io_rsp_m2sPipe_payload_iteration;
  reg                 pixelTaskSolver_5_io_rsp_rValid;
  reg        [5:0]    pixelTaskSolver_5_io_rsp_rData_iteration;
  wire                when_Stream_l342_11;
  wire                pixelTaskDispatcher_io_outputs_6_m2sPipe_valid;
  wire                pixelTaskDispatcher_io_outputs_6_m2sPipe_ready;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_6_m2sPipe_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_6_m2sPipe_payload_y;
  reg                 pixelTaskDispatcher_io_outputs_6_rValid;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_6_rData_x;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_6_rData_y;
  wire                when_Stream_l342_12;
  wire                pixelTaskSolver_6_io_rsp_m2sPipe_valid;
  wire                pixelTaskSolver_6_io_rsp_m2sPipe_ready;
  wire       [5:0]    pixelTaskSolver_6_io_rsp_m2sPipe_payload_iteration;
  reg                 pixelTaskSolver_6_io_rsp_rValid;
  reg        [5:0]    pixelTaskSolver_6_io_rsp_rData_iteration;
  wire                when_Stream_l342_13;
  wire                pixelTaskDispatcher_io_outputs_7_m2sPipe_valid;
  wire                pixelTaskDispatcher_io_outputs_7_m2sPipe_ready;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_7_m2sPipe_payload_x;
  wire       [27:0]   pixelTaskDispatcher_io_outputs_7_m2sPipe_payload_y;
  reg                 pixelTaskDispatcher_io_outputs_7_rValid;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_7_rData_x;
  reg        [27:0]   pixelTaskDispatcher_io_outputs_7_rData_y;
  wire                when_Stream_l342_14;
  wire                pixelTaskSolver_7_io_rsp_m2sPipe_valid;
  wire                pixelTaskSolver_7_io_rsp_m2sPipe_ready;
  wire       [5:0]    pixelTaskSolver_7_io_rsp_m2sPipe_payload_iteration;
  reg                 pixelTaskSolver_7_io_rsp_rValid;
  reg        [5:0]    pixelTaskSolver_7_io_rsp_rData_iteration;
  wire                when_Stream_l342_15;

  Dispatcher pixelTaskDispatcher (
    .io_input_valid            (io_cmd_valid                                      ), //i
    .io_input_ready            (pixelTaskDispatcher_io_input_ready                ), //o
    .io_input_payload_x        (io_cmd_payload_x[27:0]                            ), //i
    .io_input_payload_y        (io_cmd_payload_y[27:0]                            ), //i
    .io_outputs_0_valid        (pixelTaskDispatcher_io_outputs_0_valid            ), //o
    .io_outputs_0_ready        (pixelTaskDispatcher_io_outputs_0_ready            ), //i
    .io_outputs_0_payload_x    (pixelTaskDispatcher_io_outputs_0_payload_x[27:0]  ), //o
    .io_outputs_0_payload_y    (pixelTaskDispatcher_io_outputs_0_payload_y[27:0]  ), //o
    .io_outputs_1_valid        (pixelTaskDispatcher_io_outputs_1_valid            ), //o
    .io_outputs_1_ready        (pixelTaskDispatcher_io_outputs_1_ready            ), //i
    .io_outputs_1_payload_x    (pixelTaskDispatcher_io_outputs_1_payload_x[27:0]  ), //o
    .io_outputs_1_payload_y    (pixelTaskDispatcher_io_outputs_1_payload_y[27:0]  ), //o
    .io_outputs_2_valid        (pixelTaskDispatcher_io_outputs_2_valid            ), //o
    .io_outputs_2_ready        (pixelTaskDispatcher_io_outputs_2_ready            ), //i
    .io_outputs_2_payload_x    (pixelTaskDispatcher_io_outputs_2_payload_x[27:0]  ), //o
    .io_outputs_2_payload_y    (pixelTaskDispatcher_io_outputs_2_payload_y[27:0]  ), //o
    .io_outputs_3_valid        (pixelTaskDispatcher_io_outputs_3_valid            ), //o
    .io_outputs_3_ready        (pixelTaskDispatcher_io_outputs_3_ready            ), //i
    .io_outputs_3_payload_x    (pixelTaskDispatcher_io_outputs_3_payload_x[27:0]  ), //o
    .io_outputs_3_payload_y    (pixelTaskDispatcher_io_outputs_3_payload_y[27:0]  ), //o
    .io_outputs_4_valid        (pixelTaskDispatcher_io_outputs_4_valid            ), //o
    .io_outputs_4_ready        (pixelTaskDispatcher_io_outputs_4_ready            ), //i
    .io_outputs_4_payload_x    (pixelTaskDispatcher_io_outputs_4_payload_x[27:0]  ), //o
    .io_outputs_4_payload_y    (pixelTaskDispatcher_io_outputs_4_payload_y[27:0]  ), //o
    .io_outputs_5_valid        (pixelTaskDispatcher_io_outputs_5_valid            ), //o
    .io_outputs_5_ready        (pixelTaskDispatcher_io_outputs_5_ready            ), //i
    .io_outputs_5_payload_x    (pixelTaskDispatcher_io_outputs_5_payload_x[27:0]  ), //o
    .io_outputs_5_payload_y    (pixelTaskDispatcher_io_outputs_5_payload_y[27:0]  ), //o
    .io_outputs_6_valid        (pixelTaskDispatcher_io_outputs_6_valid            ), //o
    .io_outputs_6_ready        (pixelTaskDispatcher_io_outputs_6_ready            ), //i
    .io_outputs_6_payload_x    (pixelTaskDispatcher_io_outputs_6_payload_x[27:0]  ), //o
    .io_outputs_6_payload_y    (pixelTaskDispatcher_io_outputs_6_payload_y[27:0]  ), //o
    .io_outputs_7_valid        (pixelTaskDispatcher_io_outputs_7_valid            ), //o
    .io_outputs_7_ready        (pixelTaskDispatcher_io_outputs_7_ready            ), //i
    .io_outputs_7_payload_x    (pixelTaskDispatcher_io_outputs_7_payload_x[27:0]  ), //o
    .io_outputs_7_payload_y    (pixelTaskDispatcher_io_outputs_7_payload_y[27:0]  ), //o
    .clk                       (clk                                               ), //i
    .reset                     (reset                                             )  //i
  );
  PixelSolver pixelTaskSolver_0 (
    .io_cmd_valid                (pixelTaskDispatcher_io_outputs_0_m2sPipe_valid            ), //i
    .io_cmd_ready                (pixelTaskSolver_0_io_cmd_ready                            ), //o
    .io_cmd_payload_x            (pixelTaskDispatcher_io_outputs_0_m2sPipe_payload_x[27:0]  ), //i
    .io_cmd_payload_y            (pixelTaskDispatcher_io_outputs_0_m2sPipe_payload_y[27:0]  ), //i
    .io_rsp_valid                (pixelTaskSolver_0_io_rsp_valid                            ), //o
    .io_rsp_ready                (pixelTaskSolver_0_io_rsp_ready                            ), //i
    .io_rsp_payload_iteration    (pixelTaskSolver_0_io_rsp_payload_iteration[5:0]           ), //o
    .clk                         (clk                                                       ), //i
    .reset                       (reset                                                     )  //i
  );
  PixelSolver pixelTaskSolver_1 (
    .io_cmd_valid                (pixelTaskDispatcher_io_outputs_1_m2sPipe_valid            ), //i
    .io_cmd_ready                (pixelTaskSolver_1_io_cmd_ready                            ), //o
    .io_cmd_payload_x            (pixelTaskDispatcher_io_outputs_1_m2sPipe_payload_x[27:0]  ), //i
    .io_cmd_payload_y            (pixelTaskDispatcher_io_outputs_1_m2sPipe_payload_y[27:0]  ), //i
    .io_rsp_valid                (pixelTaskSolver_1_io_rsp_valid                            ), //o
    .io_rsp_ready                (pixelTaskSolver_1_io_rsp_ready                            ), //i
    .io_rsp_payload_iteration    (pixelTaskSolver_1_io_rsp_payload_iteration[5:0]           ), //o
    .clk                         (clk                                                       ), //i
    .reset                       (reset                                                     )  //i
  );
  PixelSolver pixelTaskSolver_2 (
    .io_cmd_valid                (pixelTaskDispatcher_io_outputs_2_m2sPipe_valid            ), //i
    .io_cmd_ready                (pixelTaskSolver_2_io_cmd_ready                            ), //o
    .io_cmd_payload_x            (pixelTaskDispatcher_io_outputs_2_m2sPipe_payload_x[27:0]  ), //i
    .io_cmd_payload_y            (pixelTaskDispatcher_io_outputs_2_m2sPipe_payload_y[27:0]  ), //i
    .io_rsp_valid                (pixelTaskSolver_2_io_rsp_valid                            ), //o
    .io_rsp_ready                (pixelTaskSolver_2_io_rsp_ready                            ), //i
    .io_rsp_payload_iteration    (pixelTaskSolver_2_io_rsp_payload_iteration[5:0]           ), //o
    .clk                         (clk                                                       ), //i
    .reset                       (reset                                                     )  //i
  );
  PixelSolver pixelTaskSolver_3 (
    .io_cmd_valid                (pixelTaskDispatcher_io_outputs_3_m2sPipe_valid            ), //i
    .io_cmd_ready                (pixelTaskSolver_3_io_cmd_ready                            ), //o
    .io_cmd_payload_x            (pixelTaskDispatcher_io_outputs_3_m2sPipe_payload_x[27:0]  ), //i
    .io_cmd_payload_y            (pixelTaskDispatcher_io_outputs_3_m2sPipe_payload_y[27:0]  ), //i
    .io_rsp_valid                (pixelTaskSolver_3_io_rsp_valid                            ), //o
    .io_rsp_ready                (pixelTaskSolver_3_io_rsp_ready                            ), //i
    .io_rsp_payload_iteration    (pixelTaskSolver_3_io_rsp_payload_iteration[5:0]           ), //o
    .clk                         (clk                                                       ), //i
    .reset                       (reset                                                     )  //i
  );
  PixelSolver pixelTaskSolver_4 (
    .io_cmd_valid                (pixelTaskDispatcher_io_outputs_4_m2sPipe_valid            ), //i
    .io_cmd_ready                (pixelTaskSolver_4_io_cmd_ready                            ), //o
    .io_cmd_payload_x            (pixelTaskDispatcher_io_outputs_4_m2sPipe_payload_x[27:0]  ), //i
    .io_cmd_payload_y            (pixelTaskDispatcher_io_outputs_4_m2sPipe_payload_y[27:0]  ), //i
    .io_rsp_valid                (pixelTaskSolver_4_io_rsp_valid                            ), //o
    .io_rsp_ready                (pixelTaskSolver_4_io_rsp_ready                            ), //i
    .io_rsp_payload_iteration    (pixelTaskSolver_4_io_rsp_payload_iteration[5:0]           ), //o
    .clk                         (clk                                                       ), //i
    .reset                       (reset                                                     )  //i
  );
  PixelSolver pixelTaskSolver_5 (
    .io_cmd_valid                (pixelTaskDispatcher_io_outputs_5_m2sPipe_valid            ), //i
    .io_cmd_ready                (pixelTaskSolver_5_io_cmd_ready                            ), //o
    .io_cmd_payload_x            (pixelTaskDispatcher_io_outputs_5_m2sPipe_payload_x[27:0]  ), //i
    .io_cmd_payload_y            (pixelTaskDispatcher_io_outputs_5_m2sPipe_payload_y[27:0]  ), //i
    .io_rsp_valid                (pixelTaskSolver_5_io_rsp_valid                            ), //o
    .io_rsp_ready                (pixelTaskSolver_5_io_rsp_ready                            ), //i
    .io_rsp_payload_iteration    (pixelTaskSolver_5_io_rsp_payload_iteration[5:0]           ), //o
    .clk                         (clk                                                       ), //i
    .reset                       (reset                                                     )  //i
  );
  PixelSolver pixelTaskSolver_6 (
    .io_cmd_valid                (pixelTaskDispatcher_io_outputs_6_m2sPipe_valid            ), //i
    .io_cmd_ready                (pixelTaskSolver_6_io_cmd_ready                            ), //o
    .io_cmd_payload_x            (pixelTaskDispatcher_io_outputs_6_m2sPipe_payload_x[27:0]  ), //i
    .io_cmd_payload_y            (pixelTaskDispatcher_io_outputs_6_m2sPipe_payload_y[27:0]  ), //i
    .io_rsp_valid                (pixelTaskSolver_6_io_rsp_valid                            ), //o
    .io_rsp_ready                (pixelTaskSolver_6_io_rsp_ready                            ), //i
    .io_rsp_payload_iteration    (pixelTaskSolver_6_io_rsp_payload_iteration[5:0]           ), //o
    .clk                         (clk                                                       ), //i
    .reset                       (reset                                                     )  //i
  );
  PixelSolver pixelTaskSolver_7 (
    .io_cmd_valid                (pixelTaskDispatcher_io_outputs_7_m2sPipe_valid            ), //i
    .io_cmd_ready                (pixelTaskSolver_7_io_cmd_ready                            ), //o
    .io_cmd_payload_x            (pixelTaskDispatcher_io_outputs_7_m2sPipe_payload_x[27:0]  ), //i
    .io_cmd_payload_y            (pixelTaskDispatcher_io_outputs_7_m2sPipe_payload_y[27:0]  ), //i
    .io_rsp_valid                (pixelTaskSolver_7_io_rsp_valid                            ), //o
    .io_rsp_ready                (pixelTaskSolver_7_io_rsp_ready                            ), //i
    .io_rsp_payload_iteration    (pixelTaskSolver_7_io_rsp_payload_iteration[5:0]           ), //o
    .clk                         (clk                                                       ), //i
    .reset                       (reset                                                     )  //i
  );
  Arbiter pixelResultArbiter (
    .io_inputs_0_valid                (pixelTaskSolver_0_io_rsp_m2sPipe_valid                   ), //i
    .io_inputs_0_ready                (pixelResultArbiter_io_inputs_0_ready                     ), //o
    .io_inputs_0_payload_iteration    (pixelTaskSolver_0_io_rsp_m2sPipe_payload_iteration[5:0]  ), //i
    .io_inputs_1_valid                (pixelTaskSolver_1_io_rsp_m2sPipe_valid                   ), //i
    .io_inputs_1_ready                (pixelResultArbiter_io_inputs_1_ready                     ), //o
    .io_inputs_1_payload_iteration    (pixelTaskSolver_1_io_rsp_m2sPipe_payload_iteration[5:0]  ), //i
    .io_inputs_2_valid                (pixelTaskSolver_2_io_rsp_m2sPipe_valid                   ), //i
    .io_inputs_2_ready                (pixelResultArbiter_io_inputs_2_ready                     ), //o
    .io_inputs_2_payload_iteration    (pixelTaskSolver_2_io_rsp_m2sPipe_payload_iteration[5:0]  ), //i
    .io_inputs_3_valid                (pixelTaskSolver_3_io_rsp_m2sPipe_valid                   ), //i
    .io_inputs_3_ready                (pixelResultArbiter_io_inputs_3_ready                     ), //o
    .io_inputs_3_payload_iteration    (pixelTaskSolver_3_io_rsp_m2sPipe_payload_iteration[5:0]  ), //i
    .io_inputs_4_valid                (pixelTaskSolver_4_io_rsp_m2sPipe_valid                   ), //i
    .io_inputs_4_ready                (pixelResultArbiter_io_inputs_4_ready                     ), //o
    .io_inputs_4_payload_iteration    (pixelTaskSolver_4_io_rsp_m2sPipe_payload_iteration[5:0]  ), //i
    .io_inputs_5_valid                (pixelTaskSolver_5_io_rsp_m2sPipe_valid                   ), //i
    .io_inputs_5_ready                (pixelResultArbiter_io_inputs_5_ready                     ), //o
    .io_inputs_5_payload_iteration    (pixelTaskSolver_5_io_rsp_m2sPipe_payload_iteration[5:0]  ), //i
    .io_inputs_6_valid                (pixelTaskSolver_6_io_rsp_m2sPipe_valid                   ), //i
    .io_inputs_6_ready                (pixelResultArbiter_io_inputs_6_ready                     ), //o
    .io_inputs_6_payload_iteration    (pixelTaskSolver_6_io_rsp_m2sPipe_payload_iteration[5:0]  ), //i
    .io_inputs_7_valid                (pixelTaskSolver_7_io_rsp_m2sPipe_valid                   ), //i
    .io_inputs_7_ready                (pixelResultArbiter_io_inputs_7_ready                     ), //o
    .io_inputs_7_payload_iteration    (pixelTaskSolver_7_io_rsp_m2sPipe_payload_iteration[5:0]  ), //i
    .io_output_valid                  (pixelResultArbiter_io_output_valid                       ), //o
    .io_output_ready                  (io_rsp_ready                                             ), //i
    .io_output_payload_iteration      (pixelResultArbiter_io_output_payload_iteration[5:0]      ), //o
    .clk                              (clk                                                      ), //i
    .reset                            (reset                                                    )  //i
  );
  assign io_cmd_ready = pixelTaskDispatcher_io_input_ready;
  always @(*) begin
    pixelTaskDispatcher_io_outputs_0_ready = pixelTaskDispatcher_io_outputs_0_m2sPipe_ready;
    if(when_Stream_l342) begin
      pixelTaskDispatcher_io_outputs_0_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! pixelTaskDispatcher_io_outputs_0_m2sPipe_valid);
  assign pixelTaskDispatcher_io_outputs_0_m2sPipe_valid = pixelTaskDispatcher_io_outputs_0_rValid;
  assign pixelTaskDispatcher_io_outputs_0_m2sPipe_payload_x = pixelTaskDispatcher_io_outputs_0_rData_x;
  assign pixelTaskDispatcher_io_outputs_0_m2sPipe_payload_y = pixelTaskDispatcher_io_outputs_0_rData_y;
  assign pixelTaskDispatcher_io_outputs_0_m2sPipe_ready = pixelTaskSolver_0_io_cmd_ready;
  always @(*) begin
    pixelTaskSolver_0_io_rsp_ready = pixelTaskSolver_0_io_rsp_m2sPipe_ready;
    if(when_Stream_l342_1) begin
      pixelTaskSolver_0_io_rsp_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! pixelTaskSolver_0_io_rsp_m2sPipe_valid);
  assign pixelTaskSolver_0_io_rsp_m2sPipe_valid = pixelTaskSolver_0_io_rsp_rValid;
  assign pixelTaskSolver_0_io_rsp_m2sPipe_payload_iteration = pixelTaskSolver_0_io_rsp_rData_iteration;
  assign pixelTaskSolver_0_io_rsp_m2sPipe_ready = pixelResultArbiter_io_inputs_0_ready;
  always @(*) begin
    pixelTaskDispatcher_io_outputs_1_ready = pixelTaskDispatcher_io_outputs_1_m2sPipe_ready;
    if(when_Stream_l342_2) begin
      pixelTaskDispatcher_io_outputs_1_ready = 1'b1;
    end
  end

  assign when_Stream_l342_2 = (! pixelTaskDispatcher_io_outputs_1_m2sPipe_valid);
  assign pixelTaskDispatcher_io_outputs_1_m2sPipe_valid = pixelTaskDispatcher_io_outputs_1_rValid;
  assign pixelTaskDispatcher_io_outputs_1_m2sPipe_payload_x = pixelTaskDispatcher_io_outputs_1_rData_x;
  assign pixelTaskDispatcher_io_outputs_1_m2sPipe_payload_y = pixelTaskDispatcher_io_outputs_1_rData_y;
  assign pixelTaskDispatcher_io_outputs_1_m2sPipe_ready = pixelTaskSolver_1_io_cmd_ready;
  always @(*) begin
    pixelTaskSolver_1_io_rsp_ready = pixelTaskSolver_1_io_rsp_m2sPipe_ready;
    if(when_Stream_l342_3) begin
      pixelTaskSolver_1_io_rsp_ready = 1'b1;
    end
  end

  assign when_Stream_l342_3 = (! pixelTaskSolver_1_io_rsp_m2sPipe_valid);
  assign pixelTaskSolver_1_io_rsp_m2sPipe_valid = pixelTaskSolver_1_io_rsp_rValid;
  assign pixelTaskSolver_1_io_rsp_m2sPipe_payload_iteration = pixelTaskSolver_1_io_rsp_rData_iteration;
  assign pixelTaskSolver_1_io_rsp_m2sPipe_ready = pixelResultArbiter_io_inputs_1_ready;
  always @(*) begin
    pixelTaskDispatcher_io_outputs_2_ready = pixelTaskDispatcher_io_outputs_2_m2sPipe_ready;
    if(when_Stream_l342_4) begin
      pixelTaskDispatcher_io_outputs_2_ready = 1'b1;
    end
  end

  assign when_Stream_l342_4 = (! pixelTaskDispatcher_io_outputs_2_m2sPipe_valid);
  assign pixelTaskDispatcher_io_outputs_2_m2sPipe_valid = pixelTaskDispatcher_io_outputs_2_rValid;
  assign pixelTaskDispatcher_io_outputs_2_m2sPipe_payload_x = pixelTaskDispatcher_io_outputs_2_rData_x;
  assign pixelTaskDispatcher_io_outputs_2_m2sPipe_payload_y = pixelTaskDispatcher_io_outputs_2_rData_y;
  assign pixelTaskDispatcher_io_outputs_2_m2sPipe_ready = pixelTaskSolver_2_io_cmd_ready;
  always @(*) begin
    pixelTaskSolver_2_io_rsp_ready = pixelTaskSolver_2_io_rsp_m2sPipe_ready;
    if(when_Stream_l342_5) begin
      pixelTaskSolver_2_io_rsp_ready = 1'b1;
    end
  end

  assign when_Stream_l342_5 = (! pixelTaskSolver_2_io_rsp_m2sPipe_valid);
  assign pixelTaskSolver_2_io_rsp_m2sPipe_valid = pixelTaskSolver_2_io_rsp_rValid;
  assign pixelTaskSolver_2_io_rsp_m2sPipe_payload_iteration = pixelTaskSolver_2_io_rsp_rData_iteration;
  assign pixelTaskSolver_2_io_rsp_m2sPipe_ready = pixelResultArbiter_io_inputs_2_ready;
  always @(*) begin
    pixelTaskDispatcher_io_outputs_3_ready = pixelTaskDispatcher_io_outputs_3_m2sPipe_ready;
    if(when_Stream_l342_6) begin
      pixelTaskDispatcher_io_outputs_3_ready = 1'b1;
    end
  end

  assign when_Stream_l342_6 = (! pixelTaskDispatcher_io_outputs_3_m2sPipe_valid);
  assign pixelTaskDispatcher_io_outputs_3_m2sPipe_valid = pixelTaskDispatcher_io_outputs_3_rValid;
  assign pixelTaskDispatcher_io_outputs_3_m2sPipe_payload_x = pixelTaskDispatcher_io_outputs_3_rData_x;
  assign pixelTaskDispatcher_io_outputs_3_m2sPipe_payload_y = pixelTaskDispatcher_io_outputs_3_rData_y;
  assign pixelTaskDispatcher_io_outputs_3_m2sPipe_ready = pixelTaskSolver_3_io_cmd_ready;
  always @(*) begin
    pixelTaskSolver_3_io_rsp_ready = pixelTaskSolver_3_io_rsp_m2sPipe_ready;
    if(when_Stream_l342_7) begin
      pixelTaskSolver_3_io_rsp_ready = 1'b1;
    end
  end

  assign when_Stream_l342_7 = (! pixelTaskSolver_3_io_rsp_m2sPipe_valid);
  assign pixelTaskSolver_3_io_rsp_m2sPipe_valid = pixelTaskSolver_3_io_rsp_rValid;
  assign pixelTaskSolver_3_io_rsp_m2sPipe_payload_iteration = pixelTaskSolver_3_io_rsp_rData_iteration;
  assign pixelTaskSolver_3_io_rsp_m2sPipe_ready = pixelResultArbiter_io_inputs_3_ready;
  always @(*) begin
    pixelTaskDispatcher_io_outputs_4_ready = pixelTaskDispatcher_io_outputs_4_m2sPipe_ready;
    if(when_Stream_l342_8) begin
      pixelTaskDispatcher_io_outputs_4_ready = 1'b1;
    end
  end

  assign when_Stream_l342_8 = (! pixelTaskDispatcher_io_outputs_4_m2sPipe_valid);
  assign pixelTaskDispatcher_io_outputs_4_m2sPipe_valid = pixelTaskDispatcher_io_outputs_4_rValid;
  assign pixelTaskDispatcher_io_outputs_4_m2sPipe_payload_x = pixelTaskDispatcher_io_outputs_4_rData_x;
  assign pixelTaskDispatcher_io_outputs_4_m2sPipe_payload_y = pixelTaskDispatcher_io_outputs_4_rData_y;
  assign pixelTaskDispatcher_io_outputs_4_m2sPipe_ready = pixelTaskSolver_4_io_cmd_ready;
  always @(*) begin
    pixelTaskSolver_4_io_rsp_ready = pixelTaskSolver_4_io_rsp_m2sPipe_ready;
    if(when_Stream_l342_9) begin
      pixelTaskSolver_4_io_rsp_ready = 1'b1;
    end
  end

  assign when_Stream_l342_9 = (! pixelTaskSolver_4_io_rsp_m2sPipe_valid);
  assign pixelTaskSolver_4_io_rsp_m2sPipe_valid = pixelTaskSolver_4_io_rsp_rValid;
  assign pixelTaskSolver_4_io_rsp_m2sPipe_payload_iteration = pixelTaskSolver_4_io_rsp_rData_iteration;
  assign pixelTaskSolver_4_io_rsp_m2sPipe_ready = pixelResultArbiter_io_inputs_4_ready;
  always @(*) begin
    pixelTaskDispatcher_io_outputs_5_ready = pixelTaskDispatcher_io_outputs_5_m2sPipe_ready;
    if(when_Stream_l342_10) begin
      pixelTaskDispatcher_io_outputs_5_ready = 1'b1;
    end
  end

  assign when_Stream_l342_10 = (! pixelTaskDispatcher_io_outputs_5_m2sPipe_valid);
  assign pixelTaskDispatcher_io_outputs_5_m2sPipe_valid = pixelTaskDispatcher_io_outputs_5_rValid;
  assign pixelTaskDispatcher_io_outputs_5_m2sPipe_payload_x = pixelTaskDispatcher_io_outputs_5_rData_x;
  assign pixelTaskDispatcher_io_outputs_5_m2sPipe_payload_y = pixelTaskDispatcher_io_outputs_5_rData_y;
  assign pixelTaskDispatcher_io_outputs_5_m2sPipe_ready = pixelTaskSolver_5_io_cmd_ready;
  always @(*) begin
    pixelTaskSolver_5_io_rsp_ready = pixelTaskSolver_5_io_rsp_m2sPipe_ready;
    if(when_Stream_l342_11) begin
      pixelTaskSolver_5_io_rsp_ready = 1'b1;
    end
  end

  assign when_Stream_l342_11 = (! pixelTaskSolver_5_io_rsp_m2sPipe_valid);
  assign pixelTaskSolver_5_io_rsp_m2sPipe_valid = pixelTaskSolver_5_io_rsp_rValid;
  assign pixelTaskSolver_5_io_rsp_m2sPipe_payload_iteration = pixelTaskSolver_5_io_rsp_rData_iteration;
  assign pixelTaskSolver_5_io_rsp_m2sPipe_ready = pixelResultArbiter_io_inputs_5_ready;
  always @(*) begin
    pixelTaskDispatcher_io_outputs_6_ready = pixelTaskDispatcher_io_outputs_6_m2sPipe_ready;
    if(when_Stream_l342_12) begin
      pixelTaskDispatcher_io_outputs_6_ready = 1'b1;
    end
  end

  assign when_Stream_l342_12 = (! pixelTaskDispatcher_io_outputs_6_m2sPipe_valid);
  assign pixelTaskDispatcher_io_outputs_6_m2sPipe_valid = pixelTaskDispatcher_io_outputs_6_rValid;
  assign pixelTaskDispatcher_io_outputs_6_m2sPipe_payload_x = pixelTaskDispatcher_io_outputs_6_rData_x;
  assign pixelTaskDispatcher_io_outputs_6_m2sPipe_payload_y = pixelTaskDispatcher_io_outputs_6_rData_y;
  assign pixelTaskDispatcher_io_outputs_6_m2sPipe_ready = pixelTaskSolver_6_io_cmd_ready;
  always @(*) begin
    pixelTaskSolver_6_io_rsp_ready = pixelTaskSolver_6_io_rsp_m2sPipe_ready;
    if(when_Stream_l342_13) begin
      pixelTaskSolver_6_io_rsp_ready = 1'b1;
    end
  end

  assign when_Stream_l342_13 = (! pixelTaskSolver_6_io_rsp_m2sPipe_valid);
  assign pixelTaskSolver_6_io_rsp_m2sPipe_valid = pixelTaskSolver_6_io_rsp_rValid;
  assign pixelTaskSolver_6_io_rsp_m2sPipe_payload_iteration = pixelTaskSolver_6_io_rsp_rData_iteration;
  assign pixelTaskSolver_6_io_rsp_m2sPipe_ready = pixelResultArbiter_io_inputs_6_ready;
  always @(*) begin
    pixelTaskDispatcher_io_outputs_7_ready = pixelTaskDispatcher_io_outputs_7_m2sPipe_ready;
    if(when_Stream_l342_14) begin
      pixelTaskDispatcher_io_outputs_7_ready = 1'b1;
    end
  end

  assign when_Stream_l342_14 = (! pixelTaskDispatcher_io_outputs_7_m2sPipe_valid);
  assign pixelTaskDispatcher_io_outputs_7_m2sPipe_valid = pixelTaskDispatcher_io_outputs_7_rValid;
  assign pixelTaskDispatcher_io_outputs_7_m2sPipe_payload_x = pixelTaskDispatcher_io_outputs_7_rData_x;
  assign pixelTaskDispatcher_io_outputs_7_m2sPipe_payload_y = pixelTaskDispatcher_io_outputs_7_rData_y;
  assign pixelTaskDispatcher_io_outputs_7_m2sPipe_ready = pixelTaskSolver_7_io_cmd_ready;
  always @(*) begin
    pixelTaskSolver_7_io_rsp_ready = pixelTaskSolver_7_io_rsp_m2sPipe_ready;
    if(when_Stream_l342_15) begin
      pixelTaskSolver_7_io_rsp_ready = 1'b1;
    end
  end

  assign when_Stream_l342_15 = (! pixelTaskSolver_7_io_rsp_m2sPipe_valid);
  assign pixelTaskSolver_7_io_rsp_m2sPipe_valid = pixelTaskSolver_7_io_rsp_rValid;
  assign pixelTaskSolver_7_io_rsp_m2sPipe_payload_iteration = pixelTaskSolver_7_io_rsp_rData_iteration;
  assign pixelTaskSolver_7_io_rsp_m2sPipe_ready = pixelResultArbiter_io_inputs_7_ready;
  assign io_rsp_valid = pixelResultArbiter_io_output_valid;
  assign io_rsp_payload_iteration = pixelResultArbiter_io_output_payload_iteration;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pixelTaskDispatcher_io_outputs_0_rValid <= 1'b0;
      pixelTaskSolver_0_io_rsp_rValid <= 1'b0;
      pixelTaskDispatcher_io_outputs_1_rValid <= 1'b0;
      pixelTaskSolver_1_io_rsp_rValid <= 1'b0;
      pixelTaskDispatcher_io_outputs_2_rValid <= 1'b0;
      pixelTaskSolver_2_io_rsp_rValid <= 1'b0;
      pixelTaskDispatcher_io_outputs_3_rValid <= 1'b0;
      pixelTaskSolver_3_io_rsp_rValid <= 1'b0;
      pixelTaskDispatcher_io_outputs_4_rValid <= 1'b0;
      pixelTaskSolver_4_io_rsp_rValid <= 1'b0;
      pixelTaskDispatcher_io_outputs_5_rValid <= 1'b0;
      pixelTaskSolver_5_io_rsp_rValid <= 1'b0;
      pixelTaskDispatcher_io_outputs_6_rValid <= 1'b0;
      pixelTaskSolver_6_io_rsp_rValid <= 1'b0;
      pixelTaskDispatcher_io_outputs_7_rValid <= 1'b0;
      pixelTaskSolver_7_io_rsp_rValid <= 1'b0;
    end else begin
      if(pixelTaskDispatcher_io_outputs_0_ready) begin
        pixelTaskDispatcher_io_outputs_0_rValid <= pixelTaskDispatcher_io_outputs_0_valid;
      end
      if(pixelTaskSolver_0_io_rsp_ready) begin
        pixelTaskSolver_0_io_rsp_rValid <= pixelTaskSolver_0_io_rsp_valid;
      end
      if(pixelTaskDispatcher_io_outputs_1_ready) begin
        pixelTaskDispatcher_io_outputs_1_rValid <= pixelTaskDispatcher_io_outputs_1_valid;
      end
      if(pixelTaskSolver_1_io_rsp_ready) begin
        pixelTaskSolver_1_io_rsp_rValid <= pixelTaskSolver_1_io_rsp_valid;
      end
      if(pixelTaskDispatcher_io_outputs_2_ready) begin
        pixelTaskDispatcher_io_outputs_2_rValid <= pixelTaskDispatcher_io_outputs_2_valid;
      end
      if(pixelTaskSolver_2_io_rsp_ready) begin
        pixelTaskSolver_2_io_rsp_rValid <= pixelTaskSolver_2_io_rsp_valid;
      end
      if(pixelTaskDispatcher_io_outputs_3_ready) begin
        pixelTaskDispatcher_io_outputs_3_rValid <= pixelTaskDispatcher_io_outputs_3_valid;
      end
      if(pixelTaskSolver_3_io_rsp_ready) begin
        pixelTaskSolver_3_io_rsp_rValid <= pixelTaskSolver_3_io_rsp_valid;
      end
      if(pixelTaskDispatcher_io_outputs_4_ready) begin
        pixelTaskDispatcher_io_outputs_4_rValid <= pixelTaskDispatcher_io_outputs_4_valid;
      end
      if(pixelTaskSolver_4_io_rsp_ready) begin
        pixelTaskSolver_4_io_rsp_rValid <= pixelTaskSolver_4_io_rsp_valid;
      end
      if(pixelTaskDispatcher_io_outputs_5_ready) begin
        pixelTaskDispatcher_io_outputs_5_rValid <= pixelTaskDispatcher_io_outputs_5_valid;
      end
      if(pixelTaskSolver_5_io_rsp_ready) begin
        pixelTaskSolver_5_io_rsp_rValid <= pixelTaskSolver_5_io_rsp_valid;
      end
      if(pixelTaskDispatcher_io_outputs_6_ready) begin
        pixelTaskDispatcher_io_outputs_6_rValid <= pixelTaskDispatcher_io_outputs_6_valid;
      end
      if(pixelTaskSolver_6_io_rsp_ready) begin
        pixelTaskSolver_6_io_rsp_rValid <= pixelTaskSolver_6_io_rsp_valid;
      end
      if(pixelTaskDispatcher_io_outputs_7_ready) begin
        pixelTaskDispatcher_io_outputs_7_rValid <= pixelTaskDispatcher_io_outputs_7_valid;
      end
      if(pixelTaskSolver_7_io_rsp_ready) begin
        pixelTaskSolver_7_io_rsp_rValid <= pixelTaskSolver_7_io_rsp_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(pixelTaskDispatcher_io_outputs_0_ready) begin
      pixelTaskDispatcher_io_outputs_0_rData_x <= pixelTaskDispatcher_io_outputs_0_payload_x;
      pixelTaskDispatcher_io_outputs_0_rData_y <= pixelTaskDispatcher_io_outputs_0_payload_y;
    end
    if(pixelTaskSolver_0_io_rsp_ready) begin
      pixelTaskSolver_0_io_rsp_rData_iteration <= pixelTaskSolver_0_io_rsp_payload_iteration;
    end
    if(pixelTaskDispatcher_io_outputs_1_ready) begin
      pixelTaskDispatcher_io_outputs_1_rData_x <= pixelTaskDispatcher_io_outputs_1_payload_x;
      pixelTaskDispatcher_io_outputs_1_rData_y <= pixelTaskDispatcher_io_outputs_1_payload_y;
    end
    if(pixelTaskSolver_1_io_rsp_ready) begin
      pixelTaskSolver_1_io_rsp_rData_iteration <= pixelTaskSolver_1_io_rsp_payload_iteration;
    end
    if(pixelTaskDispatcher_io_outputs_2_ready) begin
      pixelTaskDispatcher_io_outputs_2_rData_x <= pixelTaskDispatcher_io_outputs_2_payload_x;
      pixelTaskDispatcher_io_outputs_2_rData_y <= pixelTaskDispatcher_io_outputs_2_payload_y;
    end
    if(pixelTaskSolver_2_io_rsp_ready) begin
      pixelTaskSolver_2_io_rsp_rData_iteration <= pixelTaskSolver_2_io_rsp_payload_iteration;
    end
    if(pixelTaskDispatcher_io_outputs_3_ready) begin
      pixelTaskDispatcher_io_outputs_3_rData_x <= pixelTaskDispatcher_io_outputs_3_payload_x;
      pixelTaskDispatcher_io_outputs_3_rData_y <= pixelTaskDispatcher_io_outputs_3_payload_y;
    end
    if(pixelTaskSolver_3_io_rsp_ready) begin
      pixelTaskSolver_3_io_rsp_rData_iteration <= pixelTaskSolver_3_io_rsp_payload_iteration;
    end
    if(pixelTaskDispatcher_io_outputs_4_ready) begin
      pixelTaskDispatcher_io_outputs_4_rData_x <= pixelTaskDispatcher_io_outputs_4_payload_x;
      pixelTaskDispatcher_io_outputs_4_rData_y <= pixelTaskDispatcher_io_outputs_4_payload_y;
    end
    if(pixelTaskSolver_4_io_rsp_ready) begin
      pixelTaskSolver_4_io_rsp_rData_iteration <= pixelTaskSolver_4_io_rsp_payload_iteration;
    end
    if(pixelTaskDispatcher_io_outputs_5_ready) begin
      pixelTaskDispatcher_io_outputs_5_rData_x <= pixelTaskDispatcher_io_outputs_5_payload_x;
      pixelTaskDispatcher_io_outputs_5_rData_y <= pixelTaskDispatcher_io_outputs_5_payload_y;
    end
    if(pixelTaskSolver_5_io_rsp_ready) begin
      pixelTaskSolver_5_io_rsp_rData_iteration <= pixelTaskSolver_5_io_rsp_payload_iteration;
    end
    if(pixelTaskDispatcher_io_outputs_6_ready) begin
      pixelTaskDispatcher_io_outputs_6_rData_x <= pixelTaskDispatcher_io_outputs_6_payload_x;
      pixelTaskDispatcher_io_outputs_6_rData_y <= pixelTaskDispatcher_io_outputs_6_payload_y;
    end
    if(pixelTaskSolver_6_io_rsp_ready) begin
      pixelTaskSolver_6_io_rsp_rData_iteration <= pixelTaskSolver_6_io_rsp_payload_iteration;
    end
    if(pixelTaskDispatcher_io_outputs_7_ready) begin
      pixelTaskDispatcher_io_outputs_7_rData_x <= pixelTaskDispatcher_io_outputs_7_payload_x;
      pixelTaskDispatcher_io_outputs_7_rData_y <= pixelTaskDispatcher_io_outputs_7_payload_y;
    end
    if(pixelTaskSolver_7_io_rsp_ready) begin
      pixelTaskSolver_7_io_rsp_rData_iteration <= pixelTaskSolver_7_io_rsp_payload_iteration;
    end
  end


endmodule

module Arbiter (
  input               io_inputs_0_valid,
  output reg          io_inputs_0_ready,
  input      [5:0]    io_inputs_0_payload_iteration,
  input               io_inputs_1_valid,
  output reg          io_inputs_1_ready,
  input      [5:0]    io_inputs_1_payload_iteration,
  input               io_inputs_2_valid,
  output reg          io_inputs_2_ready,
  input      [5:0]    io_inputs_2_payload_iteration,
  input               io_inputs_3_valid,
  output reg          io_inputs_3_ready,
  input      [5:0]    io_inputs_3_payload_iteration,
  input               io_inputs_4_valid,
  output reg          io_inputs_4_ready,
  input      [5:0]    io_inputs_4_payload_iteration,
  input               io_inputs_5_valid,
  output reg          io_inputs_5_ready,
  input      [5:0]    io_inputs_5_payload_iteration,
  input               io_inputs_6_valid,
  output reg          io_inputs_6_ready,
  input      [5:0]    io_inputs_6_payload_iteration,
  input               io_inputs_7_valid,
  output reg          io_inputs_7_ready,
  input      [5:0]    io_inputs_7_payload_iteration,
  output              io_output_valid,
  input               io_output_ready,
  output     [5:0]    io_output_payload_iteration,
  input               clk,
  input               reset
);

  wire       [2:0]    _zz_counter_valueNext;
  wire       [0:0]    _zz_counter_valueNext_1;
  reg                 _zz_io_output_valid;
  reg        [5:0]    _zz_io_output_payload_iteration;
  reg                 counter_willIncrement;
  wire                counter_willClear;
  reg        [2:0]    counter_valueNext;
  reg        [2:0]    counter_value;
  wire                counter_willOverflowIfInc;
  wire                counter_willOverflow;
  wire       [7:0]    _zz_1;
  wire                io_output_fire;

  assign _zz_counter_valueNext_1 = counter_willIncrement;
  assign _zz_counter_valueNext = {2'd0, _zz_counter_valueNext_1};
  always @(*) begin
    case(counter_value)
      3'b000 : begin
        _zz_io_output_valid = io_inputs_0_valid;
        _zz_io_output_payload_iteration = io_inputs_0_payload_iteration;
      end
      3'b001 : begin
        _zz_io_output_valid = io_inputs_1_valid;
        _zz_io_output_payload_iteration = io_inputs_1_payload_iteration;
      end
      3'b010 : begin
        _zz_io_output_valid = io_inputs_2_valid;
        _zz_io_output_payload_iteration = io_inputs_2_payload_iteration;
      end
      3'b011 : begin
        _zz_io_output_valid = io_inputs_3_valid;
        _zz_io_output_payload_iteration = io_inputs_3_payload_iteration;
      end
      3'b100 : begin
        _zz_io_output_valid = io_inputs_4_valid;
        _zz_io_output_payload_iteration = io_inputs_4_payload_iteration;
      end
      3'b101 : begin
        _zz_io_output_valid = io_inputs_5_valid;
        _zz_io_output_payload_iteration = io_inputs_5_payload_iteration;
      end
      3'b110 : begin
        _zz_io_output_valid = io_inputs_6_valid;
        _zz_io_output_payload_iteration = io_inputs_6_payload_iteration;
      end
      default : begin
        _zz_io_output_valid = io_inputs_7_valid;
        _zz_io_output_payload_iteration = io_inputs_7_payload_iteration;
      end
    endcase
  end

  always @(*) begin
    counter_willIncrement = 1'b0;
    if(io_output_fire) begin
      counter_willIncrement = 1'b1;
    end
  end

  assign counter_willClear = 1'b0;
  assign counter_willOverflowIfInc = (counter_value == 3'b111);
  assign counter_willOverflow = (counter_willOverflowIfInc && counter_willIncrement);
  always @(*) begin
    counter_valueNext = (counter_value + _zz_counter_valueNext);
    if(counter_willClear) begin
      counter_valueNext = 3'b000;
    end
  end

  always @(*) begin
    io_inputs_0_ready = 1'b0;
    if(_zz_1[0]) begin
      io_inputs_0_ready = io_output_ready;
    end
  end

  always @(*) begin
    io_inputs_1_ready = 1'b0;
    if(_zz_1[1]) begin
      io_inputs_1_ready = io_output_ready;
    end
  end

  always @(*) begin
    io_inputs_2_ready = 1'b0;
    if(_zz_1[2]) begin
      io_inputs_2_ready = io_output_ready;
    end
  end

  always @(*) begin
    io_inputs_3_ready = 1'b0;
    if(_zz_1[3]) begin
      io_inputs_3_ready = io_output_ready;
    end
  end

  always @(*) begin
    io_inputs_4_ready = 1'b0;
    if(_zz_1[4]) begin
      io_inputs_4_ready = io_output_ready;
    end
  end

  always @(*) begin
    io_inputs_5_ready = 1'b0;
    if(_zz_1[5]) begin
      io_inputs_5_ready = io_output_ready;
    end
  end

  always @(*) begin
    io_inputs_6_ready = 1'b0;
    if(_zz_1[6]) begin
      io_inputs_6_ready = io_output_ready;
    end
  end

  always @(*) begin
    io_inputs_7_ready = 1'b0;
    if(_zz_1[7]) begin
      io_inputs_7_ready = io_output_ready;
    end
  end

  assign _zz_1 = ({7'd0,1'b1} <<< counter_value);
  assign io_output_valid = _zz_io_output_valid;
  assign io_output_payload_iteration = _zz_io_output_payload_iteration;
  assign io_output_fire = (io_output_valid && io_output_ready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      counter_value <= 3'b000;
    end else begin
      counter_value <= counter_valueNext;
    end
  end


endmodule

//PixelSolver replaced by PixelSolver

//PixelSolver replaced by PixelSolver

//PixelSolver replaced by PixelSolver

//PixelSolver replaced by PixelSolver

//PixelSolver replaced by PixelSolver

//PixelSolver replaced by PixelSolver

//PixelSolver replaced by PixelSolver

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


endmodule

module Dispatcher (
  input               io_input_valid,
  output              io_input_ready,
  input      [27:0]   io_input_payload_x,
  input      [27:0]   io_input_payload_y,
  output reg          io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [27:0]   io_outputs_0_payload_x,
  output     [27:0]   io_outputs_0_payload_y,
  output reg          io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [27:0]   io_outputs_1_payload_x,
  output     [27:0]   io_outputs_1_payload_y,
  output reg          io_outputs_2_valid,
  input               io_outputs_2_ready,
  output     [27:0]   io_outputs_2_payload_x,
  output     [27:0]   io_outputs_2_payload_y,
  output reg          io_outputs_3_valid,
  input               io_outputs_3_ready,
  output     [27:0]   io_outputs_3_payload_x,
  output     [27:0]   io_outputs_3_payload_y,
  output reg          io_outputs_4_valid,
  input               io_outputs_4_ready,
  output     [27:0]   io_outputs_4_payload_x,
  output     [27:0]   io_outputs_4_payload_y,
  output reg          io_outputs_5_valid,
  input               io_outputs_5_ready,
  output     [27:0]   io_outputs_5_payload_x,
  output     [27:0]   io_outputs_5_payload_y,
  output reg          io_outputs_6_valid,
  input               io_outputs_6_ready,
  output     [27:0]   io_outputs_6_payload_x,
  output     [27:0]   io_outputs_6_payload_y,
  output reg          io_outputs_7_valid,
  input               io_outputs_7_ready,
  output     [27:0]   io_outputs_7_payload_x,
  output     [27:0]   io_outputs_7_payload_y,
  input               clk,
  input               reset
);

  wire       [2:0]    _zz_counter_valueNext;
  wire       [0:0]    _zz_counter_valueNext_1;
  reg                 _zz_io_input_ready;
  reg                 counter_willIncrement;
  wire                counter_willClear;
  reg        [2:0]    counter_valueNext;
  reg        [2:0]    counter_value;
  wire                counter_willOverflowIfInc;
  wire                counter_willOverflow;
  wire       [7:0]    _zz_1;
  wire                io_input_fire;

  assign _zz_counter_valueNext_1 = counter_willIncrement;
  assign _zz_counter_valueNext = {2'd0, _zz_counter_valueNext_1};
  always @(*) begin
    case(counter_value)
      3'b000 : _zz_io_input_ready = io_outputs_0_ready;
      3'b001 : _zz_io_input_ready = io_outputs_1_ready;
      3'b010 : _zz_io_input_ready = io_outputs_2_ready;
      3'b011 : _zz_io_input_ready = io_outputs_3_ready;
      3'b100 : _zz_io_input_ready = io_outputs_4_ready;
      3'b101 : _zz_io_input_ready = io_outputs_5_ready;
      3'b110 : _zz_io_input_ready = io_outputs_6_ready;
      default : _zz_io_input_ready = io_outputs_7_ready;
    endcase
  end

  always @(*) begin
    counter_willIncrement = 1'b0;
    if(io_input_fire) begin
      counter_willIncrement = 1'b1;
    end
  end

  assign counter_willClear = 1'b0;
  assign counter_willOverflowIfInc = (counter_value == 3'b111);
  assign counter_willOverflow = (counter_willOverflowIfInc && counter_willIncrement);
  always @(*) begin
    counter_valueNext = (counter_value + _zz_counter_valueNext);
    if(counter_willClear) begin
      counter_valueNext = 3'b000;
    end
  end

  always @(*) begin
    io_outputs_0_valid = 1'b0;
    if(_zz_1[0]) begin
      io_outputs_0_valid = io_input_valid;
    end
  end

  assign io_outputs_0_payload_x = io_input_payload_x;
  assign io_outputs_0_payload_y = io_input_payload_y;
  always @(*) begin
    io_outputs_1_valid = 1'b0;
    if(_zz_1[1]) begin
      io_outputs_1_valid = io_input_valid;
    end
  end

  assign io_outputs_1_payload_x = io_input_payload_x;
  assign io_outputs_1_payload_y = io_input_payload_y;
  always @(*) begin
    io_outputs_2_valid = 1'b0;
    if(_zz_1[2]) begin
      io_outputs_2_valid = io_input_valid;
    end
  end

  assign io_outputs_2_payload_x = io_input_payload_x;
  assign io_outputs_2_payload_y = io_input_payload_y;
  always @(*) begin
    io_outputs_3_valid = 1'b0;
    if(_zz_1[3]) begin
      io_outputs_3_valid = io_input_valid;
    end
  end

  assign io_outputs_3_payload_x = io_input_payload_x;
  assign io_outputs_3_payload_y = io_input_payload_y;
  always @(*) begin
    io_outputs_4_valid = 1'b0;
    if(_zz_1[4]) begin
      io_outputs_4_valid = io_input_valid;
    end
  end

  assign io_outputs_4_payload_x = io_input_payload_x;
  assign io_outputs_4_payload_y = io_input_payload_y;
  always @(*) begin
    io_outputs_5_valid = 1'b0;
    if(_zz_1[5]) begin
      io_outputs_5_valid = io_input_valid;
    end
  end

  assign io_outputs_5_payload_x = io_input_payload_x;
  assign io_outputs_5_payload_y = io_input_payload_y;
  always @(*) begin
    io_outputs_6_valid = 1'b0;
    if(_zz_1[6]) begin
      io_outputs_6_valid = io_input_valid;
    end
  end

  assign io_outputs_6_payload_x = io_input_payload_x;
  assign io_outputs_6_payload_y = io_input_payload_y;
  always @(*) begin
    io_outputs_7_valid = 1'b0;
    if(_zz_1[7]) begin
      io_outputs_7_valid = io_input_valid;
    end
  end

  assign io_outputs_7_payload_x = io_input_payload_x;
  assign io_outputs_7_payload_y = io_input_payload_y;
  assign _zz_1 = ({7'd0,1'b1} <<< counter_value);
  assign io_input_ready = _zz_io_input_ready;
  assign io_input_fire = (io_input_valid && io_input_ready);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      counter_value <= 3'b000;
    end else begin
      counter_value <= counter_valueNext;
    end
  end


endmodule
