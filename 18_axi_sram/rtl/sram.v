module sram (
    clk,
    cs,
    we,
    rstn,
    io_addr,
    io_din,
    io_dout
);

parameter MEMSIZE = 8;
parameter WORDSIZE= 32;

input wire clk,cs,we,rstn;
input wire [WORDSIZE - 1 : 0] io_din;
input wire [MEMSIZE - 1 : 0] io_addr;
output reg [WORDSIZE - 1 : 0] io_dout;

reg [WORDSIZE - 1 : 0] ram [MEMSIZE -1 : 0];

integer i ;

always @(posedge clk or negedge rstn) begin
    if(~rstn)
        for(i = 0 ; i< MEMSIZE ; i=i+1) begin
            ram[i] <= 'd0;
        end
    else if(cs) begin
            if(we) begin
                ram[io_addr] <= io_din;
                io_dout <= 'd0;
            end
            else
                io_dout <= ram[io_addr];
    end
end
    
endmodule