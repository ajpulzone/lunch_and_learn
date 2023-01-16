require "rails_helper"

RSpec.describe VideosService do
  describe "#find_video_by_country" do
    describe "happy path" do
      it "searches API for video based on country that is passed in" do
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
    end

    xdescribe "sad path" do
      it "NEEDS TO BE WRITTEN" do

      end
    end
  end 
end 
