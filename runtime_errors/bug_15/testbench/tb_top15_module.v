`timescale 1ns/1ps
module tb_ring_oscillator;

    reg enable, ICE_CLK;
    wire ICE_LED, OUT;

    reg last_out;
    integer stable_cycles;

    ring_oscillator uut (
        .enable(enable),
        .ICE_CLK(ICE_CLK),
        .ICE_LED(ICE_LED),
        .OUT(OUT)
    );

    always #10 ICE_CLK = ~ICE_CLK;

    initial begin
        $display("Testbench started.");

        force uut.lut_ins[0] = 1'b1;
        #20;
        release uut.lut_ins[0];

        ICE_CLK = 0;
        enable = 1;

        stable_cycles = 0;
        last_out = OUT;
        #20;

        repeat (1000) begin
            #10;
            if (OUT === last_out)
                stable_cycles = stable_cycles + 1;
            else begin
                $display("Ring oscillator is toggling. OUT changed at time %0t ns", $time);
                $finish;
            end
            last_out = OUT;
        end

        $fatal("ERROR: Ring oscillator output (OUT) never toggled. Likely feedback wiring issue.");
    end
endmodule
