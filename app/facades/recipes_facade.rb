class RecipesFacade

  def self.recipes_by_country(country)
    results = RecipesService.find_recipes(country)
    results[:hits].map do |result|
      binding.pry
      Recipe.new(country, result)
    end
  end
end