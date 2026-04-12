-- Updated testbench.vhd with led signal as std_logic_vector(4 downto 0)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end entity testbench;

architecture behavior of testbench is

    -- Signal declarations
    signal clk : std_logic;
    signal rst : std_logic;
    signal led : std_logic_vector(4 downto 0); -- Changed to std_logic_vector

    -- Component declaration for led_light_up
    component led_light_up
        Port ( clk : in  std_logic;
               rst : in  std_logic;
               led : out  std_logic_vector(4 downto 0)); -- Changed to std_logic_vector
    end component;

begin
    -- Testbench process and stimulus generation
    -- ...

end architecture behavior;