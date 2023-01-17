class Api::V1::LearningResourcesController < ApplicationController

  def index
    if params[:country] != nil
      resource = LearningResourcesFacade.resources_by_country(params[:country])
      render json: LearningResourceSerializer.new(resource)
    elsif params[:country] == nil
    end 
  end
end