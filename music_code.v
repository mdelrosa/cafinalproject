//http://www.fpga4fun.com/MusicBox2.html
module music_code(
	input sw0,
	input clk,
	output speaker
);

reg flipper;
assign speaker = flipper;

reg [14:0] counter;

always @(posedge clk)
	if (sw0) begin
		if(counter==28408) begin
			counter <= 0;
			flipper <= ~flipper;
		end else counter <= counter+1;
	end else begin
		if(counter==20408) begin
			counter <= 0;
			flipper <= ~flipper;
		end else counter <= counter+1;
	end

endmodule