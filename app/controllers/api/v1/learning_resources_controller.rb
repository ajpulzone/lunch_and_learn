class Api::V1::LearningResourcesController < ApplicationController

  def index
    if params[:country] == "" || params[:country] == nil
      render json: { errors: "No Country Entered" }, status: 400
    elsif params[:country] != nil
      resource = LearningResourcesFacade.resources_by_country(params[:country])
      render json: LearningResourceSerializer.new(resource)
    end 
  end
end