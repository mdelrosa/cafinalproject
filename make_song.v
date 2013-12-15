module play_note(
	input clock,
	output speaker,
	input [14:0] value,
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

module make_song(
  input clk, 
  output [1:0] speaker
); 

play_note c1(clk, speaker1, 28408);
play_note c2(clk, speaker2, 20408);
endmodule