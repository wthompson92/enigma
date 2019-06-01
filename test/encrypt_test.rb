require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require './lib/encrypt'
require 'date'

class EncryptTest < Minitest::Test
  def setup
    @enigma = Encrypt.new("hello world", 12345)
  end
  def test_encrypt_class_exists
    expected = Encrypt
    actual = @enigma
    assert_instance_of expected, actual
  end

  def test_encrypt_class_has_attributes
    expected =  @enigma.create_key
    actual =
    assert_equal expected, actual
  end

  def test_it_can_encrypt
    skip
    expected = {
    encryption: "keder ohulw",
    key: "02715",
    date: "040895"
    }
    actual = @enigma.encrypt("hello world", "02715", "040895")
  end

end
