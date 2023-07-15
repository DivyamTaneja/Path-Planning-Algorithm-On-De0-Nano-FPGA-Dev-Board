// SM : Task 2 C : Path Planning
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.
This file is used to design path planner.

Recommended Quartus Version : 19.1
The submitted project file must be 19.1 compatible as the evaluation will be done on Quartus Prime Lite 19.1.

Warning: The error due to compatibility will not be entertained.
-------------------
*/

//Path Planner design
//Parameters : node_count : for total no. of nodes + 1 (consider an imaginary node, refer discuss forum),
//					max_edges : no. of max edges for every node.


//Inputs  	 : clk : 50 MHz clock, 
//				   start : start signal to initiate the path planning,
//				   s_node : start node,
//				   e_node : destination node.
//
//Output     : done : Path planning completed signal,
//             final_path : the final path from start to end node.



//////////////////DO NOT MAKE ANY CHANGES IN MODULE//////////////////

module path_planner
#(parameter node_count = 27, parameter max_edges = 4)
(
	input clk,
	input start,
	input [4:0] s_node,
	input [4:0] e_node,
	output reg done,	
	output reg [10*5-1:0] final_path
);

////////////////////////WRITE YOUR CODE FROM HERE///////////////////max_edges

reg [4:0] graph[0:node_count-1][0:max_edges-1][0:1];
initial begin
	done=1'd1;
	final_path=49'd0;
	graph[00][0][0]=5'd01;graph[00][1][0]=node_count;graph[00][2][0]=node_count;graph[00][3][0]=node_count;
	graph[00][0][1]=5'd03;
	graph[01][0][0]=5'd00;graph[01][1][0]=5'd02;graph[01][2][0]=5'd13;graph[01][3][0]=node_count;
	graph[01][0][1]=5'd03;graph[01][1][1]=5'd03;graph[01][2][1]=5'd03;
	graph[02][0][0]=5'd01;graph[02][1][0]=5'd03;graph[02][2][0]=5'd05;graph[02][3][0]=node_count;
	graph[02][0][1]=5'd03;graph[02][1][1]=5'd01;graph[02][2][1]=5'd03;
	graph[03][0][0]=5'd02;graph[03][1][0]=node_count;graph[03][2][0]=node_count;graph[03][3][0]=node_count;
	graph[03][0][1]=5'd01;
	graph[04][0][0]=5'd06;graph[04][1][0]=node_count;graph[04][2][0]=node_count;graph[04][3][0]=node_count;
	graph[04][0][1]=5'd03;
	graph[05][0][0]=5'd02;graph[05][1][0]=5'd06;graph[05][2][0]=5'd09;graph[05][3][0]=node_count;
	graph[05][0][1]=5'd03;graph[05][1][1]=5'd01;graph[05][2][1]=5'd02;
	graph[06][0][0]=5'd04;graph[06][1][0]=5'd05;graph[06][2][0]=5'd16;graph[06][3][0]=node_count;
	graph[06][0][1]=5'd03;graph[06][1][1]=5'd01;graph[06][2][1]=5'd03;
	graph[07][0][0]=5'd12;graph[07][1][0]=node_count;graph[07][2][0]=node_count;graph[07][3][0]=node_count;
	graph[07][0][1]=5'd02;
	graph[08][0][0]=5'd09;graph[08][1][0]=node_count;graph[08][2][0]=node_count;graph[08][3][0]=node_count;
	graph[08][0][1]=5'd01;
	graph[09][0][0]=5'd05;graph[09][1][0]=5'd08;graph[09][2][0]=5'd15;graph[09][3][0]=node_count;
	graph[09][0][1]=5'd02;graph[09][1][1]=5'd01;graph[09][2][1]=5'd01;
	graph[10][0][0]=5'd16;graph[10][1][0]=node_count;graph[10][2][0]=node_count;graph[10][3][0]=node_count;
	graph[10][0][1]=5'd02;
	graph[11][0][0]=5'd12;graph[11][1][0]=node_count;graph[11][2][0]=node_count;graph[11][3][0]=node_count;
	graph[11][0][1]=5'd03;
	graph[12][0][0]=5'd07;graph[12][1][0]=5'd11;graph[12][2][0]=5'd13;graph[12][3][0]=5'd17;
	graph[12][0][1]=5'd02;graph[12][1][1]=5'd03;graph[12][2][1]=5'd01;graph[12][3][1]=5'd03;
	graph[13][0][0]=5'd01;graph[13][1][0]=5'd12;graph[13][2][0]=5'd18;graph[13][3][0]=node_count;
	graph[13][0][1]=5'd03;graph[13][1][1]=5'd01;graph[13][2][1]=5'd02;
	graph[14][0][0]=5'd15;graph[14][1][0]=node_count;graph[14][2][0]=node_count;graph[14][3][0]=node_count;
	graph[14][0][1]=5'd01;
	graph[15][0][0]=5'd09;graph[15][1][0]=5'd14;graph[15][2][0]=5'd22;graph[15][3][0]=node_count;
	graph[15][0][1]=5'd01;graph[15][1][1]=5'd01;graph[15][2][1]=5'd01;
	graph[16][0][0]=5'd06;graph[16][1][0]=5'd10;graph[16][2][0]=5'd23;graph[16][3][0]=node_count;
	graph[16][0][1]=5'd03;graph[16][1][1]=5'd02;graph[16][2][1]=5'd02;
	graph[17][0][0]=5'd12;graph[17][1][0]=node_count;graph[17][2][0]=node_count;graph[17][3][0]=node_count;
	graph[17][0][1]=5'd03;
	graph[18][0][0]=5'd13;graph[18][1][0]=5'd19;graph[18][2][0]=5'd20;graph[18][3][0]=node_count;
	graph[18][0][1]=5'd02;graph[18][1][1]=5'd01;graph[18][2][1]=5'd01;
	graph[19][0][0]=5'd18;graph[19][1][0]=node_count;graph[19][2][0]=node_count;graph[19][3][0]=node_count;
	graph[19][0][1]=5'd01;
	graph[20][0][0]=5'd18;graph[20][1][0]=5'd21;graph[20][2][0]=5'd22;graph[20][3][0]=node_count;
	graph[20][0][1]=5'd01;graph[20][1][1]=5'd01;graph[20][2][1]=5'd02;
	graph[21][0][0]=5'd20;graph[21][1][0]=node_count;graph[21][2][0]=node_count;graph[21][3][0]=node_count;
	graph[21][0][1]=5'd01;
	graph[22][0][0]=5'd15;graph[22][1][0]=5'd20;graph[22][2][0]=5'd23;graph[22][3][0]=5'd25;
	graph[22][0][1]=5'd01;graph[22][1][1]=5'd02;graph[22][2][1]=5'd01;graph[22][3][1]=5'd03;
	graph[23][0][0]=5'd16;graph[23][1][0]=5'd22;graph[23][2][0]=5'd24;graph[23][3][0]=node_count;
	graph[23][0][1]=5'd02;graph[23][1][1]=5'd01;graph[23][2][1]=5'd02;
	graph[24][0][0]=5'd23;graph[24][1][0]=node_count;graph[24][2][0]=node_count;graph[24][3][0]=node_count;
	graph[24][0][1]=5'd02;
	graph[25][0][0]=5'd22;graph[25][1][0]=node_count;graph[25][2][0]=node_count;graph[25][3][0]=node_count;
	graph[25][0][1]=5'd03;
end

reg [4:0] dist_prev[0:node_count][0:1];reg [4:0] adj;reg [4:0] w;
reg visited[0:node_count];
integer pos;reg [4:0] queue[0:node_count][0:1];reg queue_top_done=1'd0;reg [4:0] d=5'd31;reg [4:0] top;
integer i=0;integer j;integer count=0;
reg start_process=1'd0;reg reset_single_done=1'd0;reg reset_many_done=1'd0;
always @(negedge clk)begin
	if(done==1'd1 && start==1'd1)
		done=1'd0;
	else if(done==1'd0 && start==1'd0 && start_process==1'd0)
		start_process=1'd1;
	if(start_process==1'd1)begin
		if(reset_single_done==1'd0)begin
			pos=0;d=5'd31;
			queue[0][0]=s_node;queue[0][1]=5'd0;
			reset_single_done=1'd1;
		end
		else if(reset_many_done==1'd0)begin
			dist_prev[i][0]=5'd31;dist_prev[i][1]=node_count;
			visited[i]=1'd0;
			i=i+1;
			if(i>node_count)begin
				i=0;
				dist_prev[s_node][0]=5'd0;
				reset_many_done=1'd1;
			end
		end
		else if(pos>-1)begin
			if(queue_top_done==1'd0)begin
				if(d>queue[i][1])begin
					d=queue[i][1];
					top=queue[i][0];
					j=i;
				end
				i=i+1;
				if(i>pos) begin
					i=0;d=5'd31;
					queue[j][0]=queue[pos][0];queue[j][1]=queue[pos][1];
					queue_top_done=1'd1;
				end
			end
			else if(visited[top]==1'd0)begin
				pos=pos-1;
				if(graph[top][0][0]!=node_count)begin
					adj=graph[top][0][0];
					w=graph[top][0][1];
					if(dist_prev[top][0]+w<dist_prev[adj][0])begin
						dist_prev[adj][0]=dist_prev[top][0]+w;
						dist_prev[adj][1]=top;
						pos=pos+1;
						queue[pos][0]=adj;
						queue[pos][1]=dist_prev[adj][0];
					end
				end
				if(graph[top][1][0]!=node_count)begin
					adj=graph[top][1][0];
					w=graph[top][1][1];
					if(dist_prev[top][0]+w<dist_prev[adj][0])begin
						dist_prev[adj][0]=dist_prev[top][0]+w;
						dist_prev[adj][1]=top;
						pos=pos+1;
						queue[pos][0]=adj;
						queue[pos][1]=dist_prev[adj][0];
					end
				end
				if(graph[top][2][0]!=node_count)begin
					adj=graph[top][2][0];
					w=graph[top][2][1];
					if(dist_prev[top][0]+w<dist_prev[adj][0])begin
						dist_prev[adj][0]=dist_prev[top][0]+w;
						dist_prev[adj][1]=top;
						pos=pos+1;
						queue[pos][0]=adj;
						queue[pos][1]=dist_prev[adj][0];
					end
				end
				if(graph[top][3][0]!=node_count)begin
					adj=graph[top][3][0];
					w=graph[top][3][1];
					if(dist_prev[top][0]+w<dist_prev[adj][0])begin
						dist_prev[adj][0]=dist_prev[top][0]+w;
						dist_prev[adj][1]=top;
						pos=pos+1;
						queue[pos][0]=adj;
						queue[pos][1]=dist_prev[adj][0];
					end
				end
				visited[top]=1'd1;
				queue_top_done=1'd0;
			end
			else begin
				pos=pos-1;
				visited[top]=1'd1;
				queue_top_done=1'd0;
			end
		end
		if(count==1400)begin
			final_path[04:00]=e_node;
			final_path[09:05]=dist_prev[final_path[04:00]][1];
			final_path[14:10]=dist_prev[final_path[09:05]][1];
			final_path[19:15]=dist_prev[final_path[14:10]][1];
			final_path[24:20]=dist_prev[final_path[19:15]][1];
			final_path[29:25]=dist_prev[final_path[24:20]][1];
			final_path[34:30]=dist_prev[final_path[29:25]][1];
			final_path[39:35]=dist_prev[final_path[34:30]][1];
			final_path[44:40]=dist_prev[final_path[39:35]][1];
			final_path[49:45]=dist_prev[final_path[44:40]][1];
			done=1'd1;
			start_process=1'd0;reset_single_done=1'd0;reset_many_done=1'd0;
			i=0;count=-1;
		end
		count=count+1;
	end
end

////////////////////////YOUR CODE ENDS HERE//////////////////////////
endmodule
///////////////////////////////MODULE ENDS///////////////////////////