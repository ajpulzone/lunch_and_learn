require "rails_helper"

RSpec.describe "Favorites API" do
  describe "Favorite Creation" do
    before(:each) do
      body = { "name": "Drake", "email": "imamuppet@gmail.com" }
      headers = { "Content-Type": "application/json", Accept: "application/json" }
      post "/api/v1/users", headers: headers, params: JSON.generate(user: body)
      @user = User.last
    end

    it "happy path: it creates a favorite recipe for a user" do
      body = { "user_api_key": "#{@user.user_api_key}", "country": "Ireland", "recipe_link": "http://www.edamam.com/recipe/cheddar-colcannon-torte-97c47f3162d83a9da30673929bbf8f7a/ireland", "recipe_title": "Cheddar Colcannon Torte"}
      headers = { "Content-Type": "application/json", Accept: "application/json" }
      post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite: body)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to be_a(Hash)
      expect(parsed_response).to have_key(:success)
      expect(parsed_response[:success]).to eq("Favorite added successfully")
    end

    it "sad path: it returns a 404 error and message if a users user_api_key does not match the favorite 
      user_api_key, and a favorite is not created" do
        body = { "user_api_key": "123456abcdefg", "country": "Ireland", "recipe_link": "http://www.edamam.com/recipe/cheddar-colcannon-torte-97c47f3162d83a9da30673929bbf8f7a/ireland", "recipe_title": "Cheddar Colcannon Torte"}
        headers = { "Content-Type": "application/json", Accept: "application/json" }
        post "/api/v1/favorites", headers: headers, params: JSON.generate(favorite: body)

        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        parsed_response = JSON.parse(response.body, symbolize_names: true)
        
        expect(parsed_response).to be_a(Hash)
        expect(parsed_response).to have_key(:errors)
        expect(parsed_response[:errors]).to eq("User could not be found, favorite not added")
    end
  end

  describe "Get a Users Favorites" do
    before(:each) do
      body = { "name": "Drake", "email": "imamuppet@gmail.com" }
      headers = { "Content-Type": "application/json", Accept: "application/json" }
      post "/api/v1/users", headers: headers, params: JSON.generate(user: body)
      @user = User.last

      body1 = { "user_api_key": "#{@user.user_api_key}", "country": "Ireland", "recipe_link": "http://www.edamam.com/recipe/cheddar-colcannon-torte-97c47f3162d83a9da30673929bbf8f7a/ireland", "recipe_title": "Cheddar Colcannon Torte"}
      headers1 = { "Content-Type": "application/json", Accept: "application/json" }
      post "/api/v1/favorites", headers: headers1, params: JSON.generate(favorite: body1)
    end
    
    it "happy path: returns json of a specified users favorites if a user is found" do

      get "/api/v1/favorites?user_api_key=#{@user.user_api_key}"

      expect(response).to be_successful
      expect(response.status).to eq(201)

      response_body = JSON.parse(response.body, symbolize_names: true)

      user_favorites = response_body[:data]

      expect(user_favorites.count).to eq(1)
      expect(user_favorites).to be_an(Array)
      expect(user_favorites[0]).to have_key(:id)
      expect(user_favorites[0]).to have_key(:type)
      expect(user_favorites[0]).to have_key(:attributes)
      expect(user_favorites[0][:attributes]).to have_key(:country)
      expect(user_favorites[0][:attributes]).to have_key(:recipe_link)
      expect(user_favorites[0][:attributes]).to have_key(:recipe_title)
      expect(user_favorites[0][:attributes]).to have_key(:created_at)
      expect(user_favorites[0][:attributes]).to_not have_key(:user_api_key)

      expect(user_favorites[0][:type]).to eq("favorite")
      expect(user_favorites[0][:attributes][:country]).to eq("Ireland")
      expect(user_favorites[0][:attributes][:recipe_link]).to eq("http://www.edamam.com/recipe/cheddar-colcannon-torte-97c47f3162d83a9da30673929bbf8f7a/ireland")
      expect(user_favorites[0][:attributes][:recipe_title]).to eq("Cheddar Colcannon Torte")        
    end 

    it "sad path: returns a 400 error and message that user could not be found if an invalid 
      user_api_key passed in" do
        get "/api/v1/favorites?user_api_key=123456abcd"

        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response).to have_key(:errors)
        expect(parsed_response[:errors]).to eq("User could not be found")
    end 

    it "sad path: returns a 400 error and message that user could not be found if no user_api_key passed in" do
        get "/api/v1/favorites?user_api_key="

        expect(response).to_not be_successful
        expect(response.status).to eq(400)

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response).to have_key(:errors)
        expect(parsed_response[:errors]).to eq("User could not be found")
    end 
  end
end 