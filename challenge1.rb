#!/usr/bin/env ruby

output = []
def input
  ARGV[0]
end

card = input()

suit_inverse_mapping = {
  'H' => 'S',
  'D' => 'C',
  'C' => 'D',
  'S' => 'H'
}

face_card_values = {
  'A' => 1,
  'J' => 11,
  'Q' => 12,
  'K' => 13
}

face_card_value_names = {
  '1' => 'A',
  '11' => 'J',
  '12' => 'Q',
  '13' => 'K'
}

suit = card[0]
value = card[1..-1]

inverse_suit = suit_inverse_mapping[suit]
inverse_card_value = if value.to_i == 0
  inverse_value = 14 - face_card_values[value]
  face_card_value_names[inverse_value.to_s] || inverse_value
else
  14 - value.to_i
end

output << "#{inverse_suit}#{inverse_card_value}"

puts output

