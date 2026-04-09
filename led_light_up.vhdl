library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity led_light_up is
    Port ( clk : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR(4 DOWNTO 0);
           button : in STD_LOGIC);
end led_light_up;

architecture Behavioral of led_light_up is
    signal debounced : STD_LOGIC := '0';
    signal toggle_state : STD_LOGIC := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if button = '1' then
                debounced <= '1';
            else
                if debounced = '1' then
                    toggle_state <= not toggle_state;
                    debounced <= '0';
                end if;
            end if;
        end if;
    end process;

    with toggle_state select
        led <= "00000" when '0',
               "11111" when '1',
               "00000" when others;
end Behavioral;