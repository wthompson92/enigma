require './lib/test_helper'
require './lib/decrypt'
require './lib/enigma'

class DecryptTest < Minitest::Test
  def setup
    @decrypt_enigma = Decrypt.new("lgwmsbgpvno", 54321, "040619")
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
end
