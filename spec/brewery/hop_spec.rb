require File.join(File.dirname(__FILE__), "/../spec_helper")

describe Brewery::Hop do
  let(:hop) { Brewery::Hop.new }

  def valid_attributes()
    {}
  end
  it { should respond_to :aau }
  it { should respond_to :weight_in_grams }
  it { should respond_to :varietal }
  it { should respond_to :boil_time_in_minutes }

  it "should convert weight in grams to ounces" do
    hop.weight_in_grams = 10
    hop.weight_in_ounces.should be_close 0.3527, 0.5
  end

  it "should set the weight to grams when offered ounces" do
    hop.weight_in_ounces = 0.3527
    hop.weight_in_grams.should be_close 10, 0.1
  end

  it "should calculate the IBU" do
    batch = Brewery::Beer.new(:boil_volume => 5)
    hop = Brewery::Hop.new(:aau => 10,
                           :weight_in_grams => 15,
                           :boil_time_in_minutes => 60)

    hop.ibu(1.050, batch.boil_volume_in_liters).should be_close 24, 0.5
  end

  context "utilization" do
    it "should be 5 if there is no boil time" do
      hop.boil_time_in_minutes = nil
      hop.utilization.should be_close 0.05, 0.005
    end
    it "should be 10.1 for 20 minutes" do
      hop.boil_time_in_minutes = 20
      hop.utilization.should be_close 0.101, 0.005
    end
    it "should be 26.9 for 60 minutes" do
      hop.boil_time_in_minutes = 60
      hop.utilization.should be_close 0.269, 0.05
    end
  end

  context "boil gravity adjustment" do
    it "should be 0 if gravity is 1.050 or lower" do
      hop.boil_gravity_adjustment(1.050).should == 0
    end
    it "should calculate the GA if og is higher than 1.050" do
      hop.boil_gravity_adjustment(1.060).should be_close(0.05, 0.001)
    end
  end

end
