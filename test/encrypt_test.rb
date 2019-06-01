require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require './lib/encrypt'

class EncryptTest < Minitest::Test
  def setup

  end
  def test_encrypt_class_exists
    expected =
    actual =
    assert_instance_of expected, actual
  end

  def test_encrypt_class_has_attributes
    expected =
    actual =
    assert_equal expected, actual
  end
end
