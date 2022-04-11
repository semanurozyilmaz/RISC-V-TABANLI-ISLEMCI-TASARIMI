`include "config.sv"
`include "constants.sv"

module alu (
    input        [4:0]  alu_function,
    input signed [31:0] operand_a,
    input signed [31:0] operand_b,
    output logic [31:0] result,
    output              result_equal_zero
);

parameter ALU_ADD = 5'b00001;
parameter ALU_SUB = 5'b00010;
parameter ALU_SLL = 5'b00011;
parameter ALU_SRL = 5'b00100;
parameter ALU_SRA = 5'b00101;
parameter ALU_SEQ = 5'b00110;
parameter ALU_SLT = 5'b00111;
parameter ALU_SLTU = 5'b01000;
parameter ALU_XOR = 5'b01001;
parameter ALU_OR = 5'b01010;
parameter ALU_AND = 5'b01011;

logic resultzero;
assign result_equal_zero = resultzero;
always_comb begin
    case(alu_function)
          ALU_ADD: begin
              result = operand_a + operand_b;
              if(result==0) resultzero = 1;
              else resultzero = 0;
          end
          ALU_SUB: begin
              result = operand_a - operand_b;
              if(result==0) resultzero = 1;
              else resultzero = 0;
          end
          ALU_SLL: begin
              result = operand_a << operand_b;
              if(result==0) resultzero = 1;
              else resultzero = 0;
          end
          ALU_SRL: begin
              result = operand_a >> operand_b;
              if(result==0) resultzero = 1;
              else resultzero = 0;
          end
          ALU_SRA: begin
               result = operand_a >>> operand_b;
               if(result==0) resultzero = 1;
               else resultzero = 0;
          end
          ALU_SEQ: begin
               result = operand_a == operand_b;
               if(result==0) resultzero = 1;
               else resultzero = 0;
          end
          ALU_SLT: begin
               result = operand_a < operand_b;
               if(result==0) resultzero = 1;
               else resultzero = 0;
          end
          ALU_SLTU: begin
               if($unsigned(operand_a) < $unsigned(operand_b) == 1) begin
                     result = 1;
                     resultzero = 0;
               end else begin
                     result = 0;
                     resultzero = 1;
               end
          end
          ALU_XOR: begin
               result = operand_a ^ operand_b;
               if(result==0) resultzero = 1;
               else resultzero = 0;
          end
          ALU_OR: begin
               result = operand_a | operand_b;
               if(result==0) resultzero = 1;
               else resultzero = 0;
          end
          ALU_AND: begin
               result = operand_a & operand_b;
               if(result==0) resultzero = 1;
               else resultzero = 0;
          end
    endcase
end
endmodule

