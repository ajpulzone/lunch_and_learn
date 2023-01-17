require "rails_helper"

RSpec.describe LearningResourcesFacade do
  describe "#resources_by_country" do
    describe "happy_path - NEED TO STUB" do
      it "returns a learning resource consisting of country, videos and images based on counry of input" do
        country = "Ireland"
        learning_resources = LearningResourcesFacade.resources_by_country(country)

        expect(learning_resources.country).to eq("Ireland")
        expect(learning_resources.images[0].alt_tag).to eq("landscape photo of mountain island")
        expect(learning_resources.images[0].url).to eq("https://images.unsplash.com/photo-1502085671122-2d218cd434e6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHwxfHxJcmVsYW5kfGVufDB8fHx8MTY3Mzg5MjM0Mg&ixlib=rb-4.0.3&q=80&w=1080")
        expect(learning_resources.video.title).to eq("A Super Quick History of Northern Ireland")
        expect(learning_resources.video.video_id).to eq("IU0tzcgcb-Q")
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