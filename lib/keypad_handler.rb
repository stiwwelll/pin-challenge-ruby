require 'pry'
require_relative '../constants/keymap'

class KeypadHandler

  def initialize(keypad_map)
    @keypad_map = keypad_map
  end

  def get_next_sequence_digit(digit, sequence)
    step = digit

    sequence.each do |move|
      unless keypad_map[step][move] == nil
        step = keypad_map[step][move]
      end
    end

    return step
  end

  private

  attr_reader :keypad_map

end
