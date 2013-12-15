module LUT_song(
  input clk,
  output [6:0] note
);

	reg [31:0] counter_time; 
	reg [6:0] LUT [0:127];
	reg [31:0] note_index;

	initial readmemb("merrychristmas.txt", LUT);

	assign note = LUT[note_index];

	always @(posedge clk, posedge reset) begin
		if (counter_time == 'd10_000_000_000) begin
			note_index = note_index+1;
			counter_time = 0;
		end else counter_time = counter_time + 1;
	end
endmodule