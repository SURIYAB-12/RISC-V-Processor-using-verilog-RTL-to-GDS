`timescale 1ns/1ps
module simple_riscv (
    input clk,
    input reset,

    input [15:0] instruction,   // Instruction input from testbench
    input [7:0] data_in,        // Data input (for LOAD)

    output reg [7:0] data_out,  // Data output (for STORE)
    output reg [3:0] addr,      // Address for memory access
    output reg mem_read,        // Memory read signal
    output reg mem_write        // Memory write signal
);

    reg [7:0] reg_file [0:15]; // 16 registers, 8-bit each

    wire [3:0] opcode = instruction[15:12];
    wire [3:0] rd     = instruction[11:8];
    wire [3:0] rs1    = instruction[7:4];
    wire [3:0] rs2_imm = instruction[3:0];

    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset register file and outputs
            for (i = 0; i < 16; i = i + 1) begin
                reg_file[i] <= 8'b0;
            end
            data_out <= 8'b0;
            addr <= 4'b0;
            mem_read <= 1'b0;
            mem_write <= 1'b0;
        end else begin
            // Default control signals
            mem_read <= 1'b0;
            mem_write <= 1'b0;
            data_out <= 8'b0;
            addr <= 4'b0;

            case (opcode)
                4'b0000: begin // LOAD: reg_file[rd] = data_in from addr rs1
                    addr <= rs1;
                    mem_read <= 1'b1;
                    reg_file[rd] <= data_in;
                end
                4'b0001: begin // STORE: data_out = reg_file[rd], addr = rs1
                    addr <= rs1;
                    mem_write <= 1'b1;
                    data_out <= reg_file[rd];
                end
                4'b0010: begin // ADD
                    reg_file[rd] <= reg_file[rs1] + reg_file[rs2_imm];
                end
                4'b0011: begin // SUB
                    reg_file[rd] <= reg_file[rs1] - reg_file[rs2_imm];
                end
                4'b0100: begin // AND
                    reg_file[rd] <= reg_file[rs1] & reg_file[rs2_imm];
                end
                4'b0101: begin // OR
                    reg_file[rd] <= reg_file[rs1] | reg_file[rs2_imm];
                end
                default: begin
                    // NOP or undefined opcode: do nothing
                end
            endcase
        end
    end

endmodule

