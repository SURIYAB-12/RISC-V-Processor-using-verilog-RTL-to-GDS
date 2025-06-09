`timescale 1ns/1ps
module riscv_simple_tb;

    reg clk;
    reg reset;
    reg [15:0] instruction;
    reg [7:0] data_in;

    wire [7:0] data_out;
    wire [3:0] addr;
    wire mem_read;
    wire mem_write;

    // Instantiate the processor module
    simple_riscv dut (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .data_in(data_in),
        .data_out(data_out),
        .addr(addr),
        .mem_read(mem_read),
        .mem_write(mem_write)
    );

    // Simple data memory model for testbench
    reg [7:0] data_mem [0:15];

    integer i;

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset logic
    initial begin
        reset = 1;
        #20;
        reset = 0;
    end

    // Initialize data memory
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            data_mem[i] = 8'd0;
        end
        data_mem[2] = 8'd5;
        data_mem[3] = 8'd10;
        data_mem[4] = 8'd0;
    end

    // Stimulus process: exercising all functions
    initial begin
        @(negedge reset);

        // 1) LOAD R1 <- MEM[2]
        instruction = 16'b0000_0001_0010_0000; // opcode=0000(LOAD), rd=0001(R1), rs1=0010(addr=2), rs2_imm=0000
        data_in = data_mem[2];
        #10;

        // 2) LOAD R2 <- MEM[3]
        instruction = 16'b0000_0010_0011_0000; // LOAD R2 <- MEM[3]
        data_in = data_mem[3];
        #10;

        // 3) ADD R3 = R1 + R2
        instruction = 16'b0010_0011_0001_0010; // ADD R3 = R1 + R2
        data_in = 8'h00;
        #10;

        // 4) STORE R3 -> MEM[4]
        instruction = 16'b0001_0011_0100_0000; // STORE R3 -> MEM[4]
        data_in = 8'h00;
        #10;

        // Simulate memory write on STORE
        if (mem_write) begin
            data_mem[addr] = data_out;
            $display("STORE: MEM[%0d] = %0d", addr, data_out);
        end

        // 5) SUB R5 = R1 - R2
        instruction = 16'b0011_0101_0001_0010; // SUB R5 = R1 - R2
        data_in = 8'h00;
        #10;

        // 6) AND R6 = R1 & R2
        instruction = 16'b0100_0110_0001_0010; // AND R6 = R1 & R2
        data_in = 8'h00;
        #10;

        // 7) OR R7 = R1 | R2
        instruction = 16'b0101_0111_0001_0010; // OR R7 = R1 | R2
        data_in = 8'h00;
        #10;

        // 8) NOP
        instruction = 16'b0000_0000_0000_0000;
        data_in = 8'h00;
        #10;

        $finish;
    end

endmodule

