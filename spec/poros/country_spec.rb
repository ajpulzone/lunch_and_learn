require "rails_helper"

RSpec.describe Country do
  it "it exists" do
    data = {name: {common: "Ireland", official: "Ireland1", nativeName: {eng: {official: "Ireland2", common: "Ireland3"}}}}
    country = Country.new(data)
    
    expect(country).to be_an_instance_of(Country)
  end
  
  it "it has readable attributes" do
    data = {name: {common: "Ireland", official: "Ireland1", nativeName: {eng: {official: "Ireland2", common: "Ireland3"}}}}
    country = Country.new(data)
  
    expect(country.name).to eq("Ireland")
    expect(country.name).to_not eq("Ireland1")
    expect(country.name).to_not eq("Ireland2")
    expect(country.name).to_not eq("Ireland3")
  end
end
