//http://www.fpga4fun.com/MusicBox2.html
module random_music(clk, speaker);
input clk;
output speaker;

// Binary counter, 16-bits wide
reg [15:0] counter;
always @(posedge clk) counter <= counter+1;
//counter[0] toggles at 12.5MHz, counter[1] at 6.125MHz and so on... so bit 15 will have 381HZ square signal


// Use the highest bit of the counter (MSB) to drive the speaker
assign speaker = counter[15];
endmodule

module a_note(clk, speaker);
input clk;
output speaker;

reg [14:0] counter;
always @(posedge clk) if(counter==28408) counter <= 0; else counter <= counter+1;
// changes at 28408 because it is 1/2 of 56817 which is what is requred to divide the 25MHz by to get a 440Hz signal, and it is half to keep the output duty cycle at 50%
reg speaker;
always @(posedge clk) if(counter==28408) speaker <= ~speaker;
endmodule



module music_with_parameter(clk, speaker, notehz);  //if you give this module the HZ of the note that you want to play then it plays that note
input clk;
output speaker;
input notehz;
wire clkdivider = 25000000/notehz/2;

reg [14:0] counter;
always @(posedge clk) if(counter==0) counter <= clkdivider-1; else counter <= counter-1;

reg speaker;
always @(posedge clk) if(counter==0) speaker <= ~speaker;
endmodule 