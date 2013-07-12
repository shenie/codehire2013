
#!/usr/bin/env ruby

#### answer library below

class Array
  def repeats
    group_by { |item| item }.map { |key, items| key if items.size > 1 }.compact
  end
end

#### answer library above

class Challenge3

  def initialize(arg = "1-4,1-5,1-9,2-3,2-4,2-6,2-8,3-5,3-9,4-5,4-7,4-8,5-6,5-7,6-9,7-8,7-9,8-9", debug = true)
    @arg = arg
    @debug = debug
  end
  
  def debug(str)
    puts ">> DEBUG  #{str}" if @debug
  end
  
  def input
    @arg
  end

  def result
    output = ""
    
#### answer below

relationships = input().split(',').inject(Hash.new { |h, k| h[k] = [] }) do |map, friendship|
  (from, to) = friendship.split('-')
  map[from] << to
  map[to] << from
  map
end

relationships.keys.sort.each { |k| debug "#{k} -> #{relationships[k]}" }
johns_friends = relationships['1']

potentials = relationships.map do |person, their_friends|
  next if person == '1'
  common_friends = (their_friends + johns_friends).repeats
  debug "person #{person} has #{common_friends} friends common"
  person if common_friends.size == 1
end
potentials.compact!

debug "potentials = #{potentials}"
output << potentials.uniq.sort.join(',')


#### answer above

  end
end

