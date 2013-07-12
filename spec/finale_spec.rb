require 'rspec'

require './spec/spec_helper'
require './finale'

describe Finale do

  it "input 1" do
    input = ""
    Finale.new(input, false).result.should == ""
  end
  
  it "input 2" do
    input = ""
    Finale.new(input, false).result.should == ""
  end

  it "input 3" do
    input = ""
    Finale.new(input, false).result.should == ""
  end

end

