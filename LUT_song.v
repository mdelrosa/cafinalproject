module LUT_song(
  input clk,
  input reset,
  output [6:0] note
);

	reg [31:0] counter_time; 
	reg [6:0] LUT [0:47];
	reg [31:0] note_index;

	initial $readmemb("merrychristmas.mem", LUT);

	always @(posedge clk) begin
		if (counter_time == 10000000000) begin
			note_index <= note_index + 1;
			counter_time <= 0;
		end else counter_time <= counter_time + 1;
	end

	assign note = LUT[note_index];
endmodule