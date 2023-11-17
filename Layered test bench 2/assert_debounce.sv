module assert_debounce(intf vif);
//A1:assert property (@(posedge vif.clk) |=> (!m_tick) -> $stable(m_tick));

//A2:assert property (@(posedge vif.clk) |=> (vif.sw && !m_tick) -> !vif.db);

//A3:cover property (@(posedge vif.clk) |=> (vif.db == 1) -> $stable(vif.sw));

//A4:assert property (@(posedge vif.clk) $fell(vif.clk));

/*A5:always @(posedge vif.clk)
    assert property (@(posedge vif.clk) $rose(vif.reset) |-> (state_reg == zero));
*/
/*A6:always @(posedge vif.clk)
    if (state_reg == one)
        assert property (@(posedge vif.clk) disable iff(vif.reset) (vif.sw == vif.db));*/

/*A7:always @(posedge vif.clk)
    if (!$fell(vif.reset))
        assert property (@(posedge vif.clk) (state_next == state_reg) |-> $rose(m_tick));*/
//A8:assert property (@(posedge vif.clk) disable iff (vif.reset) ((vif.sw == 1'b1) |-> ##[1:$] (vif.db == 1'b1) && $stable(vif.sw)));
A9:cover property (@(posedge vif.clk) $fell(vif.clk));
		
endmodule 		
