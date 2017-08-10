require_relative "keypad_handler"
require_relative "../constants/keymap"

sequence_number = []
bathroom_code = []

puts "If you want the solution with the pinpad you initially expected, please enter 1. For the actual one please enter 2:"
part_value = gets.chomp
part = part_value == "1" ? KEYPAD_MAP_1 : KEYPAD_MAP_2
keypad = KeypadHandler.new(part)

puts "Please enter the sequence you got from the front desk. Submit by entering END and hit return:"
$/ = "END"
sequence = STDIN.gets
sequence_array = sequence.chomp("END").split("\n")
n = sequence_array.length

n.times do |i|
  sequence = sequence_array[i].split("")

  base_num = i == 0 ? 5 : sequence_number
  sequence_number = keypad.get_next_sequence_digit(base_num ,sequence)
  bathroom_code.push sequence_number
end

puts "Your bathroom code is #{bathroom_code.join("")}. Enjoy your stay!"
