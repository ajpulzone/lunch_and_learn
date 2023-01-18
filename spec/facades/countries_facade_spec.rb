require "rails_helper"

RSpec.describe CountriesFacade do
  describe "#countries", :vcr do
    it "returns and array of country objects" do
        countries = CountriesFacade.countries
        
        expect(countries).to be_an(Array)
        expect(countries.count).to eq(250)
        expect(countries[0]).to be_an_instance_of(Country)
        expect(countries[0].name).to eq("Grenada")
        expect(countries[1].name).to eq("Malaysia")
        expect(countries[2].name).to eq("French Guiana")
        expect(countries[0].name).to_not eq("Salem")
      end 
    end
    
  describe "#find_a_country", :vcr do
    it "returns a single country object" do
      country = "Ireland"
      results = CountriesFacade.find_a_country(country)
      
      expect(results.name).to eq("Ireland")
    end
  end
  
  describe "#random_country", :vcr do
    it "returns a random country name" do
      country = CountriesFacade.random_country
      
      expect(country).to be_an_instance_of(Country)
      expect(country.name).to be_a(String)
      expect(country).to_not eq(nil)
    end
  end
end 
