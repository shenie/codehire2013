require 'rspec'

require './spec/spec_helper'
require './challenge3'

describe Challenge3 do

  it "input 1" do
    input = "1-2,2-4,3-4,4-5,5-6"
    Challenge3.new(input, false).result.should == '4'
  end
  
  it "input 2" do
    input = "1-2,1-3,1-4,1-5,2-4,2-7,3-4,3-5,3-8,4-8,5-7,5-6,5-8,6-7,6-8,7-8"
    Challenge3.new(input, true).result.should == "2,5,6,7"
  end

  it "input 3" do
    input = "1-4,1-5,1-9,2-3,2-4,2-6,2-8,3-5,3-9,4-5,4-7,4-8,5-6,5-7,6-9,7-8,7-9,8-9"
    Challenge3.new(input, false).result.should == '2,4,5'
  end
end

