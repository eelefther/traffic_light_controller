module traffic_light_controller (
    input clk,
    input reset,
    output reg [2:0] main_light,
    output reg [2:0] side_light
);
  reg [1:0] mode;
  
  localparam s_green  = 2'b00;
  localparam s_yellow = 2'b01;
  localparam m_green  = 2'b10;
  localparam m_yellow = 2'b11;
  
  reg [2:0] colour;

  localparam green  = 3'b001;
  localparam yellow = 3'b010;
  localparam red    = 3'b100;
  
  reg [3:0] count;
  
  always @(*) begin
    case (mode) 
      2'b00: begin
        main_light = green;
        side_light = red;
      end
      2'b01: begin
        main_light = yellow;
        side_light = red;
      end
      2'b10: begin
        main_light = red;
        side_light = green;
      end
      2'b11: begin
        main_light = red;
        side_light = yellow;
      end
    endcase
  end 
  
  always @(posedge reset or posedge clk) begin
    if (reset) begin
      mode  <= s_green; 
      count <= 4'b0000;
    end
    else begin
      count <= count + 1;
      
      if ((main_light == red || main_light == green) && count == 10) begin
        mode  <= mode + 1;
        count <= 4'b0000;
      end
      if (main_light == yellow && count == 3) begin
        mode  <= mode + 1;
        count <= 4'b0000;
      end
      if ((side_light == red || side_light == green) && count == 10) begin
        mode  <= mode + 1;
        count <= 4'b0000;
      end
      if (side_light == yellow && count == 3) begin
        mode  <= mode + 1;
        count <= 4'b0000;
      end
    end
  end
  
endmodule
