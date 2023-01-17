require "rails_helper"

RSpec.describe "Users API" do
  describe "User Registration" do
    describe "happy path" do
      it "creates a user with a name, unique email and api_key that is randomly generated upon creation" do
        
        body = { "name": "Drake", "email": "imamuppet@gmail.com" }
        headers = { "Content-Type": "application/json", Accept: "application/json" }
        post "/api/v1/users", headers: headers, params: JSON.generate(user: body)

        expect(response).to be_successful
        expect(response.status).to eq(201)

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        user = User.last

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response).to have_key(:data)
        expect(parsed_response[:data]).to have_key(:id)
        expect(parsed_response[:data]).to have_key(:type)
        expect(parsed_response[:data]).to have_key(:attributes)
        expect(parsed_response[:data][:attributes]).to have_key(:name)
        expect(parsed_response[:data][:attributes]).to have_key(:email)
        expect(parsed_response[:data][:attributes]).to have_key(:user_api_key)

        expect(user.name).to eq("Drake")
        expect(user.email).to eq("imamuppet@gmail.com")
      end
    end 
  end 
end
