module testbench_top;

	bit clk;
	bit reset;

	debounce_intf intf(clk,reset);
	test t1(intf);
	debounce dut(.clk(intf.clk),.reset(intf.reset),.sw(intf.sw),.db(intf.db));
	assert_debounce adebounce(intf);
	always #10 clk=~clk;
	
	initial begin 
	reset=1;
	#10 reset=0;
	end 
	

	
endmodule 
