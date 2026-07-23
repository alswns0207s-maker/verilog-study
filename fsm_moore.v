`timescale 1ns / 1ps

module fsm_moore_state5(
    input clk,
    input reset,
    input [2:0]sw,
    output reg [2:0]led
    );
    parameter s0 = 3'b000;
    parameter s1 = 3'b001;
    parameter s2 = 3'b010;
    parameter s3 = 3'b011;
    parameter s4 = 3'b100;

    reg [2:0]current_state;
    reg [2:0]next_state;

    //state register
    always@(posedge clk, posedge reset)begin
        if(reset)begin
            current_state <= s0;
        end else begin
            current_state <= next_state;
        end
    end

    //next state combinational logic

    always@(*)begin
        case (current_state)
            s0: begin
                if(sw == 3'b001)begin
                    next_state = s1;
                end else if(sw == 3'b100)begin
                    next_state = s4;
                end else begin
                    next_state = s0;
                end

            end
            
            s1: begin
                if(sw == 3'b010)begin
                    next_state = s2;
                end else begin
                    next_state = s1;
                end
            end    
            
            s2: begin
                if(sw == 3'b011)begin
                    next_state = s3;
                end else begin
                    next_state = s2;
                end
            end
            
            
            s3: begin
                if(sw == 3'b100)begin
                    next_state = s4;
                end else begin
                    next_state = s3;
                end
            end
            
            
            s4: begin
                if(sw == 3'b111)begin
                    next_state = s0;
                end else if(sw == 3'b001)begin
                    next_state = s1;                        
                end else begin
                    next_state = s4;
                end

            end
        endcase
    end

    always@(*)begin
        case(current_state)
            s0 : led = 3'b000;
            s1 : led = 3'b001;
            s2 : led = 3'b010;
            s3 : led = 3'b011;
            s4 : led = 3'b100;
            default : led = 3'b000;
        endcase

    end


endmodule
