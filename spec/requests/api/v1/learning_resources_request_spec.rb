require "rails_helper"

RSpec.describe "Learning Resources API Path" do
  it "happy path: can find learning resources for a particular country", :vcr do
    country = "Ireland"
    get "/api/v1/learning_resources?country=#{country}"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    response_body = JSON.parse(response.body, symbolize_names: true)
    resources = response_body[:data]
    
    expect(resources).to have_key(:id)
    expect(resources).to have_key(:type)
    expect(resources).to have_key(:attributes)
    expect(resources[:attributes]).to have_key(:country)
    expect(resources[:attributes]).to have_key(:video)
    expect(resources[:attributes]).to have_key(:images)
    expect(resources[:attributes][:images]).to be_an(Array)
    expect(resources[:attributes][:images][0]).to have_key(:alt_tag)
    expect(resources[:attributes][:images][0]).to have_key(:url)
  end

  it "sad path: it returns a 404 error and no country entered message if a country is not passed in", :vcr do
    country = nil
    get "/api/v1/learning_resources?country=#{country}"

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    response_body = JSON.parse(response.body, symbolize_names: true)
    
    expect(response_body).to have_key(:errors)
    expect(response_body[:errors]).to eq("No Country Entered")
  end
end
