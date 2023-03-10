require "rails_helper"

RSpec.describe CountriesService do
  describe "#get_all_countries" do
    it "happy path: searches api for all countries", :vcr do
      results = CountriesService.get_all_countries
      
      first_country = results.first 
      second_country = results.second 

      expect(first_country).to be_a(Hash)
      expect(first_country).to have_key(:name)
      expect(first_country[:name]).to have_key(:common)
      expect(first_country[:name][:common]).to be_a(String)
      expect(first_country).to eq(
                                    {:name=>{:common=>"Grenada", :official=>"Grenada", :nativeName=>{:eng=>{:official=>"Grenada", :common=>"Grenada"}}},
                                        :tld=>[".gd"],
                                        :cca2=>"GD",
                                        :ccn3=>"308",
                                        :cca3=>"GRD",
                                        :cioc=>"GRN",
                                        :independent=>true,
                                        :status=>"officially-assigned",
                                        :unMember=>true,
                                        :currencies=>{:XCD=>{:name=>"Eastern Caribbean dollar", :symbol=>"$"}},
                                        :idd=>{:root=>"+1", :suffixes=>["473"]},
                                        :capital=>["St. George's"],
                                        :altSpellings=>["GD"],
                                        :region=>"Americas",
                                        :subregion=>"Caribbean",
                                        :languages=>{:eng=>"English"},
                                        :translations=>
                                        {:ara=>{:official=>"غرينادا", :common=>"غرينادا"},
                                          :bre=>{:official=>"Grenada", :common=>"Grenada"},
                                          :ces=>{:official=>"Grenada", :common=>"Grenada"},
                                          :cym=>{:official=>"Grenada", :common=>"Grenada"},
                                          :deu=>{:official=>"Grenada", :common=>"Grenada"},
                                          :est=>{:official=>"Grenada", :common=>"Grenada"},
                                          :fin=>{:official=>"Grenada", :common=>"Grenada"},
                                          :fra=>{:official=>"Grenade", :common=>"Grenade"},
                                          :hrv=>{:official=>"Grenada", :common=>"Grenada"},
                                          :hun=>{:official=>"Grenada", :common=>"Grenada"},
                                          :ita=>{:official=>"Grenada", :common=>"Grenada"},
                                          :jpn=>{:official=>"グレナダ", :common=>"グレナダ"},
                                          :kor=>{:official=>"그레나다", :common=>"그레나다"},
                                          :nld=>{:official=>"Grenada", :common=>"Grenada"},
                                          :per=>{:official=>"گرنادا", :common=>"گرنادا"},
                                          :pol=>{:official=>"Grenada", :common=>"Grenada"},
                                          :por=>{:official=>"Grenada", :common=>"Granada"},
                                          :rus=>{:official=>"Гренада", :common=>"Гренада"},
                                          :slk=>{:official=>"Grenada", :common=>"Grenada"},
                                          :spa=>{:official=>"Granada", :common=>"Grenada"},
                                          :swe=>{:official=>"Grenada", :common=>"Grenada"},
                                          :tur=>{:official=>"Grenada", :common=>"Grenada"},
                                          :urd=>{:official=>"گریناڈا", :common=>"گریناڈا"},
                                          :zho=>{:official=>"格林纳达", :common=>"格林纳达"}},
                                        :latlng=>[12.11666666, -61.66666666],
                                        :landlocked=>false,
                                        :area=>344.0,
                                        :demonyms=>{:eng=>{:f=>"Grenadian", :m=>"Grenadian"}, :fra=>{:f=>"Grenadienne", :m=>"Grenadien"}},
                                        :flag=>"🇬🇩",
                                        :maps=>{:googleMaps=>"https://goo.gl/maps/rqWyfUAt4xhvk1Zy9", :openStreetMaps=>"https://www.openstreetmap.org/relation/550727"},
                                        :population=>112519,
                                        :fifa=>"GRN",
                                        :car=>{:signs=>["WG"], :side=>"left"},
                                        :timezones=>["UTC-04:00"],
                                        :continents=>["North America"],
                                        :flags=>{:png=>"https://flagcdn.com/w320/gd.png", :svg=>"https://flagcdn.com/gd.svg"},
                                        :coatOfArms=>{:png=>"https://mainfacts.com/media/images/coats_of_arms/gd.png", :svg=>"https://mainfacts.com/media/images/coats_of_arms/gd.svg"},
                                        :startOfWeek=>"monday",
                                        :capitalInfo=>{:latlng=>[32.38, -64.68]}
                                    }
                                  )
      expect(first_country).to_not eq(second_country)
    end
  end

  describe "#find_country" do
    it "happy path: finds a country based on valid name", :vcr do
      country_name = "Ireland"
      country = CountriesService.find_country(country_name)
      expect(country).to be_an(Array)
      expect(country.count).to eq(1)
      expect(country.first).to be_a(Hash)
      expect(country.first).to have_key(:name)
      expect(country.first[:name]).to have_key(:common)
      expect(country.second).to eq(nil)
    end
    
    it "sad path: returns a 404 error with message not found if and invalid country is entered", :vcr do
      country_name = "Drake"
      country = CountriesService.find_country(country_name)

      expect(country).to be_a(Hash)
      expect(country).to have_key(:status)
      expect(country).to have_key(:message)
      expect(country[:message]).to eq("Not Found")
    end
  end
end