class environment;

	generator gen;
	driver driv;
	mailbox gen2driv;
	
	event ended;
	virtual intf vif;
	
	
	function new (virtual intf vif);
		this.vif=vif;
		gen2driv=new();
		gen=new(gen2driv,ended);
		driv=new(vif,gen2driv);
		//cov=new();
	endfunction
	
	task pre_test;
		driv.reset();
	endtask
	
	task test;
		fork
		gen.main();
		driv.main();
		join_any;
		
	endtask
	
	task post_test;
		wait(ended.triggered);
		wait(gen.repeat_count==driv.no_transactions);
	endtask
	
	task run;
		pre_test();
		test();
		post_test();
		$finish;
	endtask
	
endclass
