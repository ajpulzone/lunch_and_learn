require "rails_helper"

RSpec.describe ImagesService do
  describe "#find_images_by_country" do
    it "happy path: searches API for images based on country that is passed in, returns a hash", :vcr do
      country = "Ireland"
      results = ImagesService.find_images_by_country(country)

      expect(results).to be_a(Hash)
      expect(results).to have_key(:results)
      expect(results[:results]).to be_a(Array)
      expect(results[:results][0]).to be_a(Hash)
      expect(results[:results][0]).to have_key(:alt_description)
      expect(results[:results][0][:alt_description]).to be_a(String)
      expect(results[:results][0]).to have_key(:urls)
      expect(results[:results][0][:urls]).to be_a(Hash)
      expect(results[:results][0][:urls]).to have_key(:regular)
      expect(results[:results][0][:urls][:regular]).to be_a(String)
    end 

    it "sad path: returns a hash with no results if an invalid country is passed in", :vcr do
      country = "oweigh   [93857= 2374 p2398y5 `p98yuh9hi39jg"
      results = ImagesService.find_images_by_country(country)

      expect(results).to be_a(Hash)
      expect(results).to have_key(:results)
      expect(results[:results]).to be_a(Array)
      expect(results[:results]).to eq([])
    end
  end 
end