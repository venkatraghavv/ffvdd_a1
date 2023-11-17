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
      case (i)
        0: begin
          sw = 1;
          #10 sw = 0;
        end 
        1: begin
          sw = 0;
          #10 sw = 1;
        end 
        2: begin
          sw = 1;
          #10 sw = 0;
        end 
        3: begin
          sw = 0;
          #10 sw = 1;
        end 
        4: begin
          sw = 1;
          #10 sw = 0;
        end 
        5: begin
          sw = 0;
          #10 sw = 1;
        end 
        6: begin
          sw = 1;
          #10 sw = 0;
        end 
        7: begin
          sw = ~sw; 
          #5 sw = ~sw;
          #5 reset=1; 
          #10 reset=0;
        end
      endcase
    end

    $finish;
  end

always @(posedge clk)
begin
$display("db = %b", db);
end

endmodule
