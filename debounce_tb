module debounce_tb;

  reg clk;
  reg reset;
  reg sw;
  wire db;

  integer i;
  debounce DUT (
    .clk(clk),
    .reset(reset),
    .sw(sw),
    .db(db)
  );

  always begin
    #5 clk = ~clk;
  end

  initial begin
    clk = 0;
    sw = 0;
    #10 reset = 0;
    #10 reset=1;
    #10 reset=0;

   for (i= 0; i <= 15; i = i + 1)
   begin
      // Apply sw and/or reset as needed to transition
      case (i)
        0: begin
          sw = 1;
          #10 sw = 0;
        end // zero -> wait1_1
        1: begin
          sw = 0;
          #10 sw = 1;
        end // wait1_1 -> zero
        2: begin
          sw = 1;
          #10 sw = 0;
        end // wait1_1 -> wait1_2
        3: begin
          sw = 0;
          #10 sw = 1;
        end // wait1_2 -> zero
        4: begin
          sw = 1;
          #10 sw = 0;
        end // wait1_2 -> wait1_3
        5: begin
          sw = 0;
          #10 sw = 1;
        end // wait1_3 -> zero
        6: begin
          sw = 1;
          #10 sw = 0;
        end // wait1_3 -> one
        7: begin
          sw = ~sw; // Simulate switch bounce
          #5 sw = ~sw;
          #5 reset=1; // Simultaneous switch bounce and reset
          #10 reset=0;
        end// one -> zero
        // Repeat the above steps with different timing to cover more cases.
        // ...
      endcase
    end

    $finish;
  end

always @(posedge clk)
begin
$display("db = %b", db);
end

endmodule
