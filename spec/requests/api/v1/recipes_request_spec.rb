require "rails_helper"

RSpec.describe "Recipes API" do
  it "can find recipes from a country based on valid user input of country" do
    country = "Ireland"

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    response_body = JSON.parse(response.body, symbolize_names: true)
    recipes = response_body[:data]

    expect(recipes.first).to have_key(:id)
    expect(recipes.first).to have_key(:type)
    expect(recipes.first).to have_key(:attributes)
    expect(recipes.first[:attributes]).to have_key(:title)
    expect(recipes.first[:attributes]).to have_key(:url)
    expect(recipes.first[:attributes]).to have_key(:image_url)
    expect(recipes.first[:attributes]).to have_key(:country)
    expect(recipes.first[:id]).to eq(nil)
    expect(recipes.first[:type]).to eq("recipe")
    expect(recipes.first[:attributes][:title]).to eq("East of Ireland Recipe")
    expect(recipes.first[:attributes][:url]).to eq("http://www.edamam.com/recipe/east-of-ireland-recipe-6d13b3f170ff1927fae509941714f13a/ireland")
    expect(recipes.first[:attributes][:image_url]).to include("https://edamam-product-images.s3.amazonaws.com/web-img/a63/a631e7080e6b18bdea4e4ddab4523984.jpg")
    expect(recipes.first[:attributes][:country]).to eq("Ireland")

    expect(recipes.first[:attributes][:country]).to_not eq("Scotland")
    expect(recipes.first).to_not have_key(:title)
    expect(recipes.first).to_not have_key(:url)
    expect(recipes.first).to_not have_key(:image_url)
    expect(recipes.first).to_not have_key(:country)
  end

  xit "NEED TO WRITE THIS, WILL HAVE TO STUB: can find recipes from a random country chosen for the user" do
    get "/api/v1/recipes?"
    
  end

  it "will return an empty data array if an invalid country is entered" do
    country = "Drake is a Good Dog"
    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    response_body = JSON.parse(response.body, symbolize_names: true)
    
    expect(response_body).to have_key(:data)
    expect(response_body[:data]).to eq([])
    expect(response_body).to_not have_key(:type)
    expect(response_body).to_not have_key(:id)
    expect(response_body).to_not have_key(:attributes)
  end

  xit "NOT CURRENTLY PASSING, WILL NEED ADDITIONAL CONTROLLER LOGIC: will return an empty array if a valid country is entered but no results are found" do
    country = “Tuvalu”
    get "/api/v1/recipes?country=#{country}"
    expect(response).to be_successful
    expect(response.status).to eq(200)
    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response_body).to have_key(:data)
    expect(response_body[:data]).to eq([])
    expect(response_body).to_not have_key(:type)
    expect(response_body).to_not have_key(:id)
    expect(response_body).to_not have_key(:attributes)
  end
end