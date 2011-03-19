class Brewery::Hop
  attr_accessor :aau, :weight_in_grams, :varietal, :boil_time_in_minutes

  def initialize args={}
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def ibu(original_gravity, boil_volume_in_liters)
    gravity_adjustment = boil_gravity_adjustment(original_gravity)
    (weight_in_grams * utilization * (aau * 0.01) * 1000) / boil_volume_in_liters * (1 + gravity_adjustment)
  end

  def weight_in_ounces
    self.weight_in_grams * 0.0353
  end

  def weight_in_ounces=(weight)
    self.weight_in_grams = (weight * 28.35) 
  end

  def utilization
    boil_time = boil_time_in_minutes || 0
    (18.11 + 13.86 * Math.tanh((boil_time - 31.32)/18.27)) * 0.01 #yes, totally magic http://realbeer.com/hops/FAQ.html
  end

  def boil_gravity_adjustment(og)
    return 0 unless og > 1.050
    (og - 1.050) / 0.2
  end

end
