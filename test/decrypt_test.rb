require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require './lib/encrypt'

class DecryptTest < Minitest::Test
  def setup
    encrypt = Encrypt.new("hello world", 54321)
    @decrypt_enigma = Decrypt.new(encrypt.encrypt)
  end

  def test_decrypt_class_exists
    expected = Decrypt
    actual = @decrypt_enigma
    assert_instance_of expected, actual
  end

  def test_unshift_method
    expected = [19, 22, 15, 15, 12, 0, 4, 12, 9, 15, 23]
    actual = @decrypt_enigma.unshift
    assert_equal expected, actual
  end

  def test_refine_method
    expected = [8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4]
    actual = @decrypt_enigma.refine
    assert_equal expected, actual
  end

  def test_decode_method
    expected = "hello world"
    actual = @decrypt_enigma.decode
    assert_equal expected, actual
  end

  def test_decrypt_method
    expected = {:encryption=>"hello world", :key=>"54321", :date=>"030619"}
    actual = @decrypt_enigma.decrypt
    assert_equal expected, actual
  end
end
