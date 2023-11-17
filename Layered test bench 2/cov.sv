class debounce_cov;
	transaction trans=new();
	
	covergroup cov_inst;
	option.per_instance=1;
	SW:coverpoint trans.sw{bins sww={0,1};}
	DO:coverpoint trans.db {bins Do ={0,1};}
	endgroup
	
	function new();
		cov_inst=new;
	endfunction
	
	task main;
		cov_inst.sample();
	endtask
	
endclass 
