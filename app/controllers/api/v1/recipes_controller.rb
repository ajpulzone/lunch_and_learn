class Api::V1::RecipesController < ApplicationController

  def index
    if params[:country] != nil || params[:country].empty? == false
      result = CountriesFacade.find_a_country(params[:country])
      recipes = CountryRecipesFacade.find_recipes_by_country(result.name)
      binding.pry
      render json: RecipeSerializer.new(recipes)
    else 
      binding.pry
      render json: CountryRecipesSerializer.new(RecipesFacade.recipes_by_country(CountriesFacade.random_country))
      binding.pry
    end 
  end
end