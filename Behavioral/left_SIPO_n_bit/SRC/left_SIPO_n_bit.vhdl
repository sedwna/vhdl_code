LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY left_SIPO_n_bit IS
    GENERIC (size : INTEGER := 4);
    PORT (
        clk, rst, en, si : IN STD_LOGIC;
        d_out : OUT STD_LOGIC_VECTOR(size - 1 DOWNTO 0)
    );
END left_SIPO_n_bit;

ARCHITECTURE behavioral OF left_SIPO_n_bit IS

    SIGNAL zero : STD_LOGIC_VECTOR(size - 1 DOWNTO 0) := (OTHERS => '0');
    SIGNAL temp : STD_LOGIC_VECTOR(size - 1 DOWNTO 0);

BEGIN
    PROCESS (clk)
    BEGIN
        IF (clk = '1' AND clk'event) THEN -- positive edge
            IF (rst = '1') THEN
                temp <= zero;
            ELSIF (en = '1') THEN
                temp <= temp(size - 2 DOWNTO 0) & si;
            END IF;
        END IF;
    END PROCESS;
    d_out <= temp;

END behavioral;