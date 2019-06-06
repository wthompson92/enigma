require './module/helper_module'
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
      case
      when date == nil && key == nil
         date = get_date
         key = random_number_generator
      when date == nil then date = get_date
      when key == nil then key = random_number_generator
      when key != nil then key
      when date != nil then key
      end
      encrypt = Encrypt.new(message, key, date)
      encrypt_hash = {encryption: encrypt.encode, key:  key.to_s, date: date}
    end

  def decrypt(message, key, date = nil)
    if date == nil
        date = get_date
      end
    decrypt = Decrypt.new(message, key, date)
    decrypt_hash = {decryption: decrypt.decode, key: key.to_s, date: date}
  end
end
