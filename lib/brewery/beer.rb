class Brewery::Beer
  attr_accessor :hops, :malts, :yeast, :boil_length, :boil_volume

  def initialize
    self.hops = Array.new
    self.malts = Array.new
    self.boil_length = 60.minutes.seconds
    self.boil_volume = 5 #gallons
    super
  end

  def ibu
    return 0 unless hops.length > 0
    return 0 unless boil_length > 0
    return 0 unless boil_volume > 0
    hops.collect(&:ibu).sum
  end

end
