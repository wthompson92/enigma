require './module/helper_module'
require './module/reverse_modulo'
class Decrypt
    include HelperModule
    include ReverseModulo

  def initialize(message, key, date)
    @message = message
    @key = key.to_i
    @date = date
  end

  def unshift
    nums_and_keys = message_chars_to_alpha_nums.zip(loop_offset)
    a = nums_and_keys.map do |o_k|
    ord = reverse_modulo(27, o_k.first, o_k.last)
    end
  end

  def decode
    a = unshift.map do |key|
    create_alphabet_ordninal_value_hash[28] = ' '
    create_alphabet_ordninal_value_hash[key]
    end.join
  end
end
