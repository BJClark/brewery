class Brewery::Beer
  attr_accessor :hops, :malts, :yeast, :boil_length, :boil_volume

  def initialize(args={})
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
    self.hops = Array.new
    self.malts = Array.new
  end

  def ibu
    return 0 unless hops.length > 0
    return 0 unless boil_length > 0
    return 0 unless boil_volume > 0
    hops.collect{|h| h.ibu(1.050, self.boil_volume) }.sum
  end

  def boil_volume_in_liters
    boil_volume * 3.78541178
  end

end
