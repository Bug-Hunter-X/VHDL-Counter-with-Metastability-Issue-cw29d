```vhdl
entity counter is
  Port ( clk : in  STD_LOGIC;
              reset : in  STD_LOGIC;
              count : out  INTEGER range 0 to 15);
end entity;

architecture behavioral of counter is
  signal internal_count : INTEGER range 0 to 15 := 0;
  signal sync_reset : STD_LOGIC;
begin
  process (clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        sync_reset <= '1';
      else
        sync_reset <= '0';
      end if;
    end if;
  end process;

  process (clk, sync_reset)
  begin
    if sync_reset = '1' then
      internal_count <= 0;
    elsif rising_edge(clk) then
      internal_count <= internal_count + 1;
    end if;
  end process;
  count <= internal_count;
end architecture;
```