module axi_sram (
    //--- Global signals ---//
    ACLK,
    ARESETn,

    //--- Write address channel signals ---//
    AWID,
    AWADDR,
    AWLEN,
    AWSIZE,
    AWBURST,
    //AWLOCK, //AXI3 ONLY
    AWCACHE,
    AWPROT,
    AWQOS, //AXI4 ONLY
    AWREGION, //AXI4 ONLY
    AWUSER, //AXI4 ONLY , USER IDENTIFY

    AWVALID,
    AWREADY,

    //--- Write data channel signals ---//
    WID,
    WDATA,
    WSTRB,
    WLAST,
    WUSER,

    WVALID,
    WREADY,

    //--- Write response channel signals ---//
    BID,
    BRESP,
    BUSER,

    BVALID,
    BREADY,

    //--- Read address channel signals ---//
    ARID,
    ARADDR,
    ARLEN,
    ARSIZE,
    ARBURST,
    ARLOCK,
    ARCACHE,
    ARPROT,
    ARQOS,
    ARREGION,
    ARUSER,

    ARVALID,
    ARREADY,

    //--- Read data channel signals ---//
    RID,
    RDATA,
    RRESP,
    RLAST,
    RUSER,

    RVALID,
    RREADY

    //--- Low-power interface signals ---//
);

parameter START_ADDR = 'b0; //定义该组件的起始地址
parameter ADDR_RANGE = 'hFFF + 1; //定义该组件的地址范围

parameter AxID_WIDTH = 3;
parameter AxADDR_WIDTH = 32;
parameter AxLEN_WIDTH = 8;
parameter AxSIZE_WIDTH = 3;
parameter AxBURST_WIDTH = 2;
parameter AxCACHE_WIDTH = 4;
parameter AxPROT_WIDTH = 3;
parameter AxQOS_WIDTH = 4; //AXI4 ONLY
parameter AxREGION_WIDTH = 4; //AXI4 ONLY
parameter USER_WIDTH = 2; //AXI4 ONLY , USER IDENTIFY
parameter BEAT_WIDTH = 8; //一个BEAT,占据一个地址
parameter DATA_WIDTH = BEAT_WIDTH*128; //128 byte , 1024 bits

parameter RESP_WIDTH = 2;
//--- Global signals ---//
input wire ACLK,ARESETn;

//--- Write address channel signals ---//
input wire [AxID_WIDTH - 1 : 0] AWID; // master ID
input wire [AxADDR_WIDTH - 1 : 0] AWADDR; // 初始地址 slave 的地址分配是每 4KB 一个 slave， 也就是 0~0xFFF, 注意不要跨过4KB 边界，否则会访问到下一个slave
input wire [AxLEN_WIDTH - 1 : 0] AWLEN; // 要接收的burst的数量 也就是要用几个周期来接收burst
input wire [AxSIZE_WIDTH - 1 : 0] AWSIZE; // 要接收的burst的长度（一个burst占多少字节）
input wire [AxBURST_WIDTH - 1 : 0] AWBURST; // 要接收的burst类型 FIXED 地址固定 INCR 地址增加 WRAP 地址循环增加
//input wire AWLOCK ;
input wire [AxCACHE_WIDTH - 1 : 0] AWCACHE;
input wire [AxPROT_WIDTH - 1 : 0] AWPROT;
input wire [AxQOS_WIDTH - 1 : 0] AWQOS; //AXI4 ONLY
input wire [AxREGION_WIDTH - 1 : 0] AWREGION; //AXI4 ONLY
input wire [USER_WIDTH - 1 : 0] AWUSER; //AXI4 ONLY
input wire AWVALID;
output reg AWREADY;

//--- Write data channel signals ---//
input wire [AxID_WIDTH - 1 : 0] WID; //AXI3 ONLY
input wire [BEAT_WIDTH - 1 : 0] WDATA;
input wire WSTRB;
input wire WLAST;
input wire [USER_WIDTH - 1 : 0] WUSER;
input wire WVALID;
output reg WREADY;


//---Write response channel signals ---//
output reg [AxID_WIDTH - 1 : 0] BID;
output reg [RESP_WIDTH - 1 : 0] BRESP;
output reg [USER_WIDTH - 1 : 0] BUSER; //AXI4 ONLY
output reg BVALID;
input wire BREADY;


//--- Read address channel signals ---//
input wire [AxID_WIDTH - 1 : 0] ARID;
input wire [AxADDR_WIDTH - 1 : 0] ARADDR;
input wire [AxLEN_WIDTH - 1 : 0] ARLEN;
input wire [AxSIZE_WIDTH - 1 : 0] ARSIZE;
input wire [AxBURST_WIDTH - 1 : 0] ARBURST;
input wire ARLOCK;
input wire [AxCACHE_WIDTH - 1 : 0] ARCACHE;
input wire [AxPROT_WIDTH - 1 : 0] ARPROT;
input wire [AxQOS_WIDTH - 1 : 0] ARQOS; //AXI4 ONLY
input wire [AxREGION_WIDTH - 1 : 0] ARREGION; //AXI4 ONLY
input wire [USER_WIDTH - 1 : 0] ARUSER; //AXI4 ONLY
input wire ARVALID;
output reg ARREADY;

//--- Read data channel signals ---//
output reg [AxID_WIDTH - 1 : 0] RID;
output reg [BEAT_WIDTH - 1 : 0] RDATA;
output reg [RESP_WIDTH - 1 : 0] RRESP;
output reg RLAST;
output reg [USER_WIDTH - 1 : 0] RUSER; //AXI4 ONLY
output reg RVALID;
input wire RREADY;

//--- Burst type decode ---//
localparam [AxBURST_WIDTH - 1:0]
FIXED  = 2'b00,
INCR = 2'b01,
WRAP = 2'b10;

//---xRESP decode ---//
localparam [RESP_WIDTH - 1:0]
OKAY = 2'b00,
EXOKAY = 2'b01,
SLVERR = 2'b10,
DECERR = 2'b11;
 
//--- machine state decode ---//
localparam [1:0]
IDLE = 2'b00,
W_DATA = 2'b01,
W_DATA_LAST = 2'b10,
R_DATA = 2'b11;

//--- state machine variable ---//
reg [1:0] state_current;
reg [1:0] state_next;

//--- 1. state transfer block ---//
always @(posedge ACLK or negedge ARESETn) 
    if(~ARESETn) begin
        state_current <= IDLE;
        //state_next <= IDLE;
    end else
        state_current <= state_next;

//--- 2. state switch block ---//
always @(*) begin
    case (state_current)
        IDLE : begin
                if(AWVALID && AWREADY)
                    state_next = W_DATA;
                else if(ARVALID & ARREADY)
                    state_next = R_DATA;
                else
                    state_next = IDLE;
                end

        W_DATA : begin
                    if(WVALID && WREADY)
                        //if(WLAST)
                        if(counter == AxLEN - 1) begin
                            state_next = W_DATA_LAST;
                        end
                        else
                            state_next = W_DATA;
                    else
                        state_next = W_DATA;
                end

        W_DATA_LAST : begin
                        if(BVALID && BREADY)
                            state_next = IDLE;
                        else
                            state_next = W_DATA_LAST;
                    end


        default : begin                   //R_DATA
                    if(RVALID && RREADY)
                        if(counter == AxLEN - 1) begin
                            state_next = IDLE;
                            RLAST = 'b1;
                        end
                        else
                            state_next = R_DATA;
                    else
                        state_next = R_DATA;
                end
    endcase
end


//--- 3. state response block ---//    
reg [AxID_WIDTH - 1 : 0] AxID;
reg [AxADDR_WIDTH - 1 : 0] AxADDR; //初始地址
reg [AxLEN_WIDTH - 1 : 0] AxLEN; //burst 长度，也就是经历几个周期data channel 才会关闭
reg [AxSIZE_WIDTH - 1 : 0] AxSIZE; //每个burst的大小，也就是一次地址增加几个字节
reg [AxBURST_WIDTH - 1 : 0] AxBURST; //burst传输的类型，FIXED, INCR , WRAP

reg s0_cs,s0_we;
reg [AxADDR_WIDTH - 1 : 0] s0_ADDR;
reg [BEAT_WIDTH - 1 : 0] s0_din;
wire [BEAT_WIDTH - 1 : 0] s0_dout;

reg [AxLEN_WIDTH - 1 : 0] counter; //记录读取数据的次数，最大值为AxLEN - 1;

reg [RESP_WIDTH - 1 : 0] resp;

always @(posedge ACLK or negedge ARESETn) begin
    if(~ARESETn) begin
        AxID <= 'b0;
        AxADDR <= 'b0;
        AxLEN <= 'b0;
        AxSIZE <= 'b0;
        AxBURST <= 'b0;

        AWREADY <= 1'b0;
        WREADY <= 1'b0;
        BVALID <=1'b0;

        ARREADY <= 1'b0;
        RVALID <= 1'b0;

        s0_cs <= 1'b0;
        s0_we <= 1'b0;

        BID <= 'b0;
        BRESP <= 'b0;
        BUSER <= 'b0;
        BVALID <= 'b1;

        RID <= 1'b0;
        RVALID <= 1'b0;
        RLAST <= 1'b0;

        counter <= 'b0;

        resp <= OKAY;
    end else begin
        case (state_current)
            IDLE : begin
                    s0_cs <= 1'b0;

                    BVALID <= 1'b0;
                    RVALID <= 1'b0;
                    RLAST <= 1'b0;

                    counter <= 'b0;

                    if(AWVALID) begin
                        if((AWADDR >= START_ADDR) && (AWADDR + AWLEN*AWSIZE < ADDR_RANGE)) begin
                            AxID <= AWID;
                            AxADDR <= AWADDR;
                            AxLEN <= AWLEN;
                            AxSIZE <= AWSIZE;
                            AxBURST <= AWBURST;
                            AWREADY <= 1'b1;
                        end else
                            resp <= SLVERR;
                            //$error("Error : Write ADDR out of range");
                            //$finish;
                        end
                    else if(ARVALID) begin
                            if((ARADDR >= START_ADDR) && (ARADDR + ARLEN*ARSIZE < ADDR_RANGE)) begin
                                AxID <= ARID;
                                AxADDR <= ARADDR;
                                AxLEN <= ARLEN;
                                AxSIZE <= ARSIZE;
                                AxBURST <= ARBURST;
                                ARREADY <= 1'b1;
                            end else
                                resp <= SLVERR;
                                //$error("Error : Read ADDR out or range");
                                //$finish;
                        end
                end
            W_DATA : begin

                        AWREADY <= 1'b0;
                        WREADY <= 1'b0;

                        if(WVALID) begin
                            s0_cs <= 1'b1;
                            s0_we <= 1'b1;
                            s0_ADDR <= AxADDR;
                            s0_din <= WDATA;

                            WREADY <= 1'b1;
                            counter <= counter + 1;

                            case(AxBURST)
                                FIXED : AxADDR <= AxADDR;
                                INCR : AxADDR <= AxADDR + 2**AxSIZE;
                                WRAP : AxADDR <= AxADDR + 2**AxSIZE; //？？？ 未写WRAP逻辑
                                default : ;// $error("Error : BURST type error!");
                            endcase

                        end 
                    end
            W_DATA_LAST : begin

                            WREADY <= 1'b0;
                            s0_cs <= 1'b0;
                            s0_we <= 1'b0;
                            counter <= 'b0;

                            BID <= AxID;
                            BRESP <= resp;
                            BUSER <= 'b0;

                            BVALID <= 1'b1;
                        end

            default : begin
                
                        ARREADY <= 1'b0;

                        RID <= AxID;
                        s0_cs <= 1'b1;
                        s0_we <= 1'b0;
                        s0_ADDR <= AxADDR;
                        RDATA <=  s0_dout;
                        RRESP <= resp;
                        RUSER <= 'b0;

                        RVALID <= 1'b1;

                        case(AxBURST)
                            FIXED : AxADDR <= AxADDR;
                            INCR : AxADDR <= AxADDR + 2**AxSIZE;
                            WRAP : AxADDR <= AxADDR + 2**AxSIZE; //？？？ 未写WRAP逻辑
                            default : ;//$error("Error : BURST type error!");
                        endcase

                        counter <= counter + 1;
                        // if(counter == AxLEN - 1)
                        //     RLAST <= 1'b1;
                        // else
                        //     counter <= counter + 1;
                    end
        endcase
    end
end


sram #(
    .MEMSIZE(100), //一共4096个地址
    .WORDSIZE(BEAT_WIDTH) //每个地址下可以存1个字节，也就是8bits
)
s0(
    .clk(ACLK),
    .cs(s0_cs),
    .we(s0_we),
    .rstn(ARESETn),
    .io_addr(s0_ADDR),
    .io_din(s0_din),
    .io_dout(s0_dout)
);

	initial begin
		$dumpfile("axi_sram_test.vcd");
		$dumpvars(0,axi_sram);
	end


endmodule
