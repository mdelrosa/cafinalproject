//outputs frequency values depending on what switches are high

module switching(
	input [6:0] switches
	input clk
	output [6:0] speaker
);

reg flipper;
assign speaker = flipper;

reg [17:0] counterC;
reg [17:0] counterD;
reg [17:0] counterE;
reg [17:0] counterF;
reg [17:0] counterG;
reg [17:0] counterA;
reg [17:0] counterB;
 
always @(posedge clk)
	if (switches[0]) begin
		flipper[0] <= ~flipper[0]; //toggle C4 (261.63	191109.582234453)
		if(counterC==191109) begin
			counterC <= 0;
			flipper <= ~flipper;
		end else counterC <= counterC+1;
	end else flipper <= 0;
	end if (switches[1]) begin
		flipper[1] <= ~flipper[1]; //toggle D4 (293.66	170264.932234557)
		if(counterD==170264) begin
			counterD <= 0;
			flipper <= ~flipper;
		end else counterD <= counterD+1;
	end if (switches[2]) begin
		flipper[2] <= ~flipper[2]; //toggle E4 (329.63	151685.222825592)
		if(counterE==151685) begin
			counterE <= 0;
			flipper <= ~flipper;
		end else counterE <= counterE+1;
	end if (switches[3]) begin
		flipper[3] <= ~flipper[3]; //toggle F4 (349.23	143172.121524497)
		if(counterF==143172) begin
			counterF <= 0;
			flipper <= ~flipper;
		end else counterF <= counterF+1;
	end if (switches[4]) begin
		flipper[4] <= ~flipper[4]; //toggle G4 (392	127551.020408163)
		if(counterG==127551) begin
			counterG <= 0;
			flipper <= ~flipper;
		end else counterG <= counterG+1;
	end if (switches[5]) begin
		flipper[5] <= ~flipper[5]; //toggle A4 (440	113636.363636364)
		if(counterA==113636) begin
			counterA <= 0;
			flipper <= ~flipper;
		end else counterA <= counterA+1;
	end if (switches[6])
		flipper[6] <= ~flipper[6]; //toggle B4 (493.88	101239.167409087)
		if(counterB==101239) begin
			counterB <= 0;
			flipper <= ~flipper;
		end else counterB <= counterB+1;
	end


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