-- Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
-- Component : UartCtrlRx
-- Git hash  : 89d7543c7219f82d1991c9174f1b313aba4435ca

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is
  type UartCtrlRxState is (IDLE,START,DATA,STOP);

  function pkg_mux (sel : std_logic; one : UartCtrlRxState; zero : UartCtrlRxState) return UartCtrlRxState;
  function pkg_toStdLogicVector_native (value : UartCtrlRxState) return std_logic_vector;
  function pkg_toUartCtrlRxState_native (value : std_logic_vector(1 downto 0)) return UartCtrlRxState;
end pkg_enum;

package body pkg_enum is
  function pkg_mux (sel : std_logic; one : UartCtrlRxState; zero : UartCtrlRxState) return UartCtrlRxState is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_toUartCtrlRxState_native (value : std_logic_vector(1 downto 0)) return UartCtrlRxState is
  begin
    case value is
      when "00" => return IDLE;
      when "01" => return START;
      when "10" => return DATA;
      when "11" => return STOP;
      when others => return IDLE;
    end case;
  end;
  function pkg_toStdLogicVector_native (value : UartCtrlRxState) return std_logic_vector is
  begin
    case value is
      when IDLE => return "00";
      when START => return "01";
      when DATA => return "10";
      when STOP => return "11";
      when others => return "00";
    end case;
  end;
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


entity UartCtrlRx is
  port(
    io_rxd : in std_logic;
    io_samplingTick : in std_logic;
    io_read_valid : out std_logic;
    io_read_payload : out std_logic_vector(7 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end UartCtrlRx;

architecture arch of UartCtrlRx is
  signal zz_sampler_value : std_logic;
  signal zz_sampler_value_1 : std_logic;
  signal zz_sampler_value_2 : std_logic;
  signal zz_sampler_value_3 : std_logic;
  signal zz_sampler_value_4 : std_logic;
  signal zz_sampler_value_5 : std_logic;
  signal zz_sampler_value_6 : std_logic;

  signal sampler_samples_0 : std_logic;
  signal sampler_samples_1 : std_logic;
  signal sampler_samples_2 : std_logic;
  signal sampler_samples_3 : std_logic;
  signal sampler_samples_4 : std_logic;
  signal zz_sampler_samples_0 : std_logic;
  signal zz_sampler_samples_0_1 : std_logic;
  signal zz_sampler_samples_1 : std_logic;
  signal zz_sampler_samples_2 : std_logic;
  signal zz_sampler_samples_3 : std_logic;
  signal zz_sampler_samples_4 : std_logic;
  signal sampler_value : std_logic;
  signal sampler_tick : std_logic;
  signal bitTimer_counter : unsigned(2 downto 0);
  signal bitTimer_recenter : std_logic;
  signal bitTimer_tick : std_logic;
  signal when_UartCtrlRx_l49 : std_logic;
  signal bitCounter_value : unsigned(2 downto 0);
  signal bitCounter_clear : std_logic;
  signal stateMachine_state : UartCtrlRxState;
  signal stateMachine_buffer : std_logic_vector(7 downto 0);
  signal when_UartCtrlRx_l84 : std_logic;
  signal when_UartCtrlRx_l98 : std_logic;
begin
  zz_sampler_value <= ((((pkg_toStdLogic(false) or ((zz_sampler_value_1 and sampler_samples_1) and sampler_samples_2)) or (((zz_sampler_value_2 and sampler_samples_0) and sampler_samples_1) and sampler_samples_3)) or (((pkg_toStdLogic(true) and sampler_samples_0) and sampler_samples_2) and sampler_samples_3)) or (((pkg_toStdLogic(true) and sampler_samples_1) and sampler_samples_2) and sampler_samples_3));
  zz_sampler_value_3 <= (((pkg_toStdLogic(true) and sampler_samples_0) and sampler_samples_1) and sampler_samples_4);
  zz_sampler_value_4 <= ((pkg_toStdLogic(true) and sampler_samples_0) and sampler_samples_2);
  zz_sampler_value_5 <= (pkg_toStdLogic(true) and sampler_samples_1);
  zz_sampler_value_6 <= pkg_toStdLogic(true);
  zz_sampler_value_1 <= (pkg_toStdLogic(true) and sampler_samples_0);
  zz_sampler_value_2 <= pkg_toStdLogic(true);
  sampler_samples_0 <= zz_sampler_samples_0_1;
  sampler_samples_1 <= zz_sampler_samples_1;
  sampler_samples_2 <= zz_sampler_samples_2;
  sampler_samples_3 <= zz_sampler_samples_3;
  sampler_samples_4 <= zz_sampler_samples_4;
  process(stateMachine_state,when_UartCtrlRx_l84)
  begin
    bitTimer_recenter <= pkg_toStdLogic(false);
    case stateMachine_state is
      when pkg_enum.IDLE =>
        if when_UartCtrlRx_l84 = '1' then
          bitTimer_recenter <= pkg_toStdLogic(true);
        end if;
      when pkg_enum.START =>
      when pkg_enum.DATA =>
      when others =>
    end case;
  end process;

  process(sampler_tick,when_UartCtrlRx_l49)
  begin
    bitTimer_tick <= pkg_toStdLogic(false);
    if sampler_tick = '1' then
      if when_UartCtrlRx_l49 = '1' then
        bitTimer_tick <= pkg_toStdLogic(true);
      end if;
    end if;
  end process;

  when_UartCtrlRx_l49 <= pkg_toStdLogic(bitTimer_counter = pkg_unsigned("000"));
  process(stateMachine_state,bitTimer_tick)
  begin
    bitCounter_clear <= pkg_toStdLogic(false);
    case stateMachine_state is
      when pkg_enum.IDLE =>
      when pkg_enum.START =>
        if bitTimer_tick = '1' then
          bitCounter_clear <= pkg_toStdLogic(true);
        end if;
      when pkg_enum.DATA =>
      when others =>
    end case;
  end process;

  process(stateMachine_state,bitTimer_tick)
  begin
    io_read_valid <= pkg_toStdLogic(false);
    case stateMachine_state is
      when pkg_enum.IDLE =>
      when pkg_enum.START =>
      when pkg_enum.DATA =>
      when others =>
        if bitTimer_tick = '1' then
          io_read_valid <= pkg_toStdLogic(true);
        end if;
    end case;
  end process;

  when_UartCtrlRx_l84 <= (sampler_tick and (not sampler_value));
  when_UartCtrlRx_l98 <= pkg_toStdLogic(bitCounter_value = pkg_unsigned("111"));
  io_read_payload <= stateMachine_buffer;
  process(clk, reset)
  begin
    if reset = '1' then
      zz_sampler_samples_0 <= pkg_toStdLogic(true);
      zz_sampler_samples_0_1 <= pkg_toStdLogic(true);
      zz_sampler_samples_1 <= pkg_toStdLogic(true);
      zz_sampler_samples_2 <= pkg_toStdLogic(true);
      zz_sampler_samples_3 <= pkg_toStdLogic(true);
      zz_sampler_samples_4 <= pkg_toStdLogic(true);
      sampler_value <= pkg_toStdLogic(true);
      sampler_tick <= pkg_toStdLogic(false);
      stateMachine_state <= pkg_enum.IDLE;
    elsif rising_edge(clk) then
      if io_samplingTick = '1' then
        zz_sampler_samples_0 <= io_rxd;
      end if;
      if io_samplingTick = '1' then
        zz_sampler_samples_0_1 <= zz_sampler_samples_0;
      end if;
      if io_samplingTick = '1' then
        zz_sampler_samples_1 <= zz_sampler_samples_0_1;
      end if;
      if io_samplingTick = '1' then
        zz_sampler_samples_2 <= zz_sampler_samples_1;
      end if;
      if io_samplingTick = '1' then
        zz_sampler_samples_3 <= zz_sampler_samples_2;
      end if;
      if io_samplingTick = '1' then
        zz_sampler_samples_4 <= zz_sampler_samples_3;
      end if;
      sampler_value <= ((((((zz_sampler_value or zz_sampler_value_3) or (zz_sampler_value_4 and sampler_samples_4)) or ((zz_sampler_value_5 and sampler_samples_2) and sampler_samples_4)) or (((zz_sampler_value_6 and sampler_samples_0) and sampler_samples_3) and sampler_samples_4)) or (((pkg_toStdLogic(true) and sampler_samples_1) and sampler_samples_3) and sampler_samples_4)) or (((pkg_toStdLogic(true) and sampler_samples_2) and sampler_samples_3) and sampler_samples_4));
      sampler_tick <= io_samplingTick;
      case stateMachine_state is
        when pkg_enum.IDLE =>
          if when_UartCtrlRx_l84 = '1' then
            stateMachine_state <= pkg_enum.START;
          end if;
        when pkg_enum.START =>
          if bitTimer_tick = '1' then
            stateMachine_state <= pkg_enum.DATA;
          end if;
        when pkg_enum.DATA =>
          if bitTimer_tick = '1' then
            if when_UartCtrlRx_l98 = '1' then
              stateMachine_state <= pkg_enum.STOP;
            end if;
          end if;
        when others =>
          if bitTimer_tick = '1' then
            stateMachine_state <= pkg_enum.IDLE;
          end if;
      end case;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if sampler_tick = '1' then
        bitTimer_counter <= (bitTimer_counter - pkg_unsigned("001"));
      end if;
      if bitTimer_recenter = '1' then
        bitTimer_counter <= pkg_unsigned("010");
      end if;
      if bitTimer_tick = '1' then
        bitCounter_value <= (bitCounter_value + pkg_unsigned("001"));
      end if;
      if bitCounter_clear = '1' then
        bitCounter_value <= pkg_unsigned("000");
      end if;
      case stateMachine_state is
        when pkg_enum.IDLE =>
        when pkg_enum.START =>
        when pkg_enum.DATA =>
          if bitTimer_tick = '1' then
            stateMachine_buffer(to_integer(bitCounter_value)) <= sampler_value;
          end if;
        when others =>
      end case;
    end if;
  end process;

end arch;

