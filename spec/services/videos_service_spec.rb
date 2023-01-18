require "rails_helper"

RSpec.describe VideosService do
  describe "#find_video_by_country" do
    it "happy path: searches API for video based on country that is passed in", :vcr do
      country = "Ireland"
      results = VideosService.find_video_by_country(country)

      expect(results).to be_a(Hash)
      expect(results).to have_key(:items)
      expect(results[:items]).to be_a(Array)
      expect(results[:items][0]).to have_key(:id)
      expect(results[:items][0][:id]).to be_a(Hash)
      expect(results[:items][0][:id]).to have_key(:videoId)
      expect(results[:items][0][:id][:videoId]).to be_a(String)
      expect(results[:items][0]).to have_key(:snippet)
      expect(results[:items][0][:snippet]).to be_a(Hash)
      expect(results[:items][0][:snippet]).to have_key(:title)
      expect(results[:items][0][:snippet][:title]).to be_a(String)
    end 

    it "sad path: if an invalid country is entered it returns a hash, without any video information in the items key", :vcr do
      country = "Drake Is A Good Boy"
      results = VideosService.find_video_by_country(country)

      expect(results).to be_a(Hash)
      expect(results).to have_key(:items)
      expect(results[:items]).to eq([])
    end

    it "sad path: if valid country is entered, but no videos are found, it returns a hash, without any video information in 
      the items key", :vcr do
        country = "Sualawesi"
        results = VideosService.find_video_by_country(country)

        expect(results).to be_a(Hash)
        expect(results).to have_key(:items)
        expect(results[:items]).to eq([])
    end
  end 
end 
