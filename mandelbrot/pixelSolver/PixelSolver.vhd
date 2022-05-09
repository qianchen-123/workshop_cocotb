-- Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
-- Component : PixelSolver
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

