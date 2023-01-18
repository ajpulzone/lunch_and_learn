require "rails_helper"

RSpec.describe VideosFacade do
  describe "#video_by_country" do
    it "happy path: returns a video object when a valid country is entered", :vcr do
      country = "Ireland"
      video = VideosFacade.video_by_country(country)

      expect(video).to be_an_instance_of(Video)
      expect(video.title).to eq("A Super Quick History of Northern Ireland")
      expect(video.video_id).to eq("IU0tzcgcb-Q")
    end

    it "sad path: will return a video object with title and id = 'No video found' if invalid country is entered", :vcr do
      country = "Drake Is A Good Boy"
      video = VideosFacade.video_by_country(country)

      expect(video).to be_an_instance_of(Video)
      expect(video.title).to eq("No video found")
      expect(video.video_id).to eq("No video found")
    end

    it "sad path: will return a video object with title and id = 'No video found' if a valid country is entered but no videos are found", :vcr do
      country = "Sualawesi"
      video = VideosFacade.video_by_country(country)

      expect(video).to be_an_instance_of(Video)
      expect(video.title).to eq("No video found")
      expect(video.video_id).to eq("No video found")
    end
  end 
end 