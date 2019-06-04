require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'
require './lib/encrypt'
require './lib/enigma'
require 'date'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_enigma_class_exists
    expected = Enigma
    actual = @enigma
    assert_instance_of expected, actual
  end

  def test_enigma_it_can_get_the_date
    expected =  {:encryption=>"kxwmrsgpudo", :key=>"54321", :date=>"030619"}
    actual = @enigma.encrypt("hello world", 54321)
    assert_equal expected, actual
  end

  def test_random_number_generator_method
    skip
    expected =
    actual =
    assert_equal expected, actual
  end

  def test_enigma_class_can_encrypt
    expected =  {:encryption=>"kxwmrsgpudo", :key=>"54321", :date=>"030619"}
    actual = @enigma.encrypt("hello world", 54321)
    assert_equal expected, actual
  end

  def test_enigma_class_can_decrypt
    expected = {:decryption=>"hello world", :key=>"54321", :date=>"030619"}
    actual = @enigma.decrypt("kxwmrsgpudo", 54321)
    assert_equal expected, actual
  end
end
