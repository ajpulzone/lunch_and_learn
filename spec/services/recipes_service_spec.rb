require "rails_helper"

RSpec.describe RecipesService do
  describe "#find_recipes" do
    describe "happy path" do
      it "searches API for recipes based on country that is passed in" do
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
    end

    xdescribe "sad path" do
      it "NEEDS TO BE WRITEN: when a country name is invalid" do
      end
      it "NEEDS TO BE WRITTEN" do

      end
    end
  end
end