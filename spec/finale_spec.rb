require 'rspec'

require './spec/spec_helper'
require './finale'

describe Finale do

  it "test order" do
    req1 = Request.new 1, 1, 10
    req2 = Request.new 1, 1, 30
    req3 = Request.new 1, 1, 20

    [req1, req2, req3].sort.should == [req2, req3, req1]
  end

  it "input 1" do
    input = ["0,1,19,9,56", "13,15;67,60;68,35;"]
    Finale.new(input, false).result.should == "3,4,2"
  end
  
  it "input 2" do
    input = ["45,10,7,1,0", "27,45;11,10;"]
    Finale.new(input, false).result.should == "1,2"
  end

  it "input 3" do
    input = ["98,99,26,5,75", "27,45;11,10;5,100;"]
    Finale.new(input, false).result.should == "2,4,3"
  end

  it "input 4" do
    input = ["1,2,3,4,5", "9,10;11,12;13,14;"]
    Finale.new(input, false).result.should == "2,3,4"
  end

  it "input 5" do
    input = ["1,2,3,4,5", "7,60;"]
    Finale.new(input, false).result.should == "4"
  end

end

