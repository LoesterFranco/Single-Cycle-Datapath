`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2021 08:13:34 PM
// Design Name: 
// Module Name: wrap_around_leds
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module wrap_around_leds(
    input clk,
    input rst,
    input sw0,
    input sw1,
    input sw2,
    input [7:0] cnt,
    output reg led0,
    output reg led1,
    output reg led2,
    output reg led3
);

    reg direction;
    reg [2:0] state;
    reg [2:0] prev_state;
    reg [2:0] in;

    wire w1;
    wire w2;
    wire [7:0] cnt_out;
    wire single_hz_clock;

    wire x_rst;
    assign x_rst = 1'b0;


    xnor G_xnor(w1, sw1,sw0);
    and G_and(w2, w1, sw2);

    always @(posedge clk)
    begin
        if(sw0 == 1 && sw1 == 0) direction <= 1;
        else if(sw0 == 0 && sw1 == 1) direction <= 0;
    end

    clk_divider slow_clock(.clk_in(clk), .rst(x_rst), .clk_out(single_hz_clock));
    bi_directional_counter counter(.clk(single_hz_clock), .rst(rst), .dir(direction), .max_num(cnt), .pause(w2), .count(cnt_out));


    initial
    begin
        in[0] <= sw2;
        in[1] <= sw1;
        in[2] <= sw0;
        led0 <= 1'b0;
        led1 <= 1'b0;
        led2 <= 1'b0;
        led3 <= 1'b0;
        state <= 3'b000;
        prev_state <= 3'b000;
    end


    always @(posedge single_hz_clock)
    begin
        if (in[1]!=sw1)
            state <= prev_state;
        else if (in[2]!=sw0)
            state <= prev_state;

        in[0] <= sw2;
        in[1] <= sw1;
        in[2] <= sw0;


        if (rst)
            begin
                if (rst == 1'b1)
                begin
                    prev_state <= 3'b000;
                    state <= 3'b000;
                    led0 = 1'b0;
                    led1 = 1'b0;
                    led2 = 1'b0;
                    led3 = 1'b0;

                end
            end
        else if(sw2==0 && ((sw0 == 0 && sw1==1) || (sw0==1 && sw1==0)))
        begin
            if (cnt_out == 8'b0)
            begin
                case(state)
                    3'b000: begin
                        if (in == 3'b100)
                            begin
                                state <= 3'b001;
                                prev_state <= 3'b100;
                            end
                        else if(in == 3'b010)
                            begin
                                state <= 3'b100;
                                prev_state <= 3'b001;
                            end
                        else
                            begin
                                state <= 3'b000;
                                prev_state <= 3'b000;
                            end

                        led0 = 1'b0;
                        led1 = 1'b0;
                        led2 = 1'b0;
                        led3 = 1'b0;
                    end

                    3'b001:
                    begin
                        if (in == 3'b100)
                            begin
                                state <= 3'b010;
                                prev_state <= 3'b000;
                            end
                        else if (in == 3'b010)
                            begin
                                state <= 3'b000;
                                prev_state <= 3'b010;
                            end
                        else
                            begin
                                state <= 3'b001;
                                prev_state <= 3'b001;
                            end

                        led0 = 1'b1;
                        led1 = 1'b0;
                        led2 = 1'b0;
                        led3 = 1'b0;
                    end

                    3'b010:
                    begin
                        if (in == 3'b100)
                            begin
                                state <= 3'b011;
                                prev_state <= 3'b001;
                            end
                        else if (in == 3'b010)
                            begin
                                state <= 3'b001;
                                prev_state <= 3'b011;
                            end
                        else
                            begin
                                state <= 3'b010;
                                prev_state <= 3'b010;
                            end

                        led0 = 1'b0;
                        led1 = 1'b1;
                        led2 = 1'b0;
                        led3 = 1'b0;
                    end

                    3'b011:
                    begin
                        if (in == 3'b100)
                            begin
                                state <= 3'b100;
                                prev_state <= 3'b010;
                            end
                        else if (in == 3'b010)
                            begin
                                state <= 3'b010;
                                prev_state <= 3'b100;
                            end
                        else
                            begin
                                state <= 3'b011;
                                prev_state <= 3'b011;
                            end

                        led0 = 1'b0;
                        led1 = 1'b0;
                        led2 = 1'b1;
                        led3 = 1'b0;
                    end

                    3'b100:
                    begin
                        if (in == 3'b100)
                            begin
                                state <= 3'b000;
                                prev_state <= 3'b011;
                            end
                        else if (in == 3'b010)
                            begin
                                state <= 3'b011;
                                prev_state <= 3'b000;
                            end
                        else
                            begin
                                state <= 3'b100;
                                prev_state <= 3'b100;
                            end

                        led0 = 1'b0;
                        led1 = 1'b0;
                        led2 = 1'b0;
                        led3 = 1'b1;
                    end
                endcase
            end
        end
    end
endmodule
