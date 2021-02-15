library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RNG is
       Port(clk : IN STD_LOGIC;
		      Q   : OUT STD_LOGIC_VECTOR(7 downto 0));		 

end RNG;


architecture Behavioral of RNG is

component D_FF
    Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : inout  STD_LOGIC);
			  
end component;


component XOR_Gate
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Z : out  STD_LOGIC);
			  
end component;

signal s : STD_LOGIC_VECTOR(7 downto 0) := "10001100";
signal temp : STD_LOGIC;

begin

     L1 : XOR_Gate port map(s(7),s(0),temp);
	  
	  G1 : for k in 7 downto 1 generate
				
				 GK : D_FF port map(s(k),clk,s(k-1));
				 
			   end generate G1;
			 
     L2 : D_FF port map(temp,clk,s(7));
	  
	 -- Q <= s;
	  
	  
end Behavioral;


