//master module to handle switching between modes

module master(
	input [7:0] switches,
	input clk,
	output [6:0] speaker
);

reg [6:0] pianokeys;
wire [6:0] LUT_note;

always @(posedge clk) begin
	if (switches[7]) begin
		pianokeys <= LUT_note;
	end else
		pianokeys <= switches[6:0];
end

piano player(pianokeys, clk, speaker);
LUT_song song(clk, switches[7], LUT_note);

endmodule