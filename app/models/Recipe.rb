class Recipe

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def recipecard
    RecipeCard.all.select{|recipecard|
    recipecard.recipe == self}
  end

  def users
    self.recipecard.map{|recipecard|
    recipecard.user}
  end

  def recipeingredients
    RecipeIngredient.all.select{|recipeingredients|
    recipeingredients.recipe == self}
  end

  def ingredients
    self.recipeingredients.map{|recipeingredients|
    recipeingredients.ingredient}
  end

  def allergen_ingredients
    Allergen.all.map{|allergen|
    allergen.ingredient}
  end
# returning all of the ingredients that are allergens
  def allergens
    self.ingredients.select{|ing|
    allergen_ingredients.include?(ing)}
  end

  #add ingredients
  def add_ingredients(ingredients)
    ingredients.each{|ingredient|
    RecipeIngredient.new(self, ingredient)}
  end

  def self.most_popular
    user_count = 0
    recipe = nil
    @@all.each do |rec|
      rec_count = rec.recipecard.length
      if rec_count > user_count
        user_count = rec_count
        recipe = rec
      end
    end
    recipe
  end

  def self.all
    @@all
  end

end
