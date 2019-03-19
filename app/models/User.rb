class User

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def recipe_card
    RecipeCard.all.select{|rc|
    rc.user == self}
  end

  def recipes
    self.recipe_card.map{|rc|
    rc.recipe}
  end

  def add_recipe_card(recipe, rating, date)
    RecipeCard.new(recipe, self, rating, date)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

#list all of the ingredients that are allergens for this user
  def allergens
    allergen_ingredients = []
    Allergen.all.each{|allergen|
    if allergen.user == self
    allergen_ingredients << allergen.ingredient
    end}
    allergen_ingredients
  end

  def top_three_recipes
    cards = self.recipe_card.sort_by{|rc|
    rc.rating}.reverse[0..2]
    cards.map{|card|
    card.recipe}
  end

  def most_recent_recipe
    recipe_card.sort_by{|rc|
    rc.date}[-1].recipe
  end

  def self.all
    @@all
  end

end
