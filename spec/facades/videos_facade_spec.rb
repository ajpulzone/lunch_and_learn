require "rails_helper"

RSpec.describe VideosFacade do
  describe "#video_by_country" do
    describe "happy_path" do
      
      it "returns a video object when a valid country is entered" do
        country = "Ireland"
        video = VideosFacade.video_by_country(country)

        expect(video).to be_an_instance_of(Video)
        expect(video.title).to eq("A Super Quick History of Ireland")
        expect(video.video_id).to eq("CvU-NKzhIVI")
      end
    end

    xdescribe "sad path" do
      it "NEEDS TO BE WRITTEN: invalid country" do

      end

      it "NEEDS TO BE WRITTEN: valid country, no videos found" do

      end
    end
  end 
end 