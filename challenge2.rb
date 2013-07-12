#!/usr/bin/env ruby

output = []
def input
  STDIN.readlines
end

#### answer below

class Packet
  attr_accessor :ip, :protocol, :port

  def initialize(raw_packet)
    (@ip, @protocol, @port) = raw_packet.split(',')
  end
end

class Rule
  attr_accessor :index, :action

  def initialize(raw_rule)
    (@index, @field_id, @field_value, @action) = raw_rule.split(',')
  end

  def ip_rule?
    @field_id == 'I'
  end

  def port_rule?
    @field_id == 'P'
  end

  def protocol_rule?
    @field_id == 'R'
  end

  def match_any?
    @field_value == '*'
  end

  def match?(packet)
    return true if match_any?
    if ip_rule?
      @field_value == packet.ip
    elsif port_rule?
      @field_value == packet.port
    elsif protocol_rule?
      @field_value == packet.protocol
    else
      false
    end
  end
end

lines = input().split("\n")
packet = Packet.new lines.first
rules = lines[1..-1].map { |l| Rule.new l }

matched_rule = rules.find do |rule|
  rule.match? packet
end

if matched_rule
  output << "#{matched_rule.index},#{matched_rule.action}"
else
  output << "0,ALLOW"
end


####   answer above

puts output

