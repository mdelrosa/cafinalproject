//http://www.fpga4fun.com/MusicBox2.html
module random_music(clk, speaker);
input clk;
output speaker;

// Binary counter, 16-bits wide
reg [15:0] counter;
always @(posedge clk) counter <= counter+1;

// Use the highest bit of the counter (MSB) to drive the speaker
assign speaker = counter[15];
endmodule

module a_note(clk, speaker);
input clk;
output speaker;

reg [14:0] counter;
always @(posedge clk) if(counter==28408) counter <= 0; else counter <= counter+1;

reg speaker;
always @(posedge clk) if(counter==28408) speaker <= ~speaker;
endmodule