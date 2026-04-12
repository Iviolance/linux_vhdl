-- Testbench for basic verification of LED output behavior
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end entity testbench;

architecture tb of testbench is
    signal btn : std_logic := '0'; -- Button signal
    signal clk : std_logic := '0'; -- Clock signal
    signal led : std_logic; -- LED output
    constant clk_period : time := 10 ns; -- Clock period

begin
    -- Clock process
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    -- Button stimulus process
    stimulus : process
    begin
        -- Press button
        btn <= '1';
        wait for 20 ns;
        assert led = '1' report "Error: LED should be ON when button is pressed!" severity error;

        -- Release button
        btn <= '0';
        wait for 20 ns;
        assert led = '0' report "Error: LED should be OFF when button is released!" severity error;

        -- Test multiple patterns
        btn <= '1'; wait for 10 ns; btn <= '0'; wait for 10 ns; -- Press/Release
        btn <= '1'; wait for 10 ns; btn <= '0'; wait for 10 ns; -- Press/Release
        wait;
    end process;

    -- LED behavior analysis
    led_process : process(clk)
    begin
        if rising_edge(clk) then
            if btn = '1' then
                led <= '1';  -- Turn LED ON
            else
                led <= '0';  -- Turn LED OFF
            end if;
        end if;
    end process;

end architecture tb;