`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2023 01:20:09
// Design Name: 
// Module Name: vending_machine_18105070
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


module vending_machine_18105070(
  input clk,
  input rst,
  input [1:0]in, //input, 01 = 5 rs, 10 = 10 rs //00 means nothing was added, 01 means 5 rupee was aded i.e. given as input
  output reg out,//1-->product is given to user, 0-->no prod
  output reg[1:0] change,//tells change, can be 5,10 or 0 as prod cost is 15 and we only have 5 and 10 as coins
  output reg[1:0] c_state,
  output reg[1:0] n_state
  );

parameter s0 = 2'b00;//we take 3 params for 3states
parameter s1 = 2'b01;
parameter s2 = 2'b10;
  
  //reg[1:0] c_state,n_state;//to store current and next state
  
  always@ (posedge clk)
    begin
      if(rst == 1)
        begin
          c_state = 0;
          n_state = 0;
          change = 2'b00;
        end
      else
        c_state = n_state;//we need this
      
      case(c_state)
        s0: //state 0 : 0 rs
        if(in == 0)
          begin
            n_state = s0;
            out = 0;
            change = 2'b00;
          end
        else if(in == 2'b01)
          begin
            n_state = s1;
            out = 0;
            change = 2'b00;
          end
        else if(in == 2'b10)
          begin
            n_state = s2;
            out = 0;
            change = 2'b00;
          end
        s1:  //state 1 : 5 rs
        if(in == 0)
          begin
            n_state = s0;
            out = 0;
            change = 2'b01; //change returned 5 rs
          end
        else if(in == 2'b01)
          begin
            n_state = s2;
            out = 0;
            change = 2'b00;
          end
        else if(in == 2'b10)
          begin
            n_state = s0;
            out = 1;
            change = 2'b00;
          end
        s2:  //state 2 : 10 rs
        if(in == 0)
          begin
            n_state = s0;
            out = 0;
            change = 2'b10;
          end
        else if(in == 2'b01)
          begin
            n_state = s0;
            out = 1;
            change = 2'b00;
          end
        else if(in == 2'b10)
          begin
            n_state = s0;
            out = 1;
            change = 2'b01; //change returned 5 rs and 1 bottle
          end
      endcase
    end 
endmodule
