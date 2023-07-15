module uart_tx(
	input clk,
	output reg tx
);

reg enable_1 = 1'd0;
reg enable_2 = 1'd0;
reg [2:0] idx = 3'd0;
reg [7:0] byte = 8'b01010101;
reg [8:0] count = 10'd0;
reg [9:0] pause = 10'd0;

always @(posedge clk) begin
	if(count==9'd434) begin
		count = 10'd0;
		if(enable_1==1'd0 && enable_2==1'd0 && pause==10'd100) begin
			tx = 1'd0;
			enable_1 = 1'd1;
		end
		else if(enable_1==1'd1) begin
			tx = byte[idx];
			idx = idx + 3'd1;
			if(idx==3'd0) begin
				enable_1 = 1'd0;
				enable_2 = 1'd1;
			end
		end
		else if(enable_1==1'd0 && enable_2==1'd1 && pause==10'd100) begin
			tx = 1'd1;
			enable_2 = 1'd0;
			pause = 10'd0;
		end
		else begin
			pause = pause + 10'd1;
		end
	end
	else begin
		count = count + 10'd1;
	end
end

endmodule