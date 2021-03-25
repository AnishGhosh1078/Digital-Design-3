library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;		

entity seg_ctrl is
  port(
    gclk     : in  STD_LOGIC;                    -- Global clock input, 50MHz
    rst      : in  STD_LOGIC;                    -- Global reset input
    switches : in STD_LOGIC_VECTOR(7 downto 0);  -- Input switches
    segments : out STD_LOGIC_VECTOR(6 downto 0); -- Segment control
    an_sel   : out STD_LOGIC_VECTOR(3 downto 0)  -- Anode control
    );
end seg_ctrl;

architecture rtl of seg_ctrl is

  -- A 15 bit counter
  signal count : unsigned(14 downto 0);
  signal position : unsigned(1 downto 0);
  -- Storing variables
  signal sumlr : unsigned (7 downto 0);
  signal digit1 : unsigned (3 downto 0);
 
 begin 
  -- Clock divider
  process (gclk, rst)
  begin
    if gclk='1' and gclk'event then
      if rst='1' then                   
         count <= (others=>'0');     --   asynchronous reset
      else
         count <= count+1;
      end if;
	end if;
  end process;	
	
  -- Anode decode circuitry
  position <= count(14 downto 13);

  with position select
  an_sel <= --anodes are low asserted
    "0111" when "00",
    "1011" when "01",
    "1101" when "10",
    "1110" when others;

	with position select 
	digit1 <= -- this part was fixed by looking at the output on the FPGA board and changing order
	sumlr(7 downto 4) when "00",
	sumlr(3 downto 0) when "01",
	unsigned(switches(7 downto 4)) when "10",
	unsigned(switches(3 downto 0)) when others;

	with digit1 select --select segments to be lit up with each value (hard coded)
  
  segments <= "0000001" when "0000",
				  "1001111" when "0001",
				  "0010010" when "0010",
				  "0000110" when "0011",
				  "1001100" when "0100",
				  "0100100" when "0101",
				  "0100000" when "0110",
				  "0001111" when "0111",
				  "0000000" when "1000",
				  "0000100" when "1001",
				  "0001000" when "1010",
				  "1100000" when "1011",
				  "0110001" when "1100",
				  "1000010" when "1101",
				  "0110000" when "1110",
				  "0111000" when others;
				  

  process(switches(3 downto 0), switches(7 downto 4)) -- sum process
  begin
  sumlr <= ("0000" & unsigned(switches(3 downto 0)))+("0000" & unsigned(switches(7 downto 4)));
  
  end process;

end rtl;
