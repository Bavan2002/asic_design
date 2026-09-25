module button_fsm(
    input clk,
    input reset,
    input press_button,
    output en_button
    );
    
    parameter   IDLE    =   2'b00   ;
    parameter   ST0     =   2'b01   ;
    parameter   ST1     =   2'b11   ;
    
    reg   [1:0]     c_state ;
    reg   [1:0]     n_state ;
    reg   [3:0]       count   ;
    reg   [6:0]     SSG_D   ;
	
// The following describes an FSM that detect a button is pushed and released. 
// After the detection of such events, the FSM output becomes 1 for one clock cycle
// The FSM output is used as the counter enable signal
 
 //logic to determine next state
    always@(*)begin
    case(c_state)
    IDLE:   if(press_button == 1'b1)
            n_state = ST0   ;
            else 
            n_state = IDLE   ;
    ST0:    if(press_button == 1'b0)
            n_state = ST1   ;
            else 
            n_state = ST0   ;
    ST1:    n_state = IDLE  ;   //output state
    default: n_state = IDLE ;      
    endcase
    end
    
  //update state registers 
    always@(posedge clk or posedge reset)
    if(reset)
         c_state  <=  IDLE    ;
    else 
         c_state <=  n_state ;
 
  // FSM output
  assign  en_button = (c_state == ST1)? 1'b1  : 1'b0;  
  
endmodule