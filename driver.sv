class driver;

	int no_transactions;
	virtual intf vif;
	mailbox gen2driv;
	
	function new(virtual intf vif,mailbox gen2driv);
		this.vif=vif;
		this.gen2driv=gen2driv;
	endfunction
	
	task reset;
		wait(vif.reset);
		$display("resetting");
		vif.sw<=0;
		wait(!vif.reset);
		$display("Done resetting");
	endtask
	
	task main;
	
	forever begin 
		transaction trans;
		gen2driv.get(trans);
		$display("transaction no=%0d",no_transactions);
		vif.sw<=trans.sw;
		@(posedge vif.clk);
		trans.db=vif.db;
		trans.display("output");
		@(posedge vif.clk);
		no_transactions++;
	end 
	endtask
endclass
