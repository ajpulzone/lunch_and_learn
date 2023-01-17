require "rails_helper"

RSpec.describe VideosFacade do
  describe "#video_by_country" do
    xdescribe "happy_path - NEED TO STUB" do
### WILL NEED TO STUB, RESULTS for title and id KEEP CHANGING***
      it "returns a video object when a valid country is entered" do
        country = "Ireland"
        video = VideosFacade.video_by_country(country)

        expect(video).to be_an_instance_of(Video)
        expect(video.title).to eq("A Super Quick History of Northern Ireland")
        expect(video.video_id).to eq("IU0tzcgcb-Q")
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