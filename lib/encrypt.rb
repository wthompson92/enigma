class Encrypt

  def initialize(message, key)
    @message = message
    @key = key
  end

  def message_to_ord_values
    chars = @message.downcase.chars
    ords = chars.map {|char| char.ord}
    ords.map do |num|
      if num.to_i == 32
        then num.to_i - 5
      else
        num.to_i - 96
      end
    end
  end

  def create_alphabet_ordninal_value_hash
    alpha_num = Hash.new
    alphabet = ('a'..'z').to_a << " "
    numbers =  (1..27)
    zipped = alphabet.zip(numbers)
    zipped.map do |combo|
    alpha_num[combo[1]] = combo[0]
    end
    alpha_num
  end

  def random_number_generator
    rand(10000...99999)
  end

  def create_key
    key_nums = @key.to_s.split("")
    chunked_nums = []
    chunked_nums << (key_nums[0] + key_nums[1])
    chunked_nums << (key_nums[1] + key_nums[2])
    chunked_nums << (key_nums[2] + key_nums[3])
    chunked_nums << (key_nums[3] + key_nums[4])
  end

  def loop_key
    number = (message_to_ord_values.count / 4).ceil + 1
    repeat = []
    number.times do
      create_key.each do |key|
        repeat << key
      end
    end
    repeat
  end

  def create_offset_keys
  end


def shift
  ords_and_keys = message_to_ord_values.zip(loop_key)
  ords_and_keys.map do |o_k|
  ord = o_k.first.to_i + o_k.last.to_i
      if ord > 27
        then  ord % 27
      else ord
      end
    end
  end


def shift_to_hash
  shift.map do |key|
    create_alphabet_ordninal_value_hash[key]
  end.join
  end
end
