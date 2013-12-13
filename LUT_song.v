
module music_code(
	input clk,
	output speaker,
	input [32:0] value);

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
  input sw0, 
  input clk, 
  output speaker
); 

reg [14:0] counter_time; 
reg [32:0] LUT [0:32];
reg [32:0] note_index;

initial readmemb("merrychristmas.dat");

music_code(clk, speaker, LUT [note_index]);

always @(posedge clk) begin
  if (counter_time ==20910) begin
    note_index = note_index+1;
    counter_time = 0;
  end
else counter_time = counter_time + 1;

end

  
endmodule