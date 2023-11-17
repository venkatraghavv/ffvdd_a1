interface debounce_intf(input logic clk,reset);
	logic sw;
	logic db;
	
	clocking bfm_cb @(posedge clk);
		default input #1 output #1;
		input db;
		output sw;
	endclocking
	
	clocking monitor_cb @(posedge clk);
		default input #1 output #1;
		input sw;
		input db;
	endclocking
	
	modport BFM(clocking bfm_cb,input clk,reset);
	modport MONITOR(clocking monitor_cb,input clk,reset);
	
endinterface
