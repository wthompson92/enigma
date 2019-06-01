require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require './lib/encrypt'

class DecryptTest < Minitest::Test
  def setup
    @enigma = Decrypt.new("hello world")
  end
  def test_decrypt_class_exists
    expected =
    actual = @enigma.create_alphabet
    assert_instance_of expected, actual
  end

  def test_decrypt_class_has_attributes
    expected =
    actual =
    assert_equal expected, actual
  end
end
