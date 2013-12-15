module play_note(
	input clk,
	output speaker,
	input [31:0] value);

	reg flipper;
	assign speaker = flipper;

	reg [14:0] counter;

	always @(posedge clk)
		if(counter==value) begin
			counter <= 0;
			flipper <= ~flipper;
		end else counter <= counter+1;

endmodule

module LUT_song(
  input clk,
  output speaker
);

	reg [31:0] counter_time; 
	reg [6:0] LUT [0:127];
	reg [31:0] note_index;

	initial readmemb("merrychristmas.txt", LUT);

	play_note note(clk, speaker, LUT[note_index]);

	always @(posedge clk) begin
		if (counter_time == 'd10_000_000_000) begin
			note_index = note_index+1;
			counter_time = 0;
		end else counter_time = counter_time + 1;
	end
endmodule