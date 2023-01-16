require "rails_helper"

RSpec.describe "Recipes API" do
    it "can find recipes from a country based on user input of country" do
      country = "Ireland"

      get "/api/v1/recipes?country=#{country}"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      binding.pry
      response_body = JSON.parse(response.body, symbolize_names: true)
binding.pry
      country_recipes = response_body[:data]
      binding.pry
    end
end