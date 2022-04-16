module ex3(
    output reg o_r_AN0,
    output reg o_r_AN1,
    output reg o_r_AN2,
    output reg o_r_AN3,
    output reg CA,
    output reg CB,
    output reg CC,
    output reg CD,
    output reg CE,
    output reg CF,
    output reg CG,
    output reg DP,
    input      button,
    input      reset,
    input      clk
    );
 
    localparam STATE_0 = 0;
    localparam STATE_1 = 1;
    localparam STATE_2 = 2;
    localparam STATE_3 = 3;
 
    reg [31:0] l_r_delay;
 
    reg [15:0] l_r_count;
 
 
 
     reg [1:0]   currentState;
    reg [1:0]   nextState;
 
    reg [15:0]  delay;
 
    reg [15:0]  count;
    reg         button_pressed;
    wire        button_debounced;
 
    debouncer db(button_debounced, clk, reset, button);
 
    always @(posedge clk) begin
        if (reset) begin
            currentState <= STATE_0;
            delay <= 0;
            count <= 0;
            button_pressed <= 0;
        end else begin
            if (button_debounced) begin
                if (!button_pressed) begin
                    count <= count + 1;
                    if (count > 9999) begin
                        count <= 0;
                    end
 
                    button_pressed <= 1;
                end
            end else begin
                button_pressed <= 0;
            end
 
            // Prevent bleeding effect.
            delay <= delay + 1;
            if (delay == 1000) begin
                currentState <= nextState;
            end
        end
	end
 
    always @(*) begin
        case (currentState)
            STATE_3: begin
							 o_r_AN3 = 1;
							 o_r_AN1 = 1;
							 o_r_AN2 = 1;
							 o_r_AN0 = 0;
							 nextState = 2;
 
							 display (count / 1000);
							end
				STATE_2: begin
							 o_r_AN3 = 1;
							 o_r_AN1 = 0;
							 o_r_AN2 = 1;
							 o_r_AN0 = 1;
 
							 nextState = 1;
 
 
					display ((count / 100) % 10);
							end
				STATE_1: begin
							 o_r_AN3 = 1;
							 o_r_AN1 = 1;
							 o_r_AN2 = 0;
							 o_r_AN0 = 1;
 
							 nextState = 0;
 
							 display ((count / 10) % 10);
							end
				STATE_0: begin
							 o_r_AN3 = 0;
							 o_r_AN1 = 1;
							 o_r_AN2 = 1;
							 o_r_AN0 = 1;
 
							 nextState = 3;
 
							 display (count % 10);
							end
        endcase
    end
 
	 task display;
        input   [15:0]  number;
        begin
            case (number)
                0: begin
                    CA = 0;
                    CB = 0;
                    CC = 0;
                    CD = 0;
                    CE = 0;
                    CF = 0;
                    CG = 1;
                    DP = 1;
                end
 
                1: begin
                    CA = 1;
                    CB = 0;
                    CC = 0;
                    CD = 1;
                    CE = 1;
                    CF = 1;
                    CG = 1;
                    DP = 1;
                end
 
                2: begin
                    CA = 0;
                    CB = 0;
                    CC = 1;
                    CD = 0;
                    CE = 0;
                    CF = 1;
                    CG = 0;
                    DP = 1;
                end
 
                3: begin
                    CA = 0;
                    CB = 0;
                    CC = 0;
                    CD = 0;
                    CE = 1;
                    CF = 1;
                    CG = 0;
                    DP = 1;
                end
 
                4: begin
                    CA = 1;
                    CB = 0;
                    CC = 0;
                    CD = 1;
                    CE = 1;
                    CF = 0;
                    CG = 0;
                    DP = 1;
                end
 
                5: begin
                    CA = 0;
                    CB = 1;
                    CC = 0;
                    CD = 0;
                    CE = 1;
                    CF = 0;
                    CG = 0;
                    DP = 1;
                end
 
                6: begin
                    CA = 0;
                    CB = 1;
                    CC = 0;
                    CD = 0;
                    CE = 0;
                    CF = 0;
                    CG = 0;
                    DP = 1;
                end
 
                7: begin
                    CA = 0;
                    CB = 0;
                    CC = 0;
                    CD = 1;
                    CE = 1;
                    CF = 1;
                    CG = 1;
                    DP = 1;
                end
 
                8: begin
                    CA = 0;
                    CB = 0;
                    CC = 0;
                    CD = 0;
                    CE = 0;
                    CF = 0;
                    CG = 0;
                    DP = 1;
                end
 
                9: begin
                    CA = 0;
                    CB = 0;
                    CC = 0;
                    CD = 0;
                    CE = 1;
                    CF = 0;
                    CG = 0;
                    DP = 1;
                end
 
                default: begin
                    CA = 1;
                    CB = 1;
                    CC = 1;
                    CD = 1;
                    CE = 1;
                    CF = 1;
                    CG = 1;
                    DP = 1;
                end
            endcase
			end
	endtask
endmodule
 