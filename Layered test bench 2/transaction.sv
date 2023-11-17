class transaction;
	rand bit sw;
	bit db;
	
	function void display();
	$display("#################@@@@@@@@@################");
	$display("\t sw=%0b",sw);
	$display("\t db=%0b",db);
	$display("#################@@@@@@@@@################");
	endfunction
	
endclass 