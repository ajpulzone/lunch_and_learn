class CountryRecipesFacade

  def self.find_recipes_by_country(country)
    if country != nil
      found_country = CountriesFacade.find_a_country(country)
      recipes = RecipesFacade.recipes_by_country(country) do |recipe|
        binding.pry
        CountryRecipe.new(recipe, found_country)
      end
    else
      binding.pry
      result = CountriesFacade.random_country
      country_result = Country.new(result)
      recipes = RecipesFacade.find_recipes_by_country(country) do |recipe|
        CountryRecipes.new(recipe, country_result.name)
      end
    end
  end
end