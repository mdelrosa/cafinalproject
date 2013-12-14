module music_code(
	input clk,
	output speaker,
	input [14:0] value
	input  enable);

reg flipper;
assign speaker = flipper;

reg [14:0] counter;

always @(posedge clk)
  if (enable = 1) begin
		if(counter==value) begin
			counter <= 0;
			flipper <= ~flipper;
		end else counter <= counter+1;
		end


endmodule

module song(
  input sw0, 
  input clk, 
  output speaker
); 

reg [14:0] enable
reg [14:0] counter_time 
music_code(clk, speaker, 28408, enable[0]);
music_code(clk, speaker, 20408, enable[1]);

counter_time = 0
enable = B1
always @(posedge clk) begin
  if counter ==(SOMETHING) begin
    enable = enable >> 1;
    counter_time = 0;
  end
else counter_time = counter_time + 1;
  
endmodule