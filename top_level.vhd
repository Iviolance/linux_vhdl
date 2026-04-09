library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
    Port ( clk : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR(4 DOWNTO 0);
           button : in STD_LOGIC);
end top_level;

architecture Behavioral of top_level is
    component led_light_up
        Port ( clk : in STD_LOGIC;
                led : out STD_LOGIC_VECTOR(4 DOWNTO 0);
                button : in STD_LOGIC);
        end component;

begin

    inst: led_light_up 
        port map (clk => clk,
                  led => led,
                  button => button);

end Behavioral;