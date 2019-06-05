require './lib/test_helper'
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
    expected =  "040619"
    actual = @enigma.get_date
    assert_equal expected, actual
  end

  def test_random_number_generator_method
    expected = 5
    actual = @enigma.random_number_generator.to_s.length
    assert_equal expected, actual
  end

  def test_enigma_class_can_encrypt
    expected = {:encryption=>"lgwmsbgpvno", :key=> "54321", :date=>"040619"}
    actual = @enigma.encrypt("hello world", "54321", "040619")
    assert_equal expected, actual

    expected = {:encryption=>"lgwmsbgpvno", :key=>"54321", :date=>"040619"}
    Enigma.any_instance.stubs(:get_date).returns("040619")
    actual = @enigma.encrypt("hello world", 54321)
    assert_equal expected, actual

    expected = {:encryption=>"lgwmsbgpvno", :key=>"54321", :date=>"040619"}
    Enigma.any_instance.stubs(:get_date).returns("040619")
    Enigma.any_instance.stubs(:random_number_generator).returns("54321")
    actual = @enigma.encrypt("hello world")
    assert_equal expected, actual
  end

  def test_enigma_class_can_decrypt
    expected = {:decryption=>"hello world", :key=>"54321", :date=>"040619"}
    Enigma.any_instance.stubs(:get_date).returns("040619")
    actual = @enigma.decrypt("lgwmsbgpvno", 54321)
    assert_equal expected, actual
  end
  #   expected = {:decryption=>"hello world", :key=>"54321", :date=>"040619"}
  #   actual = @enigma.decrypt(54321)
  #   assert_equal expected, actual
  # end
end
