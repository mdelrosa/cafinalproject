//outputs wave forms depending on what switches are high

module switching(
	input [6:0] switches,
	input clk,
	output [6:0] speaker
);

reg [6:0] flipper;
assign speaker = flipper;

reg [17:0] counterG3;
reg [17:0] counterA3;
reg [17:0] counterB3;
reg [17:0] counterC4;
reg [17:0] counterD4;
reg [17:0] counterE4;
reg [17:0] counterF4;
 
always @(posedge clk) begin
	if (switches[0]) begin //toggle G3
		if(counterG3==255102) begin
			counterG3 <= 0;
			flipper[0] <= ~flipper[0];
		end else counterG3 <= counterG3+1;
	end else flipper[0] <= 0;
	if (switches[1]) begin //toggle A3
		if(counterA3==227272) begin
			counterA3 <= 0;
			flipper[1] <= ~flipper[1];
		end else counterA3 <= counterA3+1;
	end else flipper[1] <= 0;
	if (switches[2]) begin //toggle B3
		if(counterB3==202478) begin
			counterB3 <= 0;
			flipper[2] <= ~flipper[2];
		end else counterB3 <= counterB3+1;
	end else flipper[2] <= 0;
	if (switches[3]) begin //toggle C4
		if(counterC4==191109) begin
			counterC4 <= 0;
			flipper[3] <= ~flipper[3];
		end else counterC4 <= counterC4+1;
	end else flipper[3] <= 0;
	if (switches[4]) begin //toggle D4
		if(counterD4==170264) begin
			counterD4 <= 0;
			flipper[4] <= ~flipper[4];
		end else counterD4 <= counterD4+1;
	end else flipper[4] <= 0;
	if (switches[5]) begin //toggle E4
		if(counterE4==151685) begin
			counterE4 <= 0;
			flipper[5] <= ~flipper[5];
		end else counterE4 <= counterE4+1;
	end else flipper[5] <= 0;
	if (switches[6]) begin //toggle F4
		if(counterF4==143172) begin
			counterF4 <= 0;
			flipper[6] <= ~flipper[6];
		end else counterF4 <= counterF4+1;
	end else flipper[6] <= 0;	
end

endmodule