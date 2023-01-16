class Api::V1::RecipesController < ApplicationController

  def index
    if params[:country] != nil
      recipes = RecipesFacade.recipes_by_country(params[:country])
      render json: RecipeSerializer.new(recipes)
    elsif params[:country] == nil
      country = CountriesFacade.random_country
      recipes = RecipesFacade.recipes_by_country(country.name)
      render json: RecipeSerializer.new(recipes)
    end 
  end
end