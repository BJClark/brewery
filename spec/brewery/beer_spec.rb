require File.join(File.dirname(__FILE__), "/../spec_helper")

describe Brewery::Beer do
  let(:beer) {Brewery::Beer.new(:boil_length => 60, :boil_volume => 5)}

  it "should have hops" do
    beer.hops.should == []
    beer.hops.should be_an_instance_of Array
  end
  describe "calculating the IBU" do
    it "should be 0 if there are no hops" do
      beer.ibu.should == 0
    end
    it "should be 0 if there is no boil length" do
      beer.ibu.should == 0
    end
    it "should be 0 if there is no boil volume" do
      beer.ibu.should == 0
    end
    it "should collect the IBU of the indiviual hops" do
      beer.hops << Brewery::Hop.new(:aau => 10, :weight_in_grams => 15, :boil_length => 60)
      beer.ibu.should be_close 15, 1
    end
  end

  it "should have malts" do
    beer.malts.should == []
    beer.malts.should be_an_instance_of Array
  end

  it "should have a yeast" do
    beer.yeast.should be_nil
  end

  it "should have a boil length" do
    beer.boil_length.should == 60
  end

  it "should have a boil volume" do
    beer.boil_volume.should == 5
  end

  it "should calculate the boil volume from gallons to litres" do
    beer.boil_volume = 5
    beer.boil_volume_in_liters.should be_close 18.9, 0.1
  end

end
