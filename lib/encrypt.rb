class Encrypt

  def initialize(message)
    @message = message
  end

  def message_to_ord_values
    chars = @message.downcase.chars
    chars.map {|char| char.ord}
  end

  def random_number_generator
  end

  def create_offset_keys
  end
end
