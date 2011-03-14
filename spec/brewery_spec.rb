require File.join(File.dirname(__FILE__), "spec_helper")

describe Brewery do
  let(:brewery) { Brewery.new }
  it "should not start with any beers" do
    brewery.beers.should == []
  end

  it "should keep a list of beers" do
    brewery.beers << Brewery::Beer.new
    brewery.beers.length.should == 1
  end

end

