//http://www.fpga4fun.com/MusicBox2.html
module music_code(clk, speaker);
output speaker;
input clk;

reg flipper;
assign speaker = flipper;

reg [14:0] counter;

always @(posedge clk) if(counter==28408) counter <= 0; else counter <= counter+1;

always @(posedge clk) if(counter==28408) flipper <= ~flipper;

endmodule