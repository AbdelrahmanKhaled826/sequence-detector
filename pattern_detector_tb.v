`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: abdelrahman khaled elsayed
// Create Date:    21:02:00 03/02/2023 
// Module Name:    pattern_detector
//////////////////////////////////////////////////////////////////////////////////

module pattern_detector_tb;
	// Inputs
	reg clk;
	reg reset;
	reg stream_in;

	// Outputs
	wire pattern_found;

	// Instantiate the Unit Under Test (UUT)
	pattern_detector  uut (
		.clk(clk), 
		.reset(reset), 
		.stream_in(stream_in), 
		.pattern_found(pattern_found)
	);
	initial begin clk = 1'b0;
	end
always #5   clk=~clk;

     initial
  //00 11010 11010  00110 11010    011010   pattren_found must be high in four times
      begin
      reset=1;
      #(10) reset=0;
      stream_in=0;
      #(20) stream_in=1;
      #(20) stream_in=0;
      #(10) stream_in=1;
      #(10) stream_in=0;
      #(10) stream_in=1;
      #(20) stream_in=0;
      #(10) stream_in=1;
      #(10) stream_in=0;
       #(30) stream_in=1;
      #(20) stream_in=0;
      #(10)   stream_in=1;
      #(20) stream_in=0;
       #(10) stream_in=1;
      #(10) stream_in=0;
       #(20) stream_in=1;
        #(20) stream_in=0;
      #(10) stream_in=1;
      #(10) stream_in=0;
    
    
      end
      
endmodule

