require './lib/test_helper'
require './lib/decrypt'
require './lib/encrypt'
require 'date'

class EncryptTest < Minitest::Test
  def setup
    @enigma = Encrypt.new("hello world", 54321, "040619")
  end

  def test_encrypt_class_exists
    expected = Encrypt
    actual = @enigma
    assert_instance_of expected, actual
  end

  def test_it_can_get_give_letters_int_values
    expected = [8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4]
    actual = @enigma.message_ords_to_alpha_nums
    assert_equal expected, actual
  end

  def test_it_can_create_alpha_hash
    expected = {1 => "a", 2 => "b", 3 => "c", 4 => "d", 5 => "e", 6 => "f", 7 => "g", 8 => "h", 9 => "i", 10 => "j", 11 => "k", 12 => "l", 13 => "m", 14 => "n", 15 => "o", 16 => "p", 17 => "q", 18 => "r", 19 => "s" , 20  => "t", 21 => "u", 22 => "v", 23 => "w", 24 => "x", 25 => "y", 26 => "z", 27 => " ",
    }
    actual = @enigma.create_alphabet_ordninal_value_hash
    assert_equal expected, actual
  end

  def test_it_can_create_key
    expected = ["54", "43", "32", "21"]
    actual = @enigma.create_key
    assert_equal expected, actual
  end

  def test_it_can_create_date
    expected = ["04", "40", "06", "61"]
    actual = @enigma.create_date
    assert_equal expected, actual
  end

  def test_it_can_create_offset
    expected = [58, 83, 38, 82]
    actual = @enigma.create_offset
    assert_equal expected, actual
  end

  def test_loop_offset_method
    expected = [58, 83, 38, 82, 58, 83, 38, 82, 58, 83, 38, 82]
    actual = @enigma.loop_offset
    assert_equal expected, actual
  end

  def test_shift_method
    expected = [12, 7, 23, 13, 19, 2, 7, 16, 22, 14, 15]
    actual = @enigma.shift
    assert_equal  expected, actual
  end

  def test_encode_method
    expected = "lgwmsbgpvno"
    actual = @enigma.encode
    assert_equal expected, actual
  end
end
