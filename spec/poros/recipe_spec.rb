require "rails_helper"

RSpec.describe Recipe do
  it "it exists" do
    data = {:recipe => {uri: "http://www.edamam.com/ontologies/edamam.owl#recipe_6d13b3f170ff1927fae509941714f13a", label: "East of Ireland Recipe", image: "https://edamam-product-images.s3.amazonaws.com/web-img/a63/a631e7080e6b18bdea4e4ddab4523984.jpg", shareAs: "http://www.edamam.com/recipe/east-of-ireland-recipe-6d13b3f170ff1927fae509941714f13a/ireland"}}
    recipe = Recipe.new(data)
    expect(recipe).to be_an_instance_of(Recipe)
  end
  
  it "it has readable attributes" do
    data = {:recipe => {uri: "http://www.edamam.com/ontologies/edamam.owl#recipe_6d13b3f170ff1927fae509941714f13a", label: "East of Ireland Recipe", image: "https://edamam-product-images.s3.amazonaws.com/web-img/a63/a631e7080e6b18bdea4e4ddab4523984.jpg", shareAs: "http://www.edamam.com/recipe/east-of-ireland-recipe-6d13b3f170ff1927fae509941714f13a/ireland"}}
    recipe = Recipe.new(data)
    
    expect(recipe.title).to eq("East of Ireland Recipe")
    expect(recipe.url).to eq("http://www.edamam.com/recipe/east-of-ireland-recipe-6d13b3f170ff1927fae509941714f13a/ireland")
    expect(recipe.image_url).to eq("https://edamam-product-images.s3.amazonaws.com/web-img/a63/a631e7080e6b18bdea4e4ddab4523984.jpg")
    expect(recipe.url).to_not eq("http://www.edamam.com/ontologies/edamam.owl#recipe_6d13b3f170ff1927fae509941714f13a")
  end
end
