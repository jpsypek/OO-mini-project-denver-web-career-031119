require_relative '../config/environment.rb'
require 'date'

pasta = Recipe.new("pasta")
sushi = Recipe.new("sushi")
pizza = Recipe.new("pizza")
pbj = Recipe.new("pbj")

kari = User.new("Kari")
kevin = User.new("Kevin")
jack = User.new("Jack")

tomato = Ingredient.new("tomato")
cheese = Ingredient.new("cheese")
fish = Ingredient.new("fish")
rice = Ingredient.new("rice")

kari.add_recipe_card(pasta, 4, "3/19")
kevin.add_recipe_card(sushi, 3, "1/1")
kevin.add_recipe_card(pizza, 5, "3/1")
kevin.add_recipe_card(pasta, 4, "4/1")
kevin.add_recipe_card(pbj, 5, "1/1")
jack.add_recipe_card(pizza, 1, "2/1")
kari.add_recipe_card(pizza, 1, "2/1")

kari.declare_allergen(fish)
kevin.declare_allergen(rice)
jack.declare_allergen(cheese)
jack.declare_allergen(rice)

pasta.add_ingredients([tomato, cheese])
sushi.add_ingredients([fish, rice])
pizza.add_ingredients([tomato, cheese, fish])
binding.pry
