require './test/test_helper'
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
    expected =  "050619"
    actual = @enigma.get_date
    assert_equal expected, actual
  end

  def test_random_number_generator_method
    expected = Integer
    actual = @enigma.random_number_generator
    assert_instance_of expected, actual
  end

  def test_enigma_class_can_encrypt
    expected = {:encryption=>"mrmctmxfwye", :key=> "81765", :date=>"050619"}
    actual = @enigma.encrypt("hello world", "81765", "050619")
    assert_equal expected, actual

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

    expected = {:encryption=>"dsijkntmnza", :key=>"99999", :date=>"050619"}
    Enigma.any_instance.stubs(:random_number_generator).returns("99999")
    Enigma.any_instance.stubs(:get_date).returns("050619")
    actual = @enigma.encrypt("hello world")
    assert_equal expected, actual

    expected = {:encryption=>"bsofinzilzg", :key=>"98241", :date=>"040619"}
    Enigma.any_instance.stubs(:get_date).returns("040619")
    Enigma.any_instance.stubs(:random_number_generator).returns("98241")
    actual = @enigma.encrypt("hello world")
    assert_equal expected, actual
  end

  def test_enigma_class_can_decrypt
    expected = {:decryption=>"hello world", :key=>"54321", :date=>"040619"}
    Enigma.any_instance.stubs(:get_date).returns("040619")
    actual = @enigma.decrypt("lgwmsbgpvno", 54321)
    assert_equal expected, actual

    expected = {:decryption=>"hello world", :key=>"61941", :date=>"050619"}
    Enigma.any_instance.stubs(:get_date).returns("050619")
    Enigma.any_instance.stubs(:random_number_generator).returns("61941")
    actual = @enigma.decrypt("ttdf ooic w", 61941)
    assert_equal expected, actual

    expected = {:decryption=>"hello world", :key=>"54321", :date=>"040619"}
    Enigma.any_instance.stubs(:get_date).returns("040619")
    actual = @enigma.decrypt("lgwmsbgpvno", 54321)
    assert_equal expected, actual
  end
end
