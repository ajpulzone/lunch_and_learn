class RecipesFacade

  def self.recipes_by_country(country)
    results = RecipesService.find_recipes(country)
    results[:hits].map do |result|
      Recipe.new(result, country)
    end
  end
end