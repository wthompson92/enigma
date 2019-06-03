require './lib/helper_module'

class Encrypt
  include HelperModule
  def initialize(message, key)
    @message = message
    @key = key
  end

  def random_number_generator
    rand(10000...99999)
  end

  def shift
    ords_and_keys = message_ords_to_alpha_nums.zip(loop_offset)
    ords_and_keys.map do |o_k|
      ord = o_k.first.to_i + o_k.last.to_i
      if ord > 27
        then  ord % 27
      else ord
      end
    end
  end

  def encode
    shift.map do |key|
      create_alphabet_ordninal_value_hash[key]
    end.join
  end

  def encrypt
    encrypt_hash = {encryption: encode, key: @key.to_s, date: get_date}
  end
end
