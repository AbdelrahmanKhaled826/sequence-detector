`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: abdelrahman khaled elsayed
// Create Date:    21:02:00 03/02/2023 
// Module Name:    pattern_detector_11010 
//////////////////////////////////////////////////////////////////////////////////
//11010
module pattern_detector(
    
input clk,
input reset,
input stream_in,
output  reg pattern_found

);

parameter [2:0]   	a=3'b0,
				b=3'b001,
	                  		c=3'b010,
				d=3'b011,
				e=3'b100,
				f=3'b101;
				
reg [2:0] next_state,curr_state;

//state register

always @(posedge clk)
begin
	if(reset)
	begin
		curr_state<=a;
	end else
	begin
		curr_state<=next_state;
	end
end

// This is for next state 

always@(curr_state,stream_in)
begin
	case(curr_state)
		a:begin
			if(stream_in==1)   next_state=b;
			else               next_state=a;
		end
		b:begin
			if(stream_in==1)   next_state=c;
			else               next_state=a;
		end
		c:begin
			if(stream_in==1)   next_state=c;
			else               next_state=d;
		end
		d:begin
			if(stream_in==1)   next_state=e;
			else               next_state=a;
		end
		e:begin
			if(stream_in==1)   next_state=c;
			else               next_state=f;
		end
		f:begin
			if(stream_in==1)   next_state=b;
			else               next_state=a;
		end
		
		default:next_state=a;
		


	endcase


end 


// This is for out (depond on state only)
always@(curr_state)
begin
	case(curr_state)
		a: pattern_found=0;
		b: pattern_found=0;
		c:pattern_found=0;
		d:pattern_found=0;
		e:pattern_found=0;
		f:pattern_found=1;
		default:pattern_found=0;
	endcase


end

			
endmodule


