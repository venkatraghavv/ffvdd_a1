program test(intf vif);
	environment env;
	
	initial begin 
	env=new(vif);
	env.gen.repeat_count=200;
	env.run();
	end
	
endprogram
