require 'date'

class RecipeCard

  attr_reader :recipe, :user, :rating, :date
  @@all = []

  def initialize(recipe, user, rating, date)
    @recipe = recipe
    @user = user
    @rating = rating
    @date = Date.parse(date)
    @@all << self
  end

  def self.all
    @@all
  end

end
