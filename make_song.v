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
  output [1:0] speaker
); 

music_code c1(clk, speaker[0], 28408);
music_code c2(clk, speaker[1], 20408);
endmodule