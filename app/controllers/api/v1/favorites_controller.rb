class Api::V1::FavoritesController < ApplicationController

  def create
    user = User.where(user_api_key: favorite_params[:user_api_key]).first 
    user_favorite = user.favorites.new(favorite_params)
    if user_favorite.save
      render json: {"success": "Favorite added successfully" }, status: 201
    else
      render json: { "errors": "Favorite was not added" }, status: 400
    end
  end

  def index
    user = User.where(user_api_key: params[:user_api_key]).first
    render json: FavoriteSerializer.new(user.favorites), status: 201
  end
private
  def favorite_params
    params.require(:favorite).permit(:user_api_key, :country, :recipe_link, :recipe_title)
  end
end