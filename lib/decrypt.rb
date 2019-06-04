require './lib/helper_module'
class Decrypt
  include HelperModule

  def initialize(hash)
    @message = hash[:encryption]
    @key = hash[:key]
    @date = hash[:date]
  end

  def unshift
    ords_and_keys = message_ords_to_alpha_nums.zip(loop_offset)
    ords_and_keys.map do |o_k|
      ord = o_k.last.to_i - o_k.first.to_i
      if ord > 27
        then  ord % 27
      else ord
      end
    end
  end

  def refine
    unshift.map do |value|
      if value == 27
        then value
      else
        27 - value
      end
    end
  end

  def decode
    refine.map do |key|
      create_alphabet_ordninal_value_hash[key]
    end.join

  def decrypt
    encrypt_hash = {encryption: decode, key: @key, date: get_date}
    end
  end
end
