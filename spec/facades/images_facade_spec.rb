require "rails_helper"

RSpec.describe ImagesFacade do
  describe "#images_by_country" do
    describe "happy_path" do
      it "returns an array of video objects when a valid country is entered" do
        country = "Ireland"
        video = ImagesFacade.images_by_country(country)
        binding.pry
        expect(video).to be_an_instance_of(Video)
        expect(video.title).to eq("A Super Quick History of Ireland")
        expect(video.video_id).to eq("CvU-NKzhIVI")
      end
    end

    xdescribe "sad path" do
      it "NEEDS TO BE WRITTEN: invalid country" do

      end

      it "NEEDS TO BE WRITTEN: valid country, no images found" do

      end
    end
  end 
end 