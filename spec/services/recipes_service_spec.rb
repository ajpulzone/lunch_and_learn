require "rails_helper"

RSpec.describe RecipesService do
  describe "#find_recipes" do
    it "happy path: returns recipes for the country that is passed in", :vcr do
      results = RecipesService.find_recipes("Ireland")
      first_recipe = results[:hits].first
      second_recipe = results[:hits].second

      expect(first_recipe).to be_a(Hash)
      expect(first_recipe).to have_key(:recipe)
      expect(first_recipe[:recipe]).to be_a(Hash)
      expect(first_recipe[:recipe]).to have_key(:shareAs)
      expect(first_recipe[:recipe][:shareAs]).to be_a(String)
      expect(first_recipe[:recipe]).to have_key(:label)
      expect(first_recipe[:recipe][:label]).to be_a(String)
      expect(first_recipe[:recipe]).to have_key(:image)
      expect(first_recipe[:recipe][:image]).to be_a(String)
      expect(first_recipe[:recipe]).to_not eq(second_recipe[:recipe])
    end 
    
    it "sad path: when a country name is invalid", :vcr do
      results = RecipesService.find_recipes("Drake Is A Good Boy")
      
      expect(results).to be_a(Hash)
      expect(results[:hits]).to be_an(Array)
      expect(results[:hits]).to be_empty
    end
    
    it "sad path: when a country is valid but no recipes are returned", :vcr do
      results = RecipesService.find_recipes("Djibouti")

      expect(results).to be_a(Hash)
      expect(results[:hits]).to be_an(Array)
      expect(results[:hits]).to be_empty
    end
  end
end