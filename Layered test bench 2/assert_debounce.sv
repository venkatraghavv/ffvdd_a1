module assert_debounce(intf vif);

A9:cover property (@(posedge vif.clk) $fell(vif.clk));
		
endmodule 		
