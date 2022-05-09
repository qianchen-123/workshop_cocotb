-- Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
-- Component : Apb3Timer
-- Git hash  : 89d7543c7219f82d1991c9174f1b313aba4435ca

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is

end pkg_enum;

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package pkg_scala2hdl is
  function pkg_extract (that : std_logic_vector; bitId : integer) return std_logic;
  function pkg_extract (that : std_logic_vector; base : unsigned; size : integer) return std_logic_vector;
  function pkg_cat (a : std_logic_vector; b : std_logic_vector) return std_logic_vector;
  function pkg_not (value : std_logic_vector) return std_logic_vector;
  function pkg_extract (that : unsigned; bitId : integer) return std_logic;
  function pkg_extract (that : unsigned; base : unsigned; size : integer) return unsigned;
  function pkg_cat (a : unsigned; b : unsigned) return unsigned;
  function pkg_not (value : unsigned) return unsigned;
  function pkg_extract (that : signed; bitId : integer) return std_logic;
  function pkg_extract (that : signed; base : unsigned; size : integer) return signed;
  function pkg_cat (a : signed; b : signed) return signed;
  function pkg_not (value : signed) return signed;

  function pkg_mux (sel : std_logic; one : std_logic; zero : std_logic) return std_logic;
  function pkg_mux (sel : std_logic; one : std_logic_vector; zero : std_logic_vector) return std_logic_vector;
  function pkg_mux (sel : std_logic; one : unsigned; zero : unsigned) return unsigned;
  function pkg_mux (sel : std_logic; one : signed; zero : signed) return signed;

  function pkg_toStdLogic (value : boolean) return std_logic;
  function pkg_toStdLogicVector (value : std_logic) return std_logic_vector;
  function pkg_toUnsigned (value : std_logic) return unsigned;
  function pkg_toSigned (value : std_logic) return signed;
  function pkg_stdLogicVector (lit : std_logic_vector) return std_logic_vector;
  function pkg_unsigned (lit : unsigned) return unsigned;
  function pkg_signed (lit : signed) return signed;

  function pkg_resize (that : std_logic_vector; width : integer) return std_logic_vector;
  function pkg_resize (that : unsigned; width : integer) return unsigned;
  function pkg_resize (that : signed; width : integer) return signed;

  function pkg_extract (that : std_logic_vector; high : integer; low : integer) return std_logic_vector;
  function pkg_extract (that : unsigned; high : integer; low : integer) return unsigned;
  function pkg_extract (that : signed; high : integer; low : integer) return signed;

  function pkg_shiftRight (that : std_logic_vector; size : natural) return std_logic_vector;
  function pkg_shiftRight (that : std_logic_vector; size : unsigned) return std_logic_vector;
  function pkg_shiftLeft (that : std_logic_vector; size : natural) return std_logic_vector;
  function pkg_shiftLeft (that : std_logic_vector; size : unsigned) return std_logic_vector;

  function pkg_shiftRight (that : unsigned; size : natural) return unsigned;
  function pkg_shiftRight (that : unsigned; size : unsigned) return unsigned;
  function pkg_shiftLeft (that : unsigned; size : natural) return unsigned;
  function pkg_shiftLeft (that : unsigned; size : unsigned) return unsigned;

  function pkg_shiftRight (that : signed; size : natural) return signed;
  function pkg_shiftRight (that : signed; size : unsigned) return signed;
  function pkg_shiftLeft (that : signed; size : natural) return signed;
  function pkg_shiftLeft (that : signed; size : unsigned; w : integer) return signed;

  function pkg_rotateLeft (that : std_logic_vector; size : unsigned) return std_logic_vector;
end  pkg_scala2hdl;

package body pkg_scala2hdl is
  function pkg_extract (that : std_logic_vector; bitId : integer) return std_logic is
    alias temp : std_logic_vector(that'length-1 downto 0) is that;
  begin
    if bitId >= temp'length then
      return 'U';
    end if;
    return temp(bitId);
  end pkg_extract;

  function pkg_extract (that : std_logic_vector; base : unsigned; size : integer) return std_logic_vector is
    alias temp : std_logic_vector(that'length-1 downto 0) is that;    constant elementCount : integer := temp'length - size + 1;
    type tableType is array (0 to elementCount-1) of std_logic_vector(size-1 downto 0);
    variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := temp(i + size - 1 downto i);
    end loop;
    if base + size >= elementCount then
      return (size-1 downto 0 => 'U');
    end if;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : std_logic_vector; b : std_logic_vector) return std_logic_vector is
    variable cat : std_logic_vector(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : std_logic_vector) return std_logic_vector is
    variable ret : std_logic_vector(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;

  function pkg_extract (that : unsigned; bitId : integer) return std_logic is
    alias temp : unsigned(that'length-1 downto 0) is that;
  begin
    if bitId >= temp'length then
      return 'U';
    end if;
    return temp(bitId);
  end pkg_extract;

  function pkg_extract (that : unsigned; base : unsigned; size : integer) return unsigned is
    alias temp : unsigned(that'length-1 downto 0) is that;    constant elementCount : integer := temp'length - size + 1;
    type tableType is array (0 to elementCount-1) of unsigned(size-1 downto 0);
    variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := temp(i + size - 1 downto i);
    end loop;
    if base + size >= elementCount then
      return (size-1 downto 0 => 'U');
    end if;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : unsigned; b : unsigned) return unsigned is
    variable cat : unsigned(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : unsigned) return unsigned is
    variable ret : unsigned(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;

  function pkg_extract (that : signed; bitId : integer) return std_logic is
    alias temp : signed(that'length-1 downto 0) is that;
  begin
    if bitId >= temp'length then
      return 'U';
    end if;
    return temp(bitId);
  end pkg_extract;

  function pkg_extract (that : signed; base : unsigned; size : integer) return signed is
    alias temp : signed(that'length-1 downto 0) is that;    constant elementCount : integer := temp'length - size + 1;
    type tableType is array (0 to elementCount-1) of signed(size-1 downto 0);
    variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := temp(i + size - 1 downto i);
    end loop;
    if base + size >= elementCount then
      return (size-1 downto 0 => 'U');
    end if;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : signed; b : signed) return signed is
    variable cat : signed(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : signed) return signed is
    variable ret : signed(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;


  -- unsigned shifts
  function pkg_shiftRight (that : unsigned; size : natural) return unsigned is
    variable ret : unsigned(that'length-1 downto 0);
  begin
    if size >= that'length then
      return "";
    else
      ret := shift_right(that,size);
      return ret(that'length-1-size downto 0);
    end if;
  end pkg_shiftRight;

  function pkg_shiftRight (that : unsigned; size : unsigned) return unsigned is
    variable ret : unsigned(that'length-1 downto 0);
  begin
    ret := shift_right(that,to_integer(size));
    return ret;
  end pkg_shiftRight;

  function pkg_shiftLeft (that : unsigned; size : natural) return unsigned is
  begin
    return shift_left(resize(that,that'length + size),size);
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : unsigned; size : unsigned) return unsigned is
  begin
    return shift_left(resize(that,that'length + 2**size'length - 1),to_integer(size));
  end pkg_shiftLeft;

  -- std_logic_vector shifts
  function pkg_shiftRight (that : std_logic_vector; size : natural) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftRight (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : std_logic_vector; size : natural) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  -- signed shifts
  function pkg_shiftRight (that : signed; size : natural) return signed is
  begin
    return signed(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftRight (that : signed; size : unsigned) return signed is
  begin
    return shift_right(that,to_integer(size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : signed; size : natural) return signed is
  begin
    return signed(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : signed; size : unsigned; w : integer) return signed is
  begin
    return shift_left(resize(that,w),to_integer(size));
  end pkg_shiftLeft;

  function pkg_rotateLeft (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(rotate_left(unsigned(that),to_integer(size)));
  end pkg_rotateLeft;

  function pkg_extract (that : std_logic_vector; high : integer; low : integer) return std_logic_vector is
    alias temp : std_logic_vector(that'length-1 downto 0) is that;
  begin
    return temp(high downto low);
  end pkg_extract;

  function pkg_extract (that : unsigned; high : integer; low : integer) return unsigned is
    alias temp : unsigned(that'length-1 downto 0) is that;
  begin
    return temp(high downto low);
  end pkg_extract;

  function pkg_extract (that : signed; high : integer; low : integer) return signed is
    alias temp : signed(that'length-1 downto 0) is that;
  begin
    return temp(high downto low);
  end pkg_extract;

  function pkg_mux (sel : std_logic; one : std_logic; zero : std_logic) return std_logic is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : std_logic_vector; zero : std_logic_vector) return std_logic_vector is
    variable ret : std_logic_vector(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : unsigned; zero : unsigned) return unsigned is
    variable ret : unsigned(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : signed; zero : signed) return signed is
    variable ret : signed(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_toStdLogic (value : boolean) return std_logic is
  begin
    if value = true then
      return '1';
    else
      return '0';
    end if;
  end pkg_toStdLogic;

  function pkg_toStdLogicVector (value : std_logic) return std_logic_vector is
    variable ret : std_logic_vector(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toStdLogicVector;

  function pkg_toUnsigned (value : std_logic) return unsigned is
    variable ret : unsigned(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toUnsigned;

  function pkg_toSigned (value : std_logic) return signed is
    variable ret : signed(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toSigned;

  function pkg_stdLogicVector (lit : std_logic_vector) return std_logic_vector is
    alias ret : std_logic_vector(lit'length-1 downto 0) is lit;
  begin
    return ret;
  end pkg_stdLogicVector;

  function pkg_unsigned (lit : unsigned) return unsigned is
    alias ret : unsigned(lit'length-1 downto 0) is lit;
  begin
    return ret;
  end pkg_unsigned;

  function pkg_signed (lit : signed) return signed is
    alias ret : signed(lit'length-1 downto 0) is lit;
  begin
    return ret;
  end pkg_signed;

  function pkg_resize (that : std_logic_vector; width : integer) return std_logic_vector is
  begin
    return std_logic_vector(resize(unsigned(that),width));
  end pkg_resize;

  function pkg_resize (that : unsigned; width : integer) return unsigned is
    variable ret : unsigned(width-1 downto 0);
  begin
    if that'length = 0 then
       ret := (others => '0');
    else
       ret := resize(that,width);
    end if;
    return ret;
  end pkg_resize;
  function pkg_resize (that : signed; width : integer) return signed is
    alias temp : signed(that'length-1 downto 0) is that;
    variable ret : signed(width-1 downto 0);
  begin
    if temp'length = 0 then
       ret := (others => '0');
    elsif temp'length >= width then
       ret := temp(width-1 downto 0);
    else
       ret := resize(temp,width);
    end if;
    return ret;
  end pkg_resize;
end pkg_scala2hdl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity Timer is
  port(
    io_tick : in std_logic;
    io_clear : in std_logic;
    io_limit : in unsigned(15 downto 0);
    io_full : out std_logic;
    io_value : out unsigned(15 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end Timer;

architecture arch of Timer is
  signal io_full_read_buffer : std_logic;

  signal counter : unsigned(15 downto 0);
  signal when_Timer_l22 : std_logic;
begin
  io_full <= io_full_read_buffer;
  when_Timer_l22 <= (io_tick and (not io_full_read_buffer));
  io_full_read_buffer <= pkg_toStdLogic(counter = io_limit);
  io_value <= counter;
  process(clk)
  begin
    if rising_edge(clk) then
      if when_Timer_l22 = '1' then
        counter <= (counter + pkg_unsigned("0000000000000001"));
      end if;
      if io_clear = '1' then
        counter <= pkg_unsigned("0000000000000000");
      end if;
    end if;
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity Timer_1 is
  port(
    io_tick : in std_logic;
    io_clear : in std_logic;
    io_limit : in unsigned(7 downto 0);
    io_full : out std_logic;
    io_value : out unsigned(7 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end Timer_1;

architecture arch of Timer_1 is
  signal io_full_read_buffer : std_logic;

  signal counter : unsigned(7 downto 0);
  signal when_Timer_l22 : std_logic;
begin
  io_full <= io_full_read_buffer;
  when_Timer_l22 <= (io_tick and (not io_full_read_buffer));
  io_full_read_buffer <= pkg_toStdLogic(counter = io_limit);
  io_value <= counter;
  process(clk)
  begin
    if rising_edge(clk) then
      if when_Timer_l22 = '1' then
        counter <= (counter + pkg_unsigned("00000001"));
      end if;
      if io_clear = '1' then
        counter <= pkg_unsigned("00000000");
      end if;
    end if;
  end process;

end arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity Apb3Timer is
  port(
    io_apb_PADDR : in unsigned(7 downto 0);
    io_apb_PSEL : in std_logic_vector(0 downto 0);
    io_apb_PENABLE : in std_logic;
    io_apb_PREADY : out std_logic;
    io_apb_PWRITE : in std_logic;
    io_apb_PWDATA : in std_logic_vector(31 downto 0);
    io_apb_PRDATA : out std_logic_vector(31 downto 0);
    io_apb_PSLVERROR : out std_logic;
    io_fullA : out std_logic;
    io_fullB : out std_logic;
    io_external_tick : in std_logic;
    io_external_clear : in std_logic;
    clk : in std_logic;
    reset : in std_logic
  );
end Apb3Timer;

architecture arch of Apb3Timer is
  signal timerA_io_tick : std_logic;
  signal timerA_io_clear : std_logic;
  signal timerB_io_tick : std_logic;
  signal timerB_io_clear : std_logic;
  signal io_apb_PREADY_read_buffer : std_logic;
  signal timerA_io_full : std_logic;
  signal timerA_io_value : unsigned(15 downto 0);
  signal timerB_io_full : std_logic;
  signal timerB_io_value : unsigned(7 downto 0);

  signal clockDivider_counter : unsigned(3 downto 0);
  signal clockDivider_full : std_logic;
  signal apbCtrl_askWrite : std_logic;
  signal apbCtrl_askRead : std_logic;
  signal apbCtrl_doWrite : std_logic;
  signal apbCtrl_doRead : std_logic;
  signal bridgeA_ticksEnable : std_logic_vector(2 downto 0);
  signal bridgeA_clearEnable : std_logic_vector(1 downto 0);
  signal bridgeA_busClearing : std_logic;
  signal timerA_io_limit_driver : unsigned(15 downto 0);
  signal when_Timer_l67 : std_logic;
  signal when_Timer_l72 : std_logic;
  signal bridgeB_ticksEnable : std_logic_vector(2 downto 0);
  signal bridgeB_clearEnable : std_logic_vector(1 downto 0);
  signal bridgeB_busClearing : std_logic;
  signal timerB_io_limit_driver : unsigned(7 downto 0);
  signal when_Timer_l67_1 : std_logic;
  signal when_Timer_l72_1 : std_logic;
begin
  io_apb_PREADY <= io_apb_PREADY_read_buffer;
  timerA : entity work.Timer
    port map ( 
      io_tick => timerA_io_tick,
      io_clear => timerA_io_clear,
      io_limit => timerA_io_limit_driver,
      io_full => timerA_io_full,
      io_value => timerA_io_value,
      clk => clk,
      reset => reset 
    );
  timerB : entity work.Timer_1
    port map ( 
      io_tick => timerB_io_tick,
      io_clear => timerB_io_clear,
      io_limit => timerB_io_limit_driver,
      io_full => timerB_io_full,
      io_value => timerB_io_value,
      clk => clk,
      reset => reset 
    );
  clockDivider_full <= pkg_toStdLogic(clockDivider_counter = pkg_unsigned("1111"));
  io_apb_PREADY_read_buffer <= pkg_toStdLogic(true);
  process(io_apb_PADDR,bridgeA_ticksEnable,bridgeA_clearEnable,timerA_io_limit_driver,timerA_io_value,bridgeB_ticksEnable,bridgeB_clearEnable,timerB_io_limit_driver,timerB_io_value)
  begin
    io_apb_PRDATA <= pkg_stdLogicVector("00000000000000000000000000000000");
    case io_apb_PADDR is
      when "00000000" =>
        io_apb_PRDATA(2 downto 0) <= bridgeA_ticksEnable;
        io_apb_PRDATA(17 downto 16) <= bridgeA_clearEnable;
      when "00000100" =>
        io_apb_PRDATA(15 downto 0) <= std_logic_vector(timerA_io_limit_driver);
      when "00001000" =>
        io_apb_PRDATA(15 downto 0) <= std_logic_vector(timerA_io_value);
      when "00010000" =>
        io_apb_PRDATA(2 downto 0) <= bridgeB_ticksEnable;
        io_apb_PRDATA(17 downto 16) <= bridgeB_clearEnable;
      when "00010100" =>
        io_apb_PRDATA(7 downto 0) <= std_logic_vector(timerB_io_limit_driver);
      when "00011000" =>
        io_apb_PRDATA(7 downto 0) <= std_logic_vector(timerB_io_value);
      when others =>
    end case;
  end process;

  io_apb_PSLVERROR <= pkg_toStdLogic(false);
  apbCtrl_askWrite <= ((pkg_extract(io_apb_PSEL,0) and io_apb_PENABLE) and io_apb_PWRITE);
  apbCtrl_askRead <= ((pkg_extract(io_apb_PSEL,0) and io_apb_PENABLE) and (not io_apb_PWRITE));
  apbCtrl_doWrite <= (((pkg_extract(io_apb_PSEL,0) and io_apb_PENABLE) and io_apb_PREADY_read_buffer) and io_apb_PWRITE);
  apbCtrl_doRead <= (((pkg_extract(io_apb_PSEL,0) and io_apb_PENABLE) and io_apb_PREADY_read_buffer) and (not io_apb_PWRITE));
  process(when_Timer_l67,when_Timer_l72)
  begin
    bridgeA_busClearing <= pkg_toStdLogic(false);
    if when_Timer_l67 = '1' then
      bridgeA_busClearing <= pkg_toStdLogic(true);
    end if;
    if when_Timer_l72 = '1' then
      bridgeA_busClearing <= pkg_toStdLogic(true);
    end if;
  end process;

  timerA_io_tick <= pkg_toStdLogic((bridgeA_ticksEnable and pkg_cat(pkg_toStdLogicVector(io_external_tick),pkg_cat(pkg_toStdLogicVector(clockDivider_full),pkg_toStdLogicVector(pkg_toStdLogic(true))))) /= pkg_stdLogicVector("000"));
  timerA_io_clear <= (pkg_toStdLogic((bridgeA_clearEnable and pkg_cat(pkg_toStdLogicVector(io_external_clear),pkg_toStdLogicVector(timerA_io_full))) /= pkg_stdLogicVector("00")) or bridgeA_busClearing);
  process(io_apb_PADDR,apbCtrl_doWrite)
  begin
    when_Timer_l67 <= pkg_toStdLogic(false);
    case io_apb_PADDR is
      when "00000100" =>
        if apbCtrl_doWrite = '1' then
          when_Timer_l67 <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  process(io_apb_PADDR,apbCtrl_doWrite)
  begin
    when_Timer_l72 <= pkg_toStdLogic(false);
    case io_apb_PADDR is
      when "00001000" =>
        if apbCtrl_doWrite = '1' then
          when_Timer_l72 <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  process(when_Timer_l67_1,when_Timer_l72_1)
  begin
    bridgeB_busClearing <= pkg_toStdLogic(false);
    if when_Timer_l67_1 = '1' then
      bridgeB_busClearing <= pkg_toStdLogic(true);
    end if;
    if when_Timer_l72_1 = '1' then
      bridgeB_busClearing <= pkg_toStdLogic(true);
    end if;
  end process;

  timerB_io_tick <= pkg_toStdLogic((bridgeB_ticksEnable and pkg_cat(pkg_toStdLogicVector(io_external_tick),pkg_cat(pkg_toStdLogicVector(clockDivider_full),pkg_toStdLogicVector(pkg_toStdLogic(true))))) /= pkg_stdLogicVector("000"));
  timerB_io_clear <= (pkg_toStdLogic((bridgeB_clearEnable and pkg_cat(pkg_toStdLogicVector(io_external_clear),pkg_toStdLogicVector(timerB_io_full))) /= pkg_stdLogicVector("00")) or bridgeB_busClearing);
  process(io_apb_PADDR,apbCtrl_doWrite)
  begin
    when_Timer_l67_1 <= pkg_toStdLogic(false);
    case io_apb_PADDR is
      when "00010100" =>
        if apbCtrl_doWrite = '1' then
          when_Timer_l67_1 <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  process(io_apb_PADDR,apbCtrl_doWrite)
  begin
    when_Timer_l72_1 <= pkg_toStdLogic(false);
    case io_apb_PADDR is
      when "00011000" =>
        if apbCtrl_doWrite = '1' then
          when_Timer_l72_1 <= pkg_toStdLogic(true);
        end if;
      when others =>
    end case;
  end process;

  io_fullA <= timerA_io_full;
  io_fullB <= timerB_io_full;
  process(clk, reset)
  begin
    if reset = '1' then
      clockDivider_counter <= pkg_unsigned("0000");
      bridgeA_ticksEnable <= pkg_stdLogicVector("000");
      bridgeA_clearEnable <= pkg_stdLogicVector("00");
      bridgeB_ticksEnable <= pkg_stdLogicVector("000");
      bridgeB_clearEnable <= pkg_stdLogicVector("00");
    elsif rising_edge(clk) then
      clockDivider_counter <= (clockDivider_counter + pkg_unsigned("0001"));
      case io_apb_PADDR is
        when "00000000" =>
          if apbCtrl_doWrite = '1' then
            bridgeA_ticksEnable <= pkg_extract(io_apb_PWDATA,2,0);
            bridgeA_clearEnable <= pkg_extract(io_apb_PWDATA,17,16);
          end if;
        when "00010000" =>
          if apbCtrl_doWrite = '1' then
            bridgeB_ticksEnable <= pkg_extract(io_apb_PWDATA,2,0);
            bridgeB_clearEnable <= pkg_extract(io_apb_PWDATA,17,16);
          end if;
        when others =>
      end case;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      case io_apb_PADDR is
        when "00000100" =>
          if apbCtrl_doWrite = '1' then
            timerA_io_limit_driver <= unsigned(pkg_extract(io_apb_PWDATA,15,0));
          end if;
        when "00010100" =>
          if apbCtrl_doWrite = '1' then
            timerB_io_limit_driver <= unsigned(pkg_extract(io_apb_PWDATA,7,0));
          end if;
        when others =>
      end case;
    end if;
  end process;

end arch;

