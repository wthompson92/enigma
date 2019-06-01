class Encrypt

  def initialize(message, key)
    @message = message
    @key = key
  end

  def random_number_generator
    rand(10000...99999)
  end

  def create_alphabet_ordninal_value_hash
    alpha_num = Hash.new
    alphabet = ('a'..'z').to_a << " "
    numbers =  (alphabet.map {|char| char.ord})
    zipped = alphabet.zip(numbers)
    zipped.map do |combo|
    alpha_num[combo[1]] = combo[0]
    end
    alpha_num
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

  def shift
    ords_and_keys = message_to_ord_values.zip(loop_key)
    ords_and_keys.map do |o_k|
    o_k.first.to_i + o_k.last.to_i
    end
  end



  def message_to_ord_values
    chars = @message.downcase.chars
    ords = chars.map {|char| char.ord}
  end

  def create_offset_keys
  end
end
