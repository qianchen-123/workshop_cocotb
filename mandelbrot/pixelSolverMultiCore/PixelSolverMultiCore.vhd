-- Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
-- Component : PixelSolverMultiCore
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


entity Dispatcher is
  port(
    io_input_valid : in std_logic;
    io_input_ready : out std_logic;
    io_input_payload_x : in signed(27 downto 0);
    io_input_payload_y : in signed(27 downto 0);
    io_outputs_0_valid : out std_logic;
    io_outputs_0_ready : in std_logic;
    io_outputs_0_payload_x : out signed(27 downto 0);
    io_outputs_0_payload_y : out signed(27 downto 0);
    io_outputs_1_valid : out std_logic;
    io_outputs_1_ready : in std_logic;
    io_outputs_1_payload_x : out signed(27 downto 0);
    io_outputs_1_payload_y : out signed(27 downto 0);
    io_outputs_2_valid : out std_logic;
    io_outputs_2_ready : in std_logic;
    io_outputs_2_payload_x : out signed(27 downto 0);
    io_outputs_2_payload_y : out signed(27 downto 0);
    io_outputs_3_valid : out std_logic;
    io_outputs_3_ready : in std_logic;
    io_outputs_3_payload_x : out signed(27 downto 0);
    io_outputs_3_payload_y : out signed(27 downto 0);
    io_outputs_4_valid : out std_logic;
    io_outputs_4_ready : in std_logic;
    io_outputs_4_payload_x : out signed(27 downto 0);
    io_outputs_4_payload_y : out signed(27 downto 0);
    io_outputs_5_valid : out std_logic;
    io_outputs_5_ready : in std_logic;
    io_outputs_5_payload_x : out signed(27 downto 0);
    io_outputs_5_payload_y : out signed(27 downto 0);
    io_outputs_6_valid : out std_logic;
    io_outputs_6_ready : in std_logic;
    io_outputs_6_payload_x : out signed(27 downto 0);
    io_outputs_6_payload_y : out signed(27 downto 0);
    io_outputs_7_valid : out std_logic;
    io_outputs_7_ready : in std_logic;
    io_outputs_7_payload_x : out signed(27 downto 0);
    io_outputs_7_payload_y : out signed(27 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end Dispatcher;

architecture arch of Dispatcher is
  signal io_input_ready_read_buffer : std_logic;
  signal zz_io_input_ready : std_logic;

  signal counter_willIncrement : std_logic;
  signal counter_willClear : std_logic;
  signal counter_valueNext : unsigned(2 downto 0);
  signal counter_value : unsigned(2 downto 0);
  signal counter_willOverflowIfInc : std_logic;
  signal counter_willOverflow : std_logic;
  signal zz_1 : unsigned(7 downto 0);
  signal io_input_fire : std_logic;
begin
  io_input_ready <= io_input_ready_read_buffer;
  process(counter_value,io_outputs_0_ready,io_outputs_1_ready,io_outputs_2_ready,io_outputs_3_ready,io_outputs_4_ready,io_outputs_5_ready,io_outputs_6_ready,io_outputs_7_ready)
  begin
    case counter_value is
      when "000" =>
        zz_io_input_ready <= io_outputs_0_ready;
      when "001" =>
        zz_io_input_ready <= io_outputs_1_ready;
      when "010" =>
        zz_io_input_ready <= io_outputs_2_ready;
      when "011" =>
        zz_io_input_ready <= io_outputs_3_ready;
      when "100" =>
        zz_io_input_ready <= io_outputs_4_ready;
      when "101" =>
        zz_io_input_ready <= io_outputs_5_ready;
      when "110" =>
        zz_io_input_ready <= io_outputs_6_ready;
      when others =>
        zz_io_input_ready <= io_outputs_7_ready;
    end case;
  end process;

  process(io_input_fire)
  begin
    counter_willIncrement <= pkg_toStdLogic(false);
    if io_input_fire = '1' then
      counter_willIncrement <= pkg_toStdLogic(true);
    end if;
  end process;

  counter_willClear <= pkg_toStdLogic(false);
  counter_willOverflowIfInc <= pkg_toStdLogic(counter_value = pkg_unsigned("111"));
  counter_willOverflow <= (counter_willOverflowIfInc and counter_willIncrement);
  process(counter_value,counter_willIncrement,counter_willClear)
  begin
    counter_valueNext <= (counter_value + pkg_resize(unsigned(pkg_toStdLogicVector(counter_willIncrement)),3));
    if counter_willClear = '1' then
      counter_valueNext <= pkg_unsigned("000");
    end if;
  end process;

  process(zz_1,io_input_valid)
  begin
    io_outputs_0_valid <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,0) = '1' then
      io_outputs_0_valid <= io_input_valid;
    end if;
  end process;

  io_outputs_0_payload_x <= io_input_payload_x;
  io_outputs_0_payload_y <= io_input_payload_y;
  process(zz_1,io_input_valid)
  begin
    io_outputs_1_valid <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,1) = '1' then
      io_outputs_1_valid <= io_input_valid;
    end if;
  end process;

  io_outputs_1_payload_x <= io_input_payload_x;
  io_outputs_1_payload_y <= io_input_payload_y;
  process(zz_1,io_input_valid)
  begin
    io_outputs_2_valid <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,2) = '1' then
      io_outputs_2_valid <= io_input_valid;
    end if;
  end process;

  io_outputs_2_payload_x <= io_input_payload_x;
  io_outputs_2_payload_y <= io_input_payload_y;
  process(zz_1,io_input_valid)
  begin
    io_outputs_3_valid <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,3) = '1' then
      io_outputs_3_valid <= io_input_valid;
    end if;
  end process;

  io_outputs_3_payload_x <= io_input_payload_x;
  io_outputs_3_payload_y <= io_input_payload_y;
  process(zz_1,io_input_valid)
  begin
    io_outputs_4_valid <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,4) = '1' then
      io_outputs_4_valid <= io_input_valid;
    end if;
  end process;

  io_outputs_4_payload_x <= io_input_payload_x;
  io_outputs_4_payload_y <= io_input_payload_y;
  process(zz_1,io_input_valid)
  begin
    io_outputs_5_valid <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,5) = '1' then
      io_outputs_5_valid <= io_input_valid;
    end if;
  end process;

  io_outputs_5_payload_x <= io_input_payload_x;
  io_outputs_5_payload_y <= io_input_payload_y;
  process(zz_1,io_input_valid)
  begin
    io_outputs_6_valid <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,6) = '1' then
      io_outputs_6_valid <= io_input_valid;
    end if;
  end process;

  io_outputs_6_payload_x <= io_input_payload_x;
  io_outputs_6_payload_y <= io_input_payload_y;
  process(zz_1,io_input_valid)
  begin
    io_outputs_7_valid <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,7) = '1' then
      io_outputs_7_valid <= io_input_valid;
    end if;
  end process;

  io_outputs_7_payload_x <= io_input_payload_x;
  io_outputs_7_payload_y <= io_input_payload_y;
  zz_1 <= pkg_shiftLeft(pkg_unsigned("1"),counter_value);
  io_input_ready_read_buffer <= zz_io_input_ready;
  io_input_fire <= (io_input_valid and io_input_ready_read_buffer);
  process(clk, reset)
  begin
    if reset = '1' then
      counter_value <= pkg_unsigned("000");
    elsif rising_edge(clk) then
      counter_value <= counter_valueNext;
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


entity PixelSolver is
  port(
    io_cmd_valid : in std_logic;
    io_cmd_ready : out std_logic;
    io_cmd_payload_x : in signed(27 downto 0);
    io_cmd_payload_y : in signed(27 downto 0);
    io_rsp_valid : out std_logic;
    io_rsp_ready : in std_logic;
    io_rsp_payload_iteration : out unsigned(5 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end PixelSolver;

architecture arch of PixelSolver is
  signal io_cmd_ready_read_buffer : std_logic;
  signal io_rsp_valid_read_buffer : std_logic;

  signal Inserter_cmdContext_id : unsigned(2 downto 0);
  signal Inserter_cmdContext_x0 : signed(27 downto 0);
  signal Inserter_cmdContext_y0 : signed(27 downto 0);
  signal Inserter_cmdContext_iteration : unsigned(5 downto 0);
  signal Inserter_cmdContext_done : std_logic;
  signal Inserter_cmdContext_x : signed(27 downto 0);
  signal Inserter_cmdContext_y : signed(27 downto 0);
  signal Inserter_loopBack_valid : std_logic;
  signal Inserter_loopBack_payload_id : unsigned(2 downto 0);
  signal Inserter_loopBack_payload_x0 : signed(27 downto 0);
  signal Inserter_loopBack_payload_y0 : signed(27 downto 0);
  signal Inserter_loopBack_payload_iteration : unsigned(5 downto 0);
  signal Inserter_loopBack_payload_done : std_logic;
  signal Inserter_loopBack_payload_x : signed(27 downto 0);
  signal Inserter_loopBack_payload_y : signed(27 downto 0);
  signal Inserter_output_valid : std_logic;
  signal Inserter_output_payload_id : unsigned(2 downto 0);
  signal Inserter_output_payload_x0 : signed(27 downto 0);
  signal Inserter_output_payload_y0 : signed(27 downto 0);
  signal Inserter_output_payload_iteration : unsigned(5 downto 0);
  signal Inserter_output_payload_done : std_logic;
  signal Inserter_output_payload_x : signed(27 downto 0);
  signal Inserter_output_payload_y : signed(27 downto 0);
  signal io_cmd_fire : std_logic;
  signal Inserter_taskId_willIncrement : std_logic;
  signal Inserter_taskId_willClear : std_logic;
  signal Inserter_taskId_valueNext : unsigned(2 downto 0);
  signal Inserter_taskId_value : unsigned(2 downto 0);
  signal Inserter_taskId_willOverflowIfInc : std_logic;
  signal Inserter_taskId_willOverflow : std_logic;
  signal Mulstage_input_valid : std_logic;
  signal Mulstage_input_payload_id : unsigned(2 downto 0);
  signal Mulstage_input_payload_x0 : signed(27 downto 0);
  signal Mulstage_input_payload_y0 : signed(27 downto 0);
  signal Mulstage_input_payload_iteration : unsigned(5 downto 0);
  signal Mulstage_input_payload_done : std_logic;
  signal Mulstage_input_payload_x : signed(27 downto 0);
  signal Mulstage_input_payload_y : signed(27 downto 0);
  signal Mulstage_output_valid : std_logic;
  signal Mulstage_output_payload_id : unsigned(2 downto 0);
  signal Mulstage_output_payload_x0 : signed(27 downto 0);
  signal Mulstage_output_payload_y0 : signed(27 downto 0);
  signal Mulstage_output_payload_iteration : unsigned(5 downto 0);
  signal Mulstage_output_payload_done : std_logic;
  signal Mulstage_output_payload_xx : signed(27 downto 0);
  signal Mulstage_output_payload_yy : signed(27 downto 0);
  signal Mulstage_output_payload_xy : signed(27 downto 0);
  signal AddStage_input_valid : std_logic;
  signal AddStage_input_payload_id : unsigned(2 downto 0);
  signal AddStage_input_payload_x0 : signed(27 downto 0);
  signal AddStage_input_payload_y0 : signed(27 downto 0);
  signal AddStage_input_payload_iteration : unsigned(5 downto 0);
  signal AddStage_input_payload_done : std_logic;
  signal AddStage_input_payload_xx : signed(27 downto 0);
  signal AddStage_input_payload_yy : signed(27 downto 0);
  signal AddStage_input_payload_xy : signed(27 downto 0);
  signal AddStage_output_valid : std_logic;
  signal AddStage_output_payload_id : unsigned(2 downto 0);
  signal AddStage_output_payload_x0 : signed(27 downto 0);
  signal AddStage_output_payload_y0 : signed(27 downto 0);
  signal AddStage_output_payload_iteration : unsigned(5 downto 0);
  signal AddStage_output_payload_done : std_logic;
  signal AddStage_output_payload_x : signed(27 downto 0);
  signal AddStage_output_payload_y : signed(27 downto 0);
  signal Rounter_input_valid : std_logic;
  signal Rounter_input_payload_id : unsigned(2 downto 0);
  signal Rounter_input_payload_x0 : signed(27 downto 0);
  signal Rounter_input_payload_y0 : signed(27 downto 0);
  signal Rounter_input_payload_iteration : unsigned(5 downto 0);
  signal Rounter_input_payload_done : std_logic;
  signal Rounter_input_payload_x : signed(27 downto 0);
  signal Rounter_input_payload_y : signed(27 downto 0);
  signal io_rsp_fire : std_logic;
  signal Rounter_taskId_willIncrement : std_logic;
  signal Rounter_taskId_willClear : std_logic;
  signal Rounter_taskId_valueNext : unsigned(2 downto 0);
  signal Rounter_taskId_value : unsigned(2 downto 0);
  signal Rounter_taskId_willOverflowIfInc : std_logic;
  signal Rounter_taskId_willOverflow : std_logic;
begin
  io_cmd_ready <= io_cmd_ready_read_buffer;
  io_rsp_valid <= io_rsp_valid_read_buffer;
  io_cmd_fire <= (io_cmd_valid and io_cmd_ready_read_buffer);
  process(io_cmd_fire)
  begin
    Inserter_taskId_willIncrement <= pkg_toStdLogic(false);
    if io_cmd_fire = '1' then
      Inserter_taskId_willIncrement <= pkg_toStdLogic(true);
    end if;
  end process;

  Inserter_taskId_willClear <= pkg_toStdLogic(false);
  Inserter_taskId_willOverflowIfInc <= pkg_toStdLogic(Inserter_taskId_value = pkg_unsigned("111"));
  Inserter_taskId_willOverflow <= (Inserter_taskId_willOverflowIfInc and Inserter_taskId_willIncrement);
  process(Inserter_taskId_value,Inserter_taskId_willIncrement,Inserter_taskId_willClear)
  begin
    Inserter_taskId_valueNext <= (Inserter_taskId_value + pkg_resize(unsigned(pkg_toStdLogicVector(Inserter_taskId_willIncrement)),3));
    if Inserter_taskId_willClear = '1' then
      Inserter_taskId_valueNext <= pkg_unsigned("000");
    end if;
  end process;

  Inserter_cmdContext_id <= Inserter_taskId_value;
  Inserter_cmdContext_x0 <= io_cmd_payload_x;
  Inserter_cmdContext_y0 <= io_cmd_payload_y;
  Inserter_cmdContext_x <= pkg_signed("0000000000000000000000000000");
  Inserter_cmdContext_y <= pkg_signed("0000000000000000000000000000");
  Inserter_cmdContext_iteration <= pkg_unsigned("000000");
  Inserter_cmdContext_done <= pkg_toStdLogic(false);
  Inserter_output_valid <= (io_cmd_valid or Inserter_loopBack_valid);
  process(Inserter_loopBack_valid,Inserter_loopBack_payload_id,Inserter_cmdContext_id)
  begin
    if Inserter_loopBack_valid = '1' then
      Inserter_output_payload_id <= Inserter_loopBack_payload_id;
    else
      Inserter_output_payload_id <= Inserter_cmdContext_id;
    end if;
  end process;

  process(Inserter_loopBack_valid,Inserter_loopBack_payload_x0,Inserter_cmdContext_x0)
  begin
    if Inserter_loopBack_valid = '1' then
      Inserter_output_payload_x0 <= Inserter_loopBack_payload_x0;
    else
      Inserter_output_payload_x0 <= Inserter_cmdContext_x0;
    end if;
  end process;

  process(Inserter_loopBack_valid,Inserter_loopBack_payload_y0,Inserter_cmdContext_y0)
  begin
    if Inserter_loopBack_valid = '1' then
      Inserter_output_payload_y0 <= Inserter_loopBack_payload_y0;
    else
      Inserter_output_payload_y0 <= Inserter_cmdContext_y0;
    end if;
  end process;

  process(Inserter_loopBack_valid,Inserter_loopBack_payload_iteration,Inserter_cmdContext_iteration)
  begin
    if Inserter_loopBack_valid = '1' then
      Inserter_output_payload_iteration <= Inserter_loopBack_payload_iteration;
    else
      Inserter_output_payload_iteration <= Inserter_cmdContext_iteration;
    end if;
  end process;

  process(Inserter_loopBack_valid,Inserter_loopBack_payload_done,Inserter_cmdContext_done)
  begin
    if Inserter_loopBack_valid = '1' then
      Inserter_output_payload_done <= Inserter_loopBack_payload_done;
    else
      Inserter_output_payload_done <= Inserter_cmdContext_done;
    end if;
  end process;

  process(Inserter_loopBack_valid,Inserter_loopBack_payload_x,Inserter_cmdContext_x)
  begin
    if Inserter_loopBack_valid = '1' then
      Inserter_output_payload_x <= Inserter_loopBack_payload_x;
    else
      Inserter_output_payload_x <= Inserter_cmdContext_x;
    end if;
  end process;

  process(Inserter_loopBack_valid,Inserter_loopBack_payload_y,Inserter_cmdContext_y)
  begin
    if Inserter_loopBack_valid = '1' then
      Inserter_output_payload_y <= Inserter_loopBack_payload_y;
    else
      Inserter_output_payload_y <= Inserter_cmdContext_y;
    end if;
  end process;

  io_cmd_ready_read_buffer <= (not Inserter_loopBack_valid);
  Mulstage_output_valid <= Mulstage_input_valid;
  Mulstage_output_payload_id <= Mulstage_input_payload_id;
  Mulstage_output_payload_x0 <= Mulstage_input_payload_x0;
  Mulstage_output_payload_y0 <= Mulstage_input_payload_y0;
  Mulstage_output_payload_iteration <= Mulstage_input_payload_iteration;
  Mulstage_output_payload_done <= Mulstage_input_payload_done;
  Mulstage_output_payload_xx <= pkg_resize(pkg_shiftRight((Mulstage_input_payload_x * Mulstage_input_payload_x),20),28);
  Mulstage_output_payload_yy <= pkg_resize(pkg_shiftRight((Mulstage_input_payload_y * Mulstage_input_payload_y),20),28);
  Mulstage_output_payload_xy <= pkg_resize(pkg_shiftRight((Mulstage_input_payload_x * Mulstage_input_payload_y),20),28);
  AddStage_output_valid <= AddStage_input_valid;
  AddStage_output_payload_id <= AddStage_input_payload_id;
  AddStage_output_payload_x0 <= AddStage_input_payload_x0;
  AddStage_output_payload_y0 <= AddStage_input_payload_y0;
  process(AddStage_input_payload_iteration,AddStage_output_payload_done)
  begin
    AddStage_output_payload_iteration <= AddStage_input_payload_iteration;
    AddStage_output_payload_iteration <= (AddStage_input_payload_iteration + pkg_resize(unsigned(pkg_toStdLogicVector((not AddStage_output_payload_done))),6));
  end process;

  process(AddStage_input_payload_done,AddStage_input_payload_xx,AddStage_input_payload_yy,AddStage_input_payload_iteration)
  begin
    AddStage_output_payload_done <= AddStage_input_payload_done;
    AddStage_output_payload_done <= ((AddStage_input_payload_done or pkg_toStdLogic(pkg_signed("0000010000000000000000000000") <= (AddStage_input_payload_xx + AddStage_input_payload_yy))) or pkg_toStdLogic(AddStage_input_payload_iteration = pkg_unsigned("111111")));
  end process;

  AddStage_output_payload_x <= ((AddStage_input_payload_xx - AddStage_input_payload_yy) + AddStage_input_payload_x0);
  AddStage_output_payload_y <= pkg_resize((pkg_shiftLeft(AddStage_input_payload_xy,1) + pkg_resize(AddStage_input_payload_y0,29)),28);
  io_rsp_fire <= (io_rsp_valid_read_buffer and io_rsp_ready);
  process(io_rsp_fire)
  begin
    Rounter_taskId_willIncrement <= pkg_toStdLogic(false);
    if io_rsp_fire = '1' then
      Rounter_taskId_willIncrement <= pkg_toStdLogic(true);
    end if;
  end process;

  Rounter_taskId_willClear <= pkg_toStdLogic(false);
  Rounter_taskId_willOverflowIfInc <= pkg_toStdLogic(Rounter_taskId_value = pkg_unsigned("111"));
  Rounter_taskId_willOverflow <= (Rounter_taskId_willOverflowIfInc and Rounter_taskId_willIncrement);
  process(Rounter_taskId_value,Rounter_taskId_willIncrement,Rounter_taskId_willClear)
  begin
    Rounter_taskId_valueNext <= (Rounter_taskId_value + pkg_resize(unsigned(pkg_toStdLogicVector(Rounter_taskId_willIncrement)),3));
    if Rounter_taskId_willClear = '1' then
      Rounter_taskId_valueNext <= pkg_unsigned("000");
    end if;
  end process;

  io_rsp_valid_read_buffer <= ((Rounter_input_valid and Rounter_input_payload_done) and pkg_toStdLogic(Rounter_taskId_value = Rounter_input_payload_id));
  io_rsp_payload_iteration <= Rounter_input_payload_iteration;
  Inserter_loopBack_valid <= (Rounter_input_valid and ((not (Rounter_input_payload_done and pkg_toStdLogic(Rounter_taskId_value = Rounter_input_payload_id))) or (not io_rsp_ready)));
  Inserter_loopBack_payload_id <= Rounter_input_payload_id;
  Inserter_loopBack_payload_x0 <= Rounter_input_payload_x0;
  Inserter_loopBack_payload_y0 <= Rounter_input_payload_y0;
  Inserter_loopBack_payload_iteration <= Rounter_input_payload_iteration;
  Inserter_loopBack_payload_done <= Rounter_input_payload_done;
  Inserter_loopBack_payload_x <= Rounter_input_payload_x;
  Inserter_loopBack_payload_y <= Rounter_input_payload_y;
  process(clk, reset)
  begin
    if reset = '1' then
      Inserter_taskId_value <= pkg_unsigned("000");
      Mulstage_input_valid <= pkg_toStdLogic(false);
      AddStage_input_valid <= pkg_toStdLogic(false);
      Rounter_input_valid <= pkg_toStdLogic(false);
      Rounter_taskId_value <= pkg_unsigned("000");
    elsif rising_edge(clk) then
      Inserter_taskId_value <= Inserter_taskId_valueNext;
      Mulstage_input_valid <= Inserter_output_valid;
      AddStage_input_valid <= Mulstage_output_valid;
      Rounter_input_valid <= AddStage_output_valid;
      Rounter_taskId_value <= Rounter_taskId_valueNext;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      Mulstage_input_payload_id <= Inserter_output_payload_id;
      Mulstage_input_payload_x0 <= Inserter_output_payload_x0;
      Mulstage_input_payload_y0 <= Inserter_output_payload_y0;
      Mulstage_input_payload_iteration <= Inserter_output_payload_iteration;
      Mulstage_input_payload_done <= Inserter_output_payload_done;
      Mulstage_input_payload_x <= Inserter_output_payload_x;
      Mulstage_input_payload_y <= Inserter_output_payload_y;
      AddStage_input_payload_id <= Mulstage_output_payload_id;
      AddStage_input_payload_x0 <= Mulstage_output_payload_x0;
      AddStage_input_payload_y0 <= Mulstage_output_payload_y0;
      AddStage_input_payload_iteration <= Mulstage_output_payload_iteration;
      AddStage_input_payload_done <= Mulstage_output_payload_done;
      AddStage_input_payload_xx <= Mulstage_output_payload_xx;
      AddStage_input_payload_yy <= Mulstage_output_payload_yy;
      AddStage_input_payload_xy <= Mulstage_output_payload_xy;
      Rounter_input_payload_id <= AddStage_output_payload_id;
      Rounter_input_payload_x0 <= AddStage_output_payload_x0;
      Rounter_input_payload_y0 <= AddStage_output_payload_y0;
      Rounter_input_payload_iteration <= AddStage_output_payload_iteration;
      Rounter_input_payload_done <= AddStage_output_payload_done;
      Rounter_input_payload_x <= AddStage_output_payload_x;
      Rounter_input_payload_y <= AddStage_output_payload_y;
    end if;
  end process;

end arch;


--PixelSolver_1 replaced by PixelSolver


--PixelSolver_2 replaced by PixelSolver


--PixelSolver_3 replaced by PixelSolver


--PixelSolver_4 replaced by PixelSolver


--PixelSolver_5 replaced by PixelSolver


--PixelSolver_6 replaced by PixelSolver


--PixelSolver_7 replaced by PixelSolver

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity Arbiter is
  port(
    io_inputs_0_valid : in std_logic;
    io_inputs_0_ready : out std_logic;
    io_inputs_0_payload_iteration : in unsigned(5 downto 0);
    io_inputs_1_valid : in std_logic;
    io_inputs_1_ready : out std_logic;
    io_inputs_1_payload_iteration : in unsigned(5 downto 0);
    io_inputs_2_valid : in std_logic;
    io_inputs_2_ready : out std_logic;
    io_inputs_2_payload_iteration : in unsigned(5 downto 0);
    io_inputs_3_valid : in std_logic;
    io_inputs_3_ready : out std_logic;
    io_inputs_3_payload_iteration : in unsigned(5 downto 0);
    io_inputs_4_valid : in std_logic;
    io_inputs_4_ready : out std_logic;
    io_inputs_4_payload_iteration : in unsigned(5 downto 0);
    io_inputs_5_valid : in std_logic;
    io_inputs_5_ready : out std_logic;
    io_inputs_5_payload_iteration : in unsigned(5 downto 0);
    io_inputs_6_valid : in std_logic;
    io_inputs_6_ready : out std_logic;
    io_inputs_6_payload_iteration : in unsigned(5 downto 0);
    io_inputs_7_valid : in std_logic;
    io_inputs_7_ready : out std_logic;
    io_inputs_7_payload_iteration : in unsigned(5 downto 0);
    io_output_valid : out std_logic;
    io_output_ready : in std_logic;
    io_output_payload_iteration : out unsigned(5 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end Arbiter;

architecture arch of Arbiter is
  signal io_output_valid_read_buffer : std_logic;
  signal zz_io_output_valid : std_logic;
  signal zz_io_output_payload_iteration : unsigned(5 downto 0);

  signal counter_willIncrement : std_logic;
  signal counter_willClear : std_logic;
  signal counter_valueNext : unsigned(2 downto 0);
  signal counter_value : unsigned(2 downto 0);
  signal counter_willOverflowIfInc : std_logic;
  signal counter_willOverflow : std_logic;
  signal zz_1 : unsigned(7 downto 0);
  signal io_output_fire : std_logic;
begin
  io_output_valid <= io_output_valid_read_buffer;
  process(counter_value,io_inputs_0_valid,io_inputs_0_payload_iteration,io_inputs_1_valid,io_inputs_1_payload_iteration,io_inputs_2_valid,io_inputs_2_payload_iteration,io_inputs_3_valid,io_inputs_3_payload_iteration,io_inputs_4_valid,io_inputs_4_payload_iteration,io_inputs_5_valid,io_inputs_5_payload_iteration,io_inputs_6_valid,io_inputs_6_payload_iteration,io_inputs_7_valid,io_inputs_7_payload_iteration)
  begin
    case counter_value is
      when "000" =>
        zz_io_output_valid <= io_inputs_0_valid;
        zz_io_output_payload_iteration <= io_inputs_0_payload_iteration;
      when "001" =>
        zz_io_output_valid <= io_inputs_1_valid;
        zz_io_output_payload_iteration <= io_inputs_1_payload_iteration;
      when "010" =>
        zz_io_output_valid <= io_inputs_2_valid;
        zz_io_output_payload_iteration <= io_inputs_2_payload_iteration;
      when "011" =>
        zz_io_output_valid <= io_inputs_3_valid;
        zz_io_output_payload_iteration <= io_inputs_3_payload_iteration;
      when "100" =>
        zz_io_output_valid <= io_inputs_4_valid;
        zz_io_output_payload_iteration <= io_inputs_4_payload_iteration;
      when "101" =>
        zz_io_output_valid <= io_inputs_5_valid;
        zz_io_output_payload_iteration <= io_inputs_5_payload_iteration;
      when "110" =>
        zz_io_output_valid <= io_inputs_6_valid;
        zz_io_output_payload_iteration <= io_inputs_6_payload_iteration;
      when others =>
        zz_io_output_valid <= io_inputs_7_valid;
        zz_io_output_payload_iteration <= io_inputs_7_payload_iteration;
    end case;
  end process;

  process(io_output_fire)
  begin
    counter_willIncrement <= pkg_toStdLogic(false);
    if io_output_fire = '1' then
      counter_willIncrement <= pkg_toStdLogic(true);
    end if;
  end process;

  counter_willClear <= pkg_toStdLogic(false);
  counter_willOverflowIfInc <= pkg_toStdLogic(counter_value = pkg_unsigned("111"));
  counter_willOverflow <= (counter_willOverflowIfInc and counter_willIncrement);
  process(counter_value,counter_willIncrement,counter_willClear)
  begin
    counter_valueNext <= (counter_value + pkg_resize(unsigned(pkg_toStdLogicVector(counter_willIncrement)),3));
    if counter_willClear = '1' then
      counter_valueNext <= pkg_unsigned("000");
    end if;
  end process;

  process(zz_1,io_output_ready)
  begin
    io_inputs_0_ready <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,0) = '1' then
      io_inputs_0_ready <= io_output_ready;
    end if;
  end process;

  process(zz_1,io_output_ready)
  begin
    io_inputs_1_ready <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,1) = '1' then
      io_inputs_1_ready <= io_output_ready;
    end if;
  end process;

  process(zz_1,io_output_ready)
  begin
    io_inputs_2_ready <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,2) = '1' then
      io_inputs_2_ready <= io_output_ready;
    end if;
  end process;

  process(zz_1,io_output_ready)
  begin
    io_inputs_3_ready <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,3) = '1' then
      io_inputs_3_ready <= io_output_ready;
    end if;
  end process;

  process(zz_1,io_output_ready)
  begin
    io_inputs_4_ready <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,4) = '1' then
      io_inputs_4_ready <= io_output_ready;
    end if;
  end process;

  process(zz_1,io_output_ready)
  begin
    io_inputs_5_ready <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,5) = '1' then
      io_inputs_5_ready <= io_output_ready;
    end if;
  end process;

  process(zz_1,io_output_ready)
  begin
    io_inputs_6_ready <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,6) = '1' then
      io_inputs_6_ready <= io_output_ready;
    end if;
  end process;

  process(zz_1,io_output_ready)
  begin
    io_inputs_7_ready <= pkg_toStdLogic(false);
    if pkg_extract(zz_1,7) = '1' then
      io_inputs_7_ready <= io_output_ready;
    end if;
  end process;

  zz_1 <= pkg_shiftLeft(pkg_unsigned("1"),counter_value);
  io_output_valid_read_buffer <= zz_io_output_valid;
  io_output_payload_iteration <= zz_io_output_payload_iteration;
  io_output_fire <= (io_output_valid_read_buffer and io_output_ready);
  process(clk, reset)
  begin
    if reset = '1' then
      counter_value <= pkg_unsigned("000");
    elsif rising_edge(clk) then
      counter_value <= counter_valueNext;
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


entity PixelSolverMultiCore is
  port(
    io_cmd_valid : in std_logic;
    io_cmd_ready : out std_logic;
    io_cmd_payload_x : in signed(27 downto 0);
    io_cmd_payload_y : in signed(27 downto 0);
    io_rsp_valid : out std_logic;
    io_rsp_ready : in std_logic;
    io_rsp_payload_iteration : out unsigned(5 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end PixelSolverMultiCore;

architecture arch of PixelSolverMultiCore is
  signal pixelTaskDispatcher_io_outputs_0_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_1_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_2_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_3_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_4_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_5_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_6_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_7_ready : std_logic;
  signal pixelTaskSolver_0_io_rsp_ready : std_logic;
  signal pixelTaskSolver_1_io_rsp_ready : std_logic;
  signal pixelTaskSolver_2_io_rsp_ready : std_logic;
  signal pixelTaskSolver_3_io_rsp_ready : std_logic;
  signal pixelTaskSolver_4_io_rsp_ready : std_logic;
  signal pixelTaskSolver_5_io_rsp_ready : std_logic;
  signal pixelTaskSolver_6_io_rsp_ready : std_logic;
  signal pixelTaskSolver_7_io_rsp_ready : std_logic;
  signal pixelTaskDispatcher_io_input_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_0_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_0_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_0_payload_y : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_1_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_1_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_1_payload_y : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_2_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_2_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_2_payload_y : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_3_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_3_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_3_payload_y : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_4_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_4_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_4_payload_y : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_5_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_5_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_5_payload_y : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_6_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_6_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_6_payload_y : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_7_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_7_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_7_payload_y : signed(27 downto 0);
  signal pixelTaskSolver_0_io_cmd_ready : std_logic;
  signal pixelTaskSolver_0_io_rsp_valid : std_logic;
  signal pixelTaskSolver_0_io_rsp_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver_1_io_cmd_ready : std_logic;
  signal pixelTaskSolver_1_io_rsp_valid : std_logic;
  signal pixelTaskSolver_1_io_rsp_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver_2_io_cmd_ready : std_logic;
  signal pixelTaskSolver_2_io_rsp_valid : std_logic;
  signal pixelTaskSolver_2_io_rsp_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver_3_io_cmd_ready : std_logic;
  signal pixelTaskSolver_3_io_rsp_valid : std_logic;
  signal pixelTaskSolver_3_io_rsp_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver_4_io_cmd_ready : std_logic;
  signal pixelTaskSolver_4_io_rsp_valid : std_logic;
  signal pixelTaskSolver_4_io_rsp_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver_5_io_cmd_ready : std_logic;
  signal pixelTaskSolver_5_io_rsp_valid : std_logic;
  signal pixelTaskSolver_5_io_rsp_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver_6_io_cmd_ready : std_logic;
  signal pixelTaskSolver_6_io_rsp_valid : std_logic;
  signal pixelTaskSolver_6_io_rsp_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver_7_io_cmd_ready : std_logic;
  signal pixelTaskSolver_7_io_rsp_valid : std_logic;
  signal pixelTaskSolver_7_io_rsp_payload_iteration : unsigned(5 downto 0);
  signal pixelResultArbiter_io_inputs_0_ready : std_logic;
  signal pixelResultArbiter_io_inputs_1_ready : std_logic;
  signal pixelResultArbiter_io_inputs_2_ready : std_logic;
  signal pixelResultArbiter_io_inputs_3_ready : std_logic;
  signal pixelResultArbiter_io_inputs_4_ready : std_logic;
  signal pixelResultArbiter_io_inputs_5_ready : std_logic;
  signal pixelResultArbiter_io_inputs_6_ready : std_logic;
  signal pixelResultArbiter_io_inputs_7_ready : std_logic;
  signal pixelResultArbiter_io_output_valid : std_logic;
  signal pixelResultArbiter_io_output_payload_iteration : unsigned(5 downto 0);

  signal pixelTaskDispatcher_io_outputs_0_m2sPipe_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_0_m2sPipe_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_0_m2sPipe_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_0_m2sPipe_payload_y : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_0_rValid : std_logic;
  signal pixelTaskDispatcher_io_outputs_0_rData_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_0_rData_y : signed(27 downto 0);
  signal when_Stream_l342 : std_logic;
  signal pixelTaskSolver_0_io_rsp_m2sPipe_valid : std_logic;
  signal pixelTaskSolver_0_io_rsp_m2sPipe_ready : std_logic;
  signal pixelTaskSolver_0_io_rsp_m2sPipe_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver_0_io_rsp_rValid : std_logic;
  signal pixelTaskSolver_0_io_rsp_rData_iteration : unsigned(5 downto 0);
  signal when_Stream_l342_1 : std_logic;
  signal pixelTaskDispatcher_io_outputs_1_m2sPipe_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_1_m2sPipe_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_1_m2sPipe_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_1_m2sPipe_payload_y : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_1_rValid : std_logic;
  signal pixelTaskDispatcher_io_outputs_1_rData_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_1_rData_y : signed(27 downto 0);
  signal when_Stream_l342_2 : std_logic;
  signal pixelTaskSolver_1_io_rsp_m2sPipe_valid : std_logic;
  signal pixelTaskSolver_1_io_rsp_m2sPipe_ready : std_logic;
  signal pixelTaskSolver_1_io_rsp_m2sPipe_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver_1_io_rsp_rValid : std_logic;
  signal pixelTaskSolver_1_io_rsp_rData_iteration : unsigned(5 downto 0);
  signal when_Stream_l342_3 : std_logic;
  signal pixelTaskDispatcher_io_outputs_2_m2sPipe_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_2_m2sPipe_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_2_m2sPipe_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_2_m2sPipe_payload_y : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_2_rValid : std_logic;
  signal pixelTaskDispatcher_io_outputs_2_rData_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_2_rData_y : signed(27 downto 0);
  signal when_Stream_l342_4 : std_logic;
  signal pixelTaskSolver_2_io_rsp_m2sPipe_valid : std_logic;
  signal pixelTaskSolver_2_io_rsp_m2sPipe_ready : std_logic;
  signal pixelTaskSolver_2_io_rsp_m2sPipe_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver_2_io_rsp_rValid : std_logic;
  signal pixelTaskSolver_2_io_rsp_rData_iteration : unsigned(5 downto 0);
  signal when_Stream_l342_5 : std_logic;
  signal pixelTaskDispatcher_io_outputs_3_m2sPipe_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_3_m2sPipe_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_3_m2sPipe_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_3_m2sPipe_payload_y : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_3_rValid : std_logic;
  signal pixelTaskDispatcher_io_outputs_3_rData_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_3_rData_y : signed(27 downto 0);
  signal when_Stream_l342_6 : std_logic;
  signal pixelTaskSolver_3_io_rsp_m2sPipe_valid : std_logic;
  signal pixelTaskSolver_3_io_rsp_m2sPipe_ready : std_logic;
  signal pixelTaskSolver_3_io_rsp_m2sPipe_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver_3_io_rsp_rValid : std_logic;
  signal pixelTaskSolver_3_io_rsp_rData_iteration : unsigned(5 downto 0);
  signal when_Stream_l342_7 : std_logic;
  signal pixelTaskDispatcher_io_outputs_4_m2sPipe_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_4_m2sPipe_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_4_m2sPipe_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_4_m2sPipe_payload_y : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_4_rValid : std_logic;
  signal pixelTaskDispatcher_io_outputs_4_rData_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_4_rData_y : signed(27 downto 0);
  signal when_Stream_l342_8 : std_logic;
  signal pixelTaskSolver_4_io_rsp_m2sPipe_valid : std_logic;
  signal pixelTaskSolver_4_io_rsp_m2sPipe_ready : std_logic;
  signal pixelTaskSolver_4_io_rsp_m2sPipe_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver_4_io_rsp_rValid : std_logic;
  signal pixelTaskSolver_4_io_rsp_rData_iteration : unsigned(5 downto 0);
  signal when_Stream_l342_9 : std_logic;
  signal pixelTaskDispatcher_io_outputs_5_m2sPipe_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_5_m2sPipe_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_5_m2sPipe_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_5_m2sPipe_payload_y : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_5_rValid : std_logic;
  signal pixelTaskDispatcher_io_outputs_5_rData_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_5_rData_y : signed(27 downto 0);
  signal when_Stream_l342_10 : std_logic;
  signal pixelTaskSolver_5_io_rsp_m2sPipe_valid : std_logic;
  signal pixelTaskSolver_5_io_rsp_m2sPipe_ready : std_logic;
  signal pixelTaskSolver_5_io_rsp_m2sPipe_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver_5_io_rsp_rValid : std_logic;
  signal pixelTaskSolver_5_io_rsp_rData_iteration : unsigned(5 downto 0);
  signal when_Stream_l342_11 : std_logic;
  signal pixelTaskDispatcher_io_outputs_6_m2sPipe_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_6_m2sPipe_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_6_m2sPipe_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_6_m2sPipe_payload_y : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_6_rValid : std_logic;
  signal pixelTaskDispatcher_io_outputs_6_rData_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_6_rData_y : signed(27 downto 0);
  signal when_Stream_l342_12 : std_logic;
  signal pixelTaskSolver_6_io_rsp_m2sPipe_valid : std_logic;
  signal pixelTaskSolver_6_io_rsp_m2sPipe_ready : std_logic;
  signal pixelTaskSolver_6_io_rsp_m2sPipe_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver_6_io_rsp_rValid : std_logic;
  signal pixelTaskSolver_6_io_rsp_rData_iteration : unsigned(5 downto 0);
  signal when_Stream_l342_13 : std_logic;
  signal pixelTaskDispatcher_io_outputs_7_m2sPipe_valid : std_logic;
  signal pixelTaskDispatcher_io_outputs_7_m2sPipe_ready : std_logic;
  signal pixelTaskDispatcher_io_outputs_7_m2sPipe_payload_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_7_m2sPipe_payload_y : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_7_rValid : std_logic;
  signal pixelTaskDispatcher_io_outputs_7_rData_x : signed(27 downto 0);
  signal pixelTaskDispatcher_io_outputs_7_rData_y : signed(27 downto 0);
  signal when_Stream_l342_14 : std_logic;
  signal pixelTaskSolver_7_io_rsp_m2sPipe_valid : std_logic;
  signal pixelTaskSolver_7_io_rsp_m2sPipe_ready : std_logic;
  signal pixelTaskSolver_7_io_rsp_m2sPipe_payload_iteration : unsigned(5 downto 0);
  signal pixelTaskSolver_7_io_rsp_rValid : std_logic;
  signal pixelTaskSolver_7_io_rsp_rData_iteration : unsigned(5 downto 0);
  signal when_Stream_l342_15 : std_logic;
begin
  pixelTaskDispatcher : entity work.Dispatcher
    port map ( 
      io_input_valid => io_cmd_valid,
      io_input_ready => pixelTaskDispatcher_io_input_ready,
      io_input_payload_x => io_cmd_payload_x,
      io_input_payload_y => io_cmd_payload_y,
      io_outputs_0_valid => pixelTaskDispatcher_io_outputs_0_valid,
      io_outputs_0_ready => pixelTaskDispatcher_io_outputs_0_ready,
      io_outputs_0_payload_x => pixelTaskDispatcher_io_outputs_0_payload_x,
      io_outputs_0_payload_y => pixelTaskDispatcher_io_outputs_0_payload_y,
      io_outputs_1_valid => pixelTaskDispatcher_io_outputs_1_valid,
      io_outputs_1_ready => pixelTaskDispatcher_io_outputs_1_ready,
      io_outputs_1_payload_x => pixelTaskDispatcher_io_outputs_1_payload_x,
      io_outputs_1_payload_y => pixelTaskDispatcher_io_outputs_1_payload_y,
      io_outputs_2_valid => pixelTaskDispatcher_io_outputs_2_valid,
      io_outputs_2_ready => pixelTaskDispatcher_io_outputs_2_ready,
      io_outputs_2_payload_x => pixelTaskDispatcher_io_outputs_2_payload_x,
      io_outputs_2_payload_y => pixelTaskDispatcher_io_outputs_2_payload_y,
      io_outputs_3_valid => pixelTaskDispatcher_io_outputs_3_valid,
      io_outputs_3_ready => pixelTaskDispatcher_io_outputs_3_ready,
      io_outputs_3_payload_x => pixelTaskDispatcher_io_outputs_3_payload_x,
      io_outputs_3_payload_y => pixelTaskDispatcher_io_outputs_3_payload_y,
      io_outputs_4_valid => pixelTaskDispatcher_io_outputs_4_valid,
      io_outputs_4_ready => pixelTaskDispatcher_io_outputs_4_ready,
      io_outputs_4_payload_x => pixelTaskDispatcher_io_outputs_4_payload_x,
      io_outputs_4_payload_y => pixelTaskDispatcher_io_outputs_4_payload_y,
      io_outputs_5_valid => pixelTaskDispatcher_io_outputs_5_valid,
      io_outputs_5_ready => pixelTaskDispatcher_io_outputs_5_ready,
      io_outputs_5_payload_x => pixelTaskDispatcher_io_outputs_5_payload_x,
      io_outputs_5_payload_y => pixelTaskDispatcher_io_outputs_5_payload_y,
      io_outputs_6_valid => pixelTaskDispatcher_io_outputs_6_valid,
      io_outputs_6_ready => pixelTaskDispatcher_io_outputs_6_ready,
      io_outputs_6_payload_x => pixelTaskDispatcher_io_outputs_6_payload_x,
      io_outputs_6_payload_y => pixelTaskDispatcher_io_outputs_6_payload_y,
      io_outputs_7_valid => pixelTaskDispatcher_io_outputs_7_valid,
      io_outputs_7_ready => pixelTaskDispatcher_io_outputs_7_ready,
      io_outputs_7_payload_x => pixelTaskDispatcher_io_outputs_7_payload_x,
      io_outputs_7_payload_y => pixelTaskDispatcher_io_outputs_7_payload_y,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver_0 : entity work.PixelSolver
    port map ( 
      io_cmd_valid => pixelTaskDispatcher_io_outputs_0_m2sPipe_valid,
      io_cmd_ready => pixelTaskSolver_0_io_cmd_ready,
      io_cmd_payload_x => pixelTaskDispatcher_io_outputs_0_m2sPipe_payload_x,
      io_cmd_payload_y => pixelTaskDispatcher_io_outputs_0_m2sPipe_payload_y,
      io_rsp_valid => pixelTaskSolver_0_io_rsp_valid,
      io_rsp_ready => pixelTaskSolver_0_io_rsp_ready,
      io_rsp_payload_iteration => pixelTaskSolver_0_io_rsp_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver_1 : entity work.PixelSolver
    port map ( 
      io_cmd_valid => pixelTaskDispatcher_io_outputs_1_m2sPipe_valid,
      io_cmd_ready => pixelTaskSolver_1_io_cmd_ready,
      io_cmd_payload_x => pixelTaskDispatcher_io_outputs_1_m2sPipe_payload_x,
      io_cmd_payload_y => pixelTaskDispatcher_io_outputs_1_m2sPipe_payload_y,
      io_rsp_valid => pixelTaskSolver_1_io_rsp_valid,
      io_rsp_ready => pixelTaskSolver_1_io_rsp_ready,
      io_rsp_payload_iteration => pixelTaskSolver_1_io_rsp_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver_2 : entity work.PixelSolver
    port map ( 
      io_cmd_valid => pixelTaskDispatcher_io_outputs_2_m2sPipe_valid,
      io_cmd_ready => pixelTaskSolver_2_io_cmd_ready,
      io_cmd_payload_x => pixelTaskDispatcher_io_outputs_2_m2sPipe_payload_x,
      io_cmd_payload_y => pixelTaskDispatcher_io_outputs_2_m2sPipe_payload_y,
      io_rsp_valid => pixelTaskSolver_2_io_rsp_valid,
      io_rsp_ready => pixelTaskSolver_2_io_rsp_ready,
      io_rsp_payload_iteration => pixelTaskSolver_2_io_rsp_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver_3 : entity work.PixelSolver
    port map ( 
      io_cmd_valid => pixelTaskDispatcher_io_outputs_3_m2sPipe_valid,
      io_cmd_ready => pixelTaskSolver_3_io_cmd_ready,
      io_cmd_payload_x => pixelTaskDispatcher_io_outputs_3_m2sPipe_payload_x,
      io_cmd_payload_y => pixelTaskDispatcher_io_outputs_3_m2sPipe_payload_y,
      io_rsp_valid => pixelTaskSolver_3_io_rsp_valid,
      io_rsp_ready => pixelTaskSolver_3_io_rsp_ready,
      io_rsp_payload_iteration => pixelTaskSolver_3_io_rsp_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver_4 : entity work.PixelSolver
    port map ( 
      io_cmd_valid => pixelTaskDispatcher_io_outputs_4_m2sPipe_valid,
      io_cmd_ready => pixelTaskSolver_4_io_cmd_ready,
      io_cmd_payload_x => pixelTaskDispatcher_io_outputs_4_m2sPipe_payload_x,
      io_cmd_payload_y => pixelTaskDispatcher_io_outputs_4_m2sPipe_payload_y,
      io_rsp_valid => pixelTaskSolver_4_io_rsp_valid,
      io_rsp_ready => pixelTaskSolver_4_io_rsp_ready,
      io_rsp_payload_iteration => pixelTaskSolver_4_io_rsp_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver_5 : entity work.PixelSolver
    port map ( 
      io_cmd_valid => pixelTaskDispatcher_io_outputs_5_m2sPipe_valid,
      io_cmd_ready => pixelTaskSolver_5_io_cmd_ready,
      io_cmd_payload_x => pixelTaskDispatcher_io_outputs_5_m2sPipe_payload_x,
      io_cmd_payload_y => pixelTaskDispatcher_io_outputs_5_m2sPipe_payload_y,
      io_rsp_valid => pixelTaskSolver_5_io_rsp_valid,
      io_rsp_ready => pixelTaskSolver_5_io_rsp_ready,
      io_rsp_payload_iteration => pixelTaskSolver_5_io_rsp_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver_6 : entity work.PixelSolver
    port map ( 
      io_cmd_valid => pixelTaskDispatcher_io_outputs_6_m2sPipe_valid,
      io_cmd_ready => pixelTaskSolver_6_io_cmd_ready,
      io_cmd_payload_x => pixelTaskDispatcher_io_outputs_6_m2sPipe_payload_x,
      io_cmd_payload_y => pixelTaskDispatcher_io_outputs_6_m2sPipe_payload_y,
      io_rsp_valid => pixelTaskSolver_6_io_rsp_valid,
      io_rsp_ready => pixelTaskSolver_6_io_rsp_ready,
      io_rsp_payload_iteration => pixelTaskSolver_6_io_rsp_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelTaskSolver_7 : entity work.PixelSolver
    port map ( 
      io_cmd_valid => pixelTaskDispatcher_io_outputs_7_m2sPipe_valid,
      io_cmd_ready => pixelTaskSolver_7_io_cmd_ready,
      io_cmd_payload_x => pixelTaskDispatcher_io_outputs_7_m2sPipe_payload_x,
      io_cmd_payload_y => pixelTaskDispatcher_io_outputs_7_m2sPipe_payload_y,
      io_rsp_valid => pixelTaskSolver_7_io_rsp_valid,
      io_rsp_ready => pixelTaskSolver_7_io_rsp_ready,
      io_rsp_payload_iteration => pixelTaskSolver_7_io_rsp_payload_iteration,
      clk => clk,
      reset => reset 
    );
  pixelResultArbiter : entity work.Arbiter
    port map ( 
      io_inputs_0_valid => pixelTaskSolver_0_io_rsp_m2sPipe_valid,
      io_inputs_0_ready => pixelResultArbiter_io_inputs_0_ready,
      io_inputs_0_payload_iteration => pixelTaskSolver_0_io_rsp_m2sPipe_payload_iteration,
      io_inputs_1_valid => pixelTaskSolver_1_io_rsp_m2sPipe_valid,
      io_inputs_1_ready => pixelResultArbiter_io_inputs_1_ready,
      io_inputs_1_payload_iteration => pixelTaskSolver_1_io_rsp_m2sPipe_payload_iteration,
      io_inputs_2_valid => pixelTaskSolver_2_io_rsp_m2sPipe_valid,
      io_inputs_2_ready => pixelResultArbiter_io_inputs_2_ready,
      io_inputs_2_payload_iteration => pixelTaskSolver_2_io_rsp_m2sPipe_payload_iteration,
      io_inputs_3_valid => pixelTaskSolver_3_io_rsp_m2sPipe_valid,
      io_inputs_3_ready => pixelResultArbiter_io_inputs_3_ready,
      io_inputs_3_payload_iteration => pixelTaskSolver_3_io_rsp_m2sPipe_payload_iteration,
      io_inputs_4_valid => pixelTaskSolver_4_io_rsp_m2sPipe_valid,
      io_inputs_4_ready => pixelResultArbiter_io_inputs_4_ready,
      io_inputs_4_payload_iteration => pixelTaskSolver_4_io_rsp_m2sPipe_payload_iteration,
      io_inputs_5_valid => pixelTaskSolver_5_io_rsp_m2sPipe_valid,
      io_inputs_5_ready => pixelResultArbiter_io_inputs_5_ready,
      io_inputs_5_payload_iteration => pixelTaskSolver_5_io_rsp_m2sPipe_payload_iteration,
      io_inputs_6_valid => pixelTaskSolver_6_io_rsp_m2sPipe_valid,
      io_inputs_6_ready => pixelResultArbiter_io_inputs_6_ready,
      io_inputs_6_payload_iteration => pixelTaskSolver_6_io_rsp_m2sPipe_payload_iteration,
      io_inputs_7_valid => pixelTaskSolver_7_io_rsp_m2sPipe_valid,
      io_inputs_7_ready => pixelResultArbiter_io_inputs_7_ready,
      io_inputs_7_payload_iteration => pixelTaskSolver_7_io_rsp_m2sPipe_payload_iteration,
      io_output_valid => pixelResultArbiter_io_output_valid,
      io_output_ready => io_rsp_ready,
      io_output_payload_iteration => pixelResultArbiter_io_output_payload_iteration,
      clk => clk,
      reset => reset 
    );
  io_cmd_ready <= pixelTaskDispatcher_io_input_ready;
  process(pixelTaskDispatcher_io_outputs_0_m2sPipe_ready,when_Stream_l342)
  begin
    pixelTaskDispatcher_io_outputs_0_ready <= pixelTaskDispatcher_io_outputs_0_m2sPipe_ready;
    if when_Stream_l342 = '1' then
      pixelTaskDispatcher_io_outputs_0_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342 <= (not pixelTaskDispatcher_io_outputs_0_m2sPipe_valid);
  pixelTaskDispatcher_io_outputs_0_m2sPipe_valid <= pixelTaskDispatcher_io_outputs_0_rValid;
  pixelTaskDispatcher_io_outputs_0_m2sPipe_payload_x <= pixelTaskDispatcher_io_outputs_0_rData_x;
  pixelTaskDispatcher_io_outputs_0_m2sPipe_payload_y <= pixelTaskDispatcher_io_outputs_0_rData_y;
  pixelTaskDispatcher_io_outputs_0_m2sPipe_ready <= pixelTaskSolver_0_io_cmd_ready;
  process(pixelTaskSolver_0_io_rsp_m2sPipe_ready,when_Stream_l342_1)
  begin
    pixelTaskSolver_0_io_rsp_ready <= pixelTaskSolver_0_io_rsp_m2sPipe_ready;
    if when_Stream_l342_1 = '1' then
      pixelTaskSolver_0_io_rsp_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342_1 <= (not pixelTaskSolver_0_io_rsp_m2sPipe_valid);
  pixelTaskSolver_0_io_rsp_m2sPipe_valid <= pixelTaskSolver_0_io_rsp_rValid;
  pixelTaskSolver_0_io_rsp_m2sPipe_payload_iteration <= pixelTaskSolver_0_io_rsp_rData_iteration;
  pixelTaskSolver_0_io_rsp_m2sPipe_ready <= pixelResultArbiter_io_inputs_0_ready;
  process(pixelTaskDispatcher_io_outputs_1_m2sPipe_ready,when_Stream_l342_2)
  begin
    pixelTaskDispatcher_io_outputs_1_ready <= pixelTaskDispatcher_io_outputs_1_m2sPipe_ready;
    if when_Stream_l342_2 = '1' then
      pixelTaskDispatcher_io_outputs_1_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342_2 <= (not pixelTaskDispatcher_io_outputs_1_m2sPipe_valid);
  pixelTaskDispatcher_io_outputs_1_m2sPipe_valid <= pixelTaskDispatcher_io_outputs_1_rValid;
  pixelTaskDispatcher_io_outputs_1_m2sPipe_payload_x <= pixelTaskDispatcher_io_outputs_1_rData_x;
  pixelTaskDispatcher_io_outputs_1_m2sPipe_payload_y <= pixelTaskDispatcher_io_outputs_1_rData_y;
  pixelTaskDispatcher_io_outputs_1_m2sPipe_ready <= pixelTaskSolver_1_io_cmd_ready;
  process(pixelTaskSolver_1_io_rsp_m2sPipe_ready,when_Stream_l342_3)
  begin
    pixelTaskSolver_1_io_rsp_ready <= pixelTaskSolver_1_io_rsp_m2sPipe_ready;
    if when_Stream_l342_3 = '1' then
      pixelTaskSolver_1_io_rsp_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342_3 <= (not pixelTaskSolver_1_io_rsp_m2sPipe_valid);
  pixelTaskSolver_1_io_rsp_m2sPipe_valid <= pixelTaskSolver_1_io_rsp_rValid;
  pixelTaskSolver_1_io_rsp_m2sPipe_payload_iteration <= pixelTaskSolver_1_io_rsp_rData_iteration;
  pixelTaskSolver_1_io_rsp_m2sPipe_ready <= pixelResultArbiter_io_inputs_1_ready;
  process(pixelTaskDispatcher_io_outputs_2_m2sPipe_ready,when_Stream_l342_4)
  begin
    pixelTaskDispatcher_io_outputs_2_ready <= pixelTaskDispatcher_io_outputs_2_m2sPipe_ready;
    if when_Stream_l342_4 = '1' then
      pixelTaskDispatcher_io_outputs_2_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342_4 <= (not pixelTaskDispatcher_io_outputs_2_m2sPipe_valid);
  pixelTaskDispatcher_io_outputs_2_m2sPipe_valid <= pixelTaskDispatcher_io_outputs_2_rValid;
  pixelTaskDispatcher_io_outputs_2_m2sPipe_payload_x <= pixelTaskDispatcher_io_outputs_2_rData_x;
  pixelTaskDispatcher_io_outputs_2_m2sPipe_payload_y <= pixelTaskDispatcher_io_outputs_2_rData_y;
  pixelTaskDispatcher_io_outputs_2_m2sPipe_ready <= pixelTaskSolver_2_io_cmd_ready;
  process(pixelTaskSolver_2_io_rsp_m2sPipe_ready,when_Stream_l342_5)
  begin
    pixelTaskSolver_2_io_rsp_ready <= pixelTaskSolver_2_io_rsp_m2sPipe_ready;
    if when_Stream_l342_5 = '1' then
      pixelTaskSolver_2_io_rsp_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342_5 <= (not pixelTaskSolver_2_io_rsp_m2sPipe_valid);
  pixelTaskSolver_2_io_rsp_m2sPipe_valid <= pixelTaskSolver_2_io_rsp_rValid;
  pixelTaskSolver_2_io_rsp_m2sPipe_payload_iteration <= pixelTaskSolver_2_io_rsp_rData_iteration;
  pixelTaskSolver_2_io_rsp_m2sPipe_ready <= pixelResultArbiter_io_inputs_2_ready;
  process(pixelTaskDispatcher_io_outputs_3_m2sPipe_ready,when_Stream_l342_6)
  begin
    pixelTaskDispatcher_io_outputs_3_ready <= pixelTaskDispatcher_io_outputs_3_m2sPipe_ready;
    if when_Stream_l342_6 = '1' then
      pixelTaskDispatcher_io_outputs_3_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342_6 <= (not pixelTaskDispatcher_io_outputs_3_m2sPipe_valid);
  pixelTaskDispatcher_io_outputs_3_m2sPipe_valid <= pixelTaskDispatcher_io_outputs_3_rValid;
  pixelTaskDispatcher_io_outputs_3_m2sPipe_payload_x <= pixelTaskDispatcher_io_outputs_3_rData_x;
  pixelTaskDispatcher_io_outputs_3_m2sPipe_payload_y <= pixelTaskDispatcher_io_outputs_3_rData_y;
  pixelTaskDispatcher_io_outputs_3_m2sPipe_ready <= pixelTaskSolver_3_io_cmd_ready;
  process(pixelTaskSolver_3_io_rsp_m2sPipe_ready,when_Stream_l342_7)
  begin
    pixelTaskSolver_3_io_rsp_ready <= pixelTaskSolver_3_io_rsp_m2sPipe_ready;
    if when_Stream_l342_7 = '1' then
      pixelTaskSolver_3_io_rsp_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342_7 <= (not pixelTaskSolver_3_io_rsp_m2sPipe_valid);
  pixelTaskSolver_3_io_rsp_m2sPipe_valid <= pixelTaskSolver_3_io_rsp_rValid;
  pixelTaskSolver_3_io_rsp_m2sPipe_payload_iteration <= pixelTaskSolver_3_io_rsp_rData_iteration;
  pixelTaskSolver_3_io_rsp_m2sPipe_ready <= pixelResultArbiter_io_inputs_3_ready;
  process(pixelTaskDispatcher_io_outputs_4_m2sPipe_ready,when_Stream_l342_8)
  begin
    pixelTaskDispatcher_io_outputs_4_ready <= pixelTaskDispatcher_io_outputs_4_m2sPipe_ready;
    if when_Stream_l342_8 = '1' then
      pixelTaskDispatcher_io_outputs_4_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342_8 <= (not pixelTaskDispatcher_io_outputs_4_m2sPipe_valid);
  pixelTaskDispatcher_io_outputs_4_m2sPipe_valid <= pixelTaskDispatcher_io_outputs_4_rValid;
  pixelTaskDispatcher_io_outputs_4_m2sPipe_payload_x <= pixelTaskDispatcher_io_outputs_4_rData_x;
  pixelTaskDispatcher_io_outputs_4_m2sPipe_payload_y <= pixelTaskDispatcher_io_outputs_4_rData_y;
  pixelTaskDispatcher_io_outputs_4_m2sPipe_ready <= pixelTaskSolver_4_io_cmd_ready;
  process(pixelTaskSolver_4_io_rsp_m2sPipe_ready,when_Stream_l342_9)
  begin
    pixelTaskSolver_4_io_rsp_ready <= pixelTaskSolver_4_io_rsp_m2sPipe_ready;
    if when_Stream_l342_9 = '1' then
      pixelTaskSolver_4_io_rsp_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342_9 <= (not pixelTaskSolver_4_io_rsp_m2sPipe_valid);
  pixelTaskSolver_4_io_rsp_m2sPipe_valid <= pixelTaskSolver_4_io_rsp_rValid;
  pixelTaskSolver_4_io_rsp_m2sPipe_payload_iteration <= pixelTaskSolver_4_io_rsp_rData_iteration;
  pixelTaskSolver_4_io_rsp_m2sPipe_ready <= pixelResultArbiter_io_inputs_4_ready;
  process(pixelTaskDispatcher_io_outputs_5_m2sPipe_ready,when_Stream_l342_10)
  begin
    pixelTaskDispatcher_io_outputs_5_ready <= pixelTaskDispatcher_io_outputs_5_m2sPipe_ready;
    if when_Stream_l342_10 = '1' then
      pixelTaskDispatcher_io_outputs_5_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342_10 <= (not pixelTaskDispatcher_io_outputs_5_m2sPipe_valid);
  pixelTaskDispatcher_io_outputs_5_m2sPipe_valid <= pixelTaskDispatcher_io_outputs_5_rValid;
  pixelTaskDispatcher_io_outputs_5_m2sPipe_payload_x <= pixelTaskDispatcher_io_outputs_5_rData_x;
  pixelTaskDispatcher_io_outputs_5_m2sPipe_payload_y <= pixelTaskDispatcher_io_outputs_5_rData_y;
  pixelTaskDispatcher_io_outputs_5_m2sPipe_ready <= pixelTaskSolver_5_io_cmd_ready;
  process(pixelTaskSolver_5_io_rsp_m2sPipe_ready,when_Stream_l342_11)
  begin
    pixelTaskSolver_5_io_rsp_ready <= pixelTaskSolver_5_io_rsp_m2sPipe_ready;
    if when_Stream_l342_11 = '1' then
      pixelTaskSolver_5_io_rsp_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342_11 <= (not pixelTaskSolver_5_io_rsp_m2sPipe_valid);
  pixelTaskSolver_5_io_rsp_m2sPipe_valid <= pixelTaskSolver_5_io_rsp_rValid;
  pixelTaskSolver_5_io_rsp_m2sPipe_payload_iteration <= pixelTaskSolver_5_io_rsp_rData_iteration;
  pixelTaskSolver_5_io_rsp_m2sPipe_ready <= pixelResultArbiter_io_inputs_5_ready;
  process(pixelTaskDispatcher_io_outputs_6_m2sPipe_ready,when_Stream_l342_12)
  begin
    pixelTaskDispatcher_io_outputs_6_ready <= pixelTaskDispatcher_io_outputs_6_m2sPipe_ready;
    if when_Stream_l342_12 = '1' then
      pixelTaskDispatcher_io_outputs_6_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342_12 <= (not pixelTaskDispatcher_io_outputs_6_m2sPipe_valid);
  pixelTaskDispatcher_io_outputs_6_m2sPipe_valid <= pixelTaskDispatcher_io_outputs_6_rValid;
  pixelTaskDispatcher_io_outputs_6_m2sPipe_payload_x <= pixelTaskDispatcher_io_outputs_6_rData_x;
  pixelTaskDispatcher_io_outputs_6_m2sPipe_payload_y <= pixelTaskDispatcher_io_outputs_6_rData_y;
  pixelTaskDispatcher_io_outputs_6_m2sPipe_ready <= pixelTaskSolver_6_io_cmd_ready;
  process(pixelTaskSolver_6_io_rsp_m2sPipe_ready,when_Stream_l342_13)
  begin
    pixelTaskSolver_6_io_rsp_ready <= pixelTaskSolver_6_io_rsp_m2sPipe_ready;
    if when_Stream_l342_13 = '1' then
      pixelTaskSolver_6_io_rsp_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342_13 <= (not pixelTaskSolver_6_io_rsp_m2sPipe_valid);
  pixelTaskSolver_6_io_rsp_m2sPipe_valid <= pixelTaskSolver_6_io_rsp_rValid;
  pixelTaskSolver_6_io_rsp_m2sPipe_payload_iteration <= pixelTaskSolver_6_io_rsp_rData_iteration;
  pixelTaskSolver_6_io_rsp_m2sPipe_ready <= pixelResultArbiter_io_inputs_6_ready;
  process(pixelTaskDispatcher_io_outputs_7_m2sPipe_ready,when_Stream_l342_14)
  begin
    pixelTaskDispatcher_io_outputs_7_ready <= pixelTaskDispatcher_io_outputs_7_m2sPipe_ready;
    if when_Stream_l342_14 = '1' then
      pixelTaskDispatcher_io_outputs_7_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342_14 <= (not pixelTaskDispatcher_io_outputs_7_m2sPipe_valid);
  pixelTaskDispatcher_io_outputs_7_m2sPipe_valid <= pixelTaskDispatcher_io_outputs_7_rValid;
  pixelTaskDispatcher_io_outputs_7_m2sPipe_payload_x <= pixelTaskDispatcher_io_outputs_7_rData_x;
  pixelTaskDispatcher_io_outputs_7_m2sPipe_payload_y <= pixelTaskDispatcher_io_outputs_7_rData_y;
  pixelTaskDispatcher_io_outputs_7_m2sPipe_ready <= pixelTaskSolver_7_io_cmd_ready;
  process(pixelTaskSolver_7_io_rsp_m2sPipe_ready,when_Stream_l342_15)
  begin
    pixelTaskSolver_7_io_rsp_ready <= pixelTaskSolver_7_io_rsp_m2sPipe_ready;
    if when_Stream_l342_15 = '1' then
      pixelTaskSolver_7_io_rsp_ready <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l342_15 <= (not pixelTaskSolver_7_io_rsp_m2sPipe_valid);
  pixelTaskSolver_7_io_rsp_m2sPipe_valid <= pixelTaskSolver_7_io_rsp_rValid;
  pixelTaskSolver_7_io_rsp_m2sPipe_payload_iteration <= pixelTaskSolver_7_io_rsp_rData_iteration;
  pixelTaskSolver_7_io_rsp_m2sPipe_ready <= pixelResultArbiter_io_inputs_7_ready;
  io_rsp_valid <= pixelResultArbiter_io_output_valid;
  io_rsp_payload_iteration <= pixelResultArbiter_io_output_payload_iteration;
  process(clk, reset)
  begin
    if reset = '1' then
      pixelTaskDispatcher_io_outputs_0_rValid <= pkg_toStdLogic(false);
      pixelTaskSolver_0_io_rsp_rValid <= pkg_toStdLogic(false);
      pixelTaskDispatcher_io_outputs_1_rValid <= pkg_toStdLogic(false);
      pixelTaskSolver_1_io_rsp_rValid <= pkg_toStdLogic(false);
      pixelTaskDispatcher_io_outputs_2_rValid <= pkg_toStdLogic(false);
      pixelTaskSolver_2_io_rsp_rValid <= pkg_toStdLogic(false);
      pixelTaskDispatcher_io_outputs_3_rValid <= pkg_toStdLogic(false);
      pixelTaskSolver_3_io_rsp_rValid <= pkg_toStdLogic(false);
      pixelTaskDispatcher_io_outputs_4_rValid <= pkg_toStdLogic(false);
      pixelTaskSolver_4_io_rsp_rValid <= pkg_toStdLogic(false);
      pixelTaskDispatcher_io_outputs_5_rValid <= pkg_toStdLogic(false);
      pixelTaskSolver_5_io_rsp_rValid <= pkg_toStdLogic(false);
      pixelTaskDispatcher_io_outputs_6_rValid <= pkg_toStdLogic(false);
      pixelTaskSolver_6_io_rsp_rValid <= pkg_toStdLogic(false);
      pixelTaskDispatcher_io_outputs_7_rValid <= pkg_toStdLogic(false);
      pixelTaskSolver_7_io_rsp_rValid <= pkg_toStdLogic(false);
    elsif rising_edge(clk) then
      if pixelTaskDispatcher_io_outputs_0_ready = '1' then
        pixelTaskDispatcher_io_outputs_0_rValid <= pixelTaskDispatcher_io_outputs_0_valid;
      end if;
      if pixelTaskSolver_0_io_rsp_ready = '1' then
        pixelTaskSolver_0_io_rsp_rValid <= pixelTaskSolver_0_io_rsp_valid;
      end if;
      if pixelTaskDispatcher_io_outputs_1_ready = '1' then
        pixelTaskDispatcher_io_outputs_1_rValid <= pixelTaskDispatcher_io_outputs_1_valid;
      end if;
      if pixelTaskSolver_1_io_rsp_ready = '1' then
        pixelTaskSolver_1_io_rsp_rValid <= pixelTaskSolver_1_io_rsp_valid;
      end if;
      if pixelTaskDispatcher_io_outputs_2_ready = '1' then
        pixelTaskDispatcher_io_outputs_2_rValid <= pixelTaskDispatcher_io_outputs_2_valid;
      end if;
      if pixelTaskSolver_2_io_rsp_ready = '1' then
        pixelTaskSolver_2_io_rsp_rValid <= pixelTaskSolver_2_io_rsp_valid;
      end if;
      if pixelTaskDispatcher_io_outputs_3_ready = '1' then
        pixelTaskDispatcher_io_outputs_3_rValid <= pixelTaskDispatcher_io_outputs_3_valid;
      end if;
      if pixelTaskSolver_3_io_rsp_ready = '1' then
        pixelTaskSolver_3_io_rsp_rValid <= pixelTaskSolver_3_io_rsp_valid;
      end if;
      if pixelTaskDispatcher_io_outputs_4_ready = '1' then
        pixelTaskDispatcher_io_outputs_4_rValid <= pixelTaskDispatcher_io_outputs_4_valid;
      end if;
      if pixelTaskSolver_4_io_rsp_ready = '1' then
        pixelTaskSolver_4_io_rsp_rValid <= pixelTaskSolver_4_io_rsp_valid;
      end if;
      if pixelTaskDispatcher_io_outputs_5_ready = '1' then
        pixelTaskDispatcher_io_outputs_5_rValid <= pixelTaskDispatcher_io_outputs_5_valid;
      end if;
      if pixelTaskSolver_5_io_rsp_ready = '1' then
        pixelTaskSolver_5_io_rsp_rValid <= pixelTaskSolver_5_io_rsp_valid;
      end if;
      if pixelTaskDispatcher_io_outputs_6_ready = '1' then
        pixelTaskDispatcher_io_outputs_6_rValid <= pixelTaskDispatcher_io_outputs_6_valid;
      end if;
      if pixelTaskSolver_6_io_rsp_ready = '1' then
        pixelTaskSolver_6_io_rsp_rValid <= pixelTaskSolver_6_io_rsp_valid;
      end if;
      if pixelTaskDispatcher_io_outputs_7_ready = '1' then
        pixelTaskDispatcher_io_outputs_7_rValid <= pixelTaskDispatcher_io_outputs_7_valid;
      end if;
      if pixelTaskSolver_7_io_rsp_ready = '1' then
        pixelTaskSolver_7_io_rsp_rValid <= pixelTaskSolver_7_io_rsp_valid;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if pixelTaskDispatcher_io_outputs_0_ready = '1' then
        pixelTaskDispatcher_io_outputs_0_rData_x <= pixelTaskDispatcher_io_outputs_0_payload_x;
        pixelTaskDispatcher_io_outputs_0_rData_y <= pixelTaskDispatcher_io_outputs_0_payload_y;
      end if;
      if pixelTaskSolver_0_io_rsp_ready = '1' then
        pixelTaskSolver_0_io_rsp_rData_iteration <= pixelTaskSolver_0_io_rsp_payload_iteration;
      end if;
      if pixelTaskDispatcher_io_outputs_1_ready = '1' then
        pixelTaskDispatcher_io_outputs_1_rData_x <= pixelTaskDispatcher_io_outputs_1_payload_x;
        pixelTaskDispatcher_io_outputs_1_rData_y <= pixelTaskDispatcher_io_outputs_1_payload_y;
      end if;
      if pixelTaskSolver_1_io_rsp_ready = '1' then
        pixelTaskSolver_1_io_rsp_rData_iteration <= pixelTaskSolver_1_io_rsp_payload_iteration;
      end if;
      if pixelTaskDispatcher_io_outputs_2_ready = '1' then
        pixelTaskDispatcher_io_outputs_2_rData_x <= pixelTaskDispatcher_io_outputs_2_payload_x;
        pixelTaskDispatcher_io_outputs_2_rData_y <= pixelTaskDispatcher_io_outputs_2_payload_y;
      end if;
      if pixelTaskSolver_2_io_rsp_ready = '1' then
        pixelTaskSolver_2_io_rsp_rData_iteration <= pixelTaskSolver_2_io_rsp_payload_iteration;
      end if;
      if pixelTaskDispatcher_io_outputs_3_ready = '1' then
        pixelTaskDispatcher_io_outputs_3_rData_x <= pixelTaskDispatcher_io_outputs_3_payload_x;
        pixelTaskDispatcher_io_outputs_3_rData_y <= pixelTaskDispatcher_io_outputs_3_payload_y;
      end if;
      if pixelTaskSolver_3_io_rsp_ready = '1' then
        pixelTaskSolver_3_io_rsp_rData_iteration <= pixelTaskSolver_3_io_rsp_payload_iteration;
      end if;
      if pixelTaskDispatcher_io_outputs_4_ready = '1' then
        pixelTaskDispatcher_io_outputs_4_rData_x <= pixelTaskDispatcher_io_outputs_4_payload_x;
        pixelTaskDispatcher_io_outputs_4_rData_y <= pixelTaskDispatcher_io_outputs_4_payload_y;
      end if;
      if pixelTaskSolver_4_io_rsp_ready = '1' then
        pixelTaskSolver_4_io_rsp_rData_iteration <= pixelTaskSolver_4_io_rsp_payload_iteration;
      end if;
      if pixelTaskDispatcher_io_outputs_5_ready = '1' then
        pixelTaskDispatcher_io_outputs_5_rData_x <= pixelTaskDispatcher_io_outputs_5_payload_x;
        pixelTaskDispatcher_io_outputs_5_rData_y <= pixelTaskDispatcher_io_outputs_5_payload_y;
      end if;
      if pixelTaskSolver_5_io_rsp_ready = '1' then
        pixelTaskSolver_5_io_rsp_rData_iteration <= pixelTaskSolver_5_io_rsp_payload_iteration;
      end if;
      if pixelTaskDispatcher_io_outputs_6_ready = '1' then
        pixelTaskDispatcher_io_outputs_6_rData_x <= pixelTaskDispatcher_io_outputs_6_payload_x;
        pixelTaskDispatcher_io_outputs_6_rData_y <= pixelTaskDispatcher_io_outputs_6_payload_y;
      end if;
      if pixelTaskSolver_6_io_rsp_ready = '1' then
        pixelTaskSolver_6_io_rsp_rData_iteration <= pixelTaskSolver_6_io_rsp_payload_iteration;
      end if;
      if pixelTaskDispatcher_io_outputs_7_ready = '1' then
        pixelTaskDispatcher_io_outputs_7_rData_x <= pixelTaskDispatcher_io_outputs_7_payload_x;
        pixelTaskDispatcher_io_outputs_7_rData_y <= pixelTaskDispatcher_io_outputs_7_payload_y;
      end if;
      if pixelTaskSolver_7_io_rsp_ready = '1' then
        pixelTaskSolver_7_io_rsp_rData_iteration <= pixelTaskSolver_7_io_rsp_payload_iteration;
      end if;
    end if;
  end process;

end arch;

