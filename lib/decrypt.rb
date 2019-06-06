require './lib/helper_module'
class Decrypt
    include HelperModule

  def initialize(message, key, date)
    @message = message
    @key = key.to_i
    @date = date
  end

  def unshift
    nums_and_keys = message_chars_to_alpha_nums.zip(loop_offset)
    a = nums_and_keys.map do |o_k|
    case
    when (o_k.last > 27) && (o_k.last <= 54)
      then ord =((o_k.first.to_i + 27) - o_k.last.to_i)
      if ord == 0
        ord = 27 - ord
      elsif ord < 0
        ord = 27 + ord
      else
        ord
      end
    when (o_k.last > 54) && (o_k.last <= 81)
      then ord = ((o_k.first.to_i + 54) - o_k.last.to_i)
        if ord == 0
          ord = 27 - ord
        elsif ord < 0
          ord = 27 + ord
        else
          ord
        end
    when (o_k.last > 81) && (o_k.last <= 108)
      then ord =((o_k.first.to_i + 81) - o_k.last.to_i)
        if ord == 0
          ord = 27 - ord
        elsif ord < 0
          ord = 27 + ord
        else
        ord
        end
    when (o_k.last > 108) && (o_k.last <= 135)
      then ord = ((o_k.first.to_i + 108) - o_k.last.to_i)
        if ord == 0
          ord = 27 - ord
        elsif ord < 0
          ord = 27 + ord
        else
          ord
        end
     when o_k.last < 27
       then ord = (o_k.first.to_i - o_k.last.to_i).abs
        if ord <= 0
          ord = 27 - ord
        else
          ord
        end
      end
    end
  end

  def decode
    a = unshift.map do |key|
      create_alphabet_ordninal_value_hash[key]
    end.join
  end
end
