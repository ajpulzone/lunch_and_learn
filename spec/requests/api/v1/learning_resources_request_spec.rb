require "rails_helper"

RSpec.describe "Recipes API" do
  it "can find learning resources for a particular country" do
    country = "Ireland"
    get "/api/v1/learning_resources?country=#{country}"
  end
end
