#!/usr/bin/env ruby

#### answer library below

class Array
  def repeats
    group_by { |item| item }.map { |key, items| key if items.size > 1 }.compact
  end
end

class Elevator
  attr_accessor :id, :floor, :available
  alias :available? :available

  def initialize(id, floor)
    @id    = id
    @floor = floor.to_i
    @available = true
  end

  def distance_to(floor)
    (self.floor - floor).abs
  end
end

class Request
  attr_accessor :elevator, :to_floor, :wait_time

  def initialize(request_id, to_floor, wait_time)
    @request_id = request_id
    @to_floor   = to_floor.to_i
    @wait_time  = wait_time.to_i
  end

  def service_by(elevator)
    @elevator = elevator
    elevator.available = false
  end

  def <=>(another)
    another.wait_time <=> self.wait_time
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

  elevators = []
  input().first.split(',').each_with_index do |floor, id|
    elevators << Elevator.new(id, floor)
  end

  requests = []
  input().last.split(";").each_with_index do |str, idx|
    (floor, wait_time) = str.split(',')
    requests << Request.new(idx, floor, wait_time)
  end

  requests.sort.each do |request|
    available_elevators = elevators.find_all { |e| e.available? }
    available_elevators.each { |e| debug "req to_floor=#{request.to_floor} wait #{request.wait_time} e=#{e.id} e-floor=#{e.floor}}"}

    available_elevators_by_distance = available_elevators.map { |e| [e.distance_to(request.to_floor), e] }.sort
    available_elevators_by_distance.each {|pair| debug "dist=#{pair.first} e.id=#{pair.last.id} e.floor=#{pair.last.floor}"}

    next_available_elevator = available_elevators_by_distance.first.last
    # next_available_elevator = available_elevators_by_distance.find { |(dist, e)| dist != 0 }.last
    debug "found e #{next_available_elevator.id}"

    request.service_by next_available_elevator
  end

  output << requests.map { |r| r.elevator.id }.join(',')

#### answer above

  end
end

