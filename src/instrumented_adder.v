`default_nettype none
module instrumented_adder(

    input wire [7:0] input_a,
    input wire [7:0] xor_enable,
    input wire [7:0] add_enable,
    output wire [7:0] outputs,

);

    wire input_b [7:0];
    wire sum_output [7:0];

    adder sklansky (
        .a(input_a),
        .b(input_b),
        .sum(sum_output)
        );

    
    wire [7:0] mux_input_a = inverter_loop;
    wire [7:0] mux_output = add_enable ? sum_output : inverter_loop;
    wire [7:0] inverter_loop;

    (* keep *) assign inverter_loop = !!!!outputs;
    assign outputs = mux_output ^ xor_enable;
    assign input_b = inverter_loop;
    
endmodule