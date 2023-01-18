require "rails_helper"

RSpec.describe RecipesFacade do
  describe "#recipes_by_country" do
    it "happy path: returns an array of recipe objects", :vcr do
      recipes = RecipesFacade.recipes_by_country("Ireland")

      expect(recipes).to be_an(Array)
      expect(recipes.count).to eq(20)
      expect(recipes.first).to be_an_instance_of(Recipe)
      expect(recipes.first.title).to eq("East of Ireland Recipe")
      expect(recipes.first.url).to eq("http://www.edamam.com/recipe/east-of-ireland-recipe-6d13b3f170ff1927fae509941714f13a/ireland")
      expect(recipes.first.image_url).to include("https://edamam-product-images.s3.amazonaws.com/web-img/a63/a631e7080e6b18bdea4e4ddab4523984.jpg")
      expect(recipes.first).to_not eq(recipes.second)
    end

    it "sad path: returns an empty array when a country is not valid", :vcr do
      recipes = RecipesFacade.recipes_by_country("Drake is a Good Boy")

      expect(recipes).to be_an(Array)
      expect(recipes).to eq([])
    end

    it "sad path: when a valid country is entered that has no results", :vcr do
      recipes = RecipesFacade.recipes_by_country("Djibouti")

      expect(recipes).to be_an(Array)
      expect(recipes).to eq([])
    end
  end 
end 
