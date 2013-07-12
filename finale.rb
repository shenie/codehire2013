#!/usr/bin/env ruby

#### answer library below

class Array
  def repeats
    group_by { |item| item }.map { |key, items| key if items.size > 1 }.compact
  end
end

#### answer library above

class Finale

  def initialize(arg = "", debug = true)
    @arg = arg
    @debug = debug
  end
  
  def debug(str)
    puts str if @debug
  end
  
  def input
    @arg
  end

  def result
    output = ""
    
#### answer below



#### answer above

  end
end

