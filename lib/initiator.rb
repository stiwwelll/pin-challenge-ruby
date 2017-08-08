require "pry"
require "rb-readline"
require_relative "keypad_handler"

result = nil
bathroom_code = Array.new
keypad = KeypadHandler.new(part)

puts "If you want the solution with the pinpad you initially expected, please enter 1. For the actual one please enter 2:"
part_value = gets.chomp
part_value == "1" ? part = KEYPAD_MAP_1 : part = KEYPAD_MAP_2

puts "Please enter the sequence you got from the front desk. Submit by entering END and hit return:"
$/ = "END"
sequence = STDIN.gets
sequence_array = sequence.chomp("END").split("\n")
n = sequence_array.length

n.times do |i|
  sequence = sequence_array[i].split("")
  i == 0 ? base_num = 5 : base_num = result
  result = keypad.get_next_sequence_digit(base_num ,sequence)
  bathroom_code.push result
end

puts "Your bathroom code is #{bathroom_code.join("")}. Enjoy your stay!"
