module music_code(
	input clk,
	output speaker,
	input value);

reg flipper;
assign speaker = flipper;

reg [14:0] counter;

always @(posedge clk)
		if(counter==value) begin
			counter <= 0;
			flipper <= ~flipper;
		end else counter <= counter+1;


endmodule

module song(
  input sw0, 
  input clk, 
  output speaker
); 
music_code(clk, speaker, 28408);
music_code(clk, speaker, 20408);
endmodule