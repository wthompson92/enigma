require './lib/helper_module'
require 'date'
require 'pry'
class Enigma

  def get_date
    time = Time.now.strftime("%d/%m/%Y").split("/")
    time.map do |nums|
      if nums.length > 2
        then nums[2, 3]
      else
        nums
      end
    end.join
  end

  def random_number_generator
    rand(10000...99999)
  end

  def encrypt(message, key = nil, date = nil)
    if key == nil
      key = random_number_generator
    elsif date == nil
      date = get_date
    encrypt = Encrypt.new(message, key, date)
    encrypt_hash = {encryption: encrypt.encode, key: key.to_s, date: date}
    end
  end

  def decrypt(message, key, date = nil)
    if key == nil
      key = random_number_generator
    elsif date == nil
      date = get_date
    decrypt = Decrypt.new(message, key, date)
    encrypt_hash = {decryption: decrypt.decode, key: key.to_s, date: date}
    end
  end
end
