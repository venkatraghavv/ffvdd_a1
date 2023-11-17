module testbench_top;

	bit clk;
	bit reset;
	
	always #10 clk=~clk;
	
	initial begin 
	reset=1;
	#10 reset=0;
	end 
	
	intf vif(clk,reset);
	test t1(vif);
	debounce dut(.clk(vif.clk),.reset(vif.reset),.sw(vif.sw),.db(vif.db));
	assert_debounce adebounce(vif);
	
endmodule 
