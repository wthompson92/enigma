require './lib/enigma'
require './lib/encrypt'
require './lib/helper_module'

message = File.open(ARGV[0], "r")
read = message.read.delete!("\n").split(",")
enigma = Enigma.new
encrypted_message = enigma.encrypt(read.first, read[1], read[2])
encrypted = File.open(ARGV[1], "w")
encrypted.write(encrypted_message[:encryption])
encrypted.close
puts "Created '#{ARGV[1]}' with the key:#{encrypted_message[:key]} and date:#{encrypted_message[:date]}"
