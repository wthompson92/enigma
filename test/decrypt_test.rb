require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require './lib/encrypt'

class DecryptTest < Minitest::Test
  def setup
    enigma = Encrypt.new("hello world", 54321)
    @decrypt_enigma = Decrypt.new(enigma.encrypt)
  end

  def test_decrypt_class_exists
    expected = Decrypt
    actual = @decrypt_enigma
    assert_instance_of expected, actual
  end

  def test_decrypt_class_exists
    expected = Decrypt
    actual = @decrypt_enigma.decode
    assert_equal expected, actual
  end
end
