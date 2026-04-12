library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity testbench is
end testbench;

architecture behavior of testbench is

    component led_light_up
    port(
        clk : in std_logic;
        button : in std_logic;
        led : out std_logic
    );
    end component;

    signal clk : std_logic := '0';
    signal button : std_logic := '0';
    signal led : std_logic;

    constant clk_period : time := 10 ns;

begin

    uut: led_light_up port map (
        clk => clk,
        button => button,
        led => led
    );

    -- Clock generation
    clk_process :process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: Button pressed
        button <= '1';
        wait for 100 ns;
        
        -- Test case 2: Button released
        button <= '0';
        wait for 100 ns;

        -- Test case 3: Button pressed again
        button <= '1';
        wait for 100 ns;

        -- Test case 4: Continuous clock, button pressed
        button <= '1';
        wait for 200 ns;
        
        -- End of simulation
        wait;
    end process;

end behavior;