class Ingredient

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.most_common_allergen
    count = {}
    Allergen.all.each{|allergen|
    count.has_key?(allergen.ingredient) ? count[allergen.ingredient] += 1 : count[allergen.ingredient] = 1}
    count.key(count.values.sort[-1])
  end

  def self.all
    @@all
  end

end
