require './lib/enigma'
require './lib/decrypt'
require './module/helper_module'

message = File.open(ARGV[0], "r")
read = message.read
enigma = Enigma.new
decrypted_message = enigma.decrypt(read, ARGV[2], ARGV[3])
decrypted = File.open(ARGV[1], "w")
decrypted.write(decrypted_message[:decryption])
decrypted.close
puts "Created '#{ARGV[1]}' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
