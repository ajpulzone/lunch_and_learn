require "rails_helper"

RSpec.describe LearningResourcesFacade do
  describe "#resources_by_country" do
    it "happy path: returns a learning resource consisting of country, videos and images based on counry of input", :vcr do
      country = "Ireland"
      learning_resources = LearningResourcesFacade.resources_by_country(country)

      expect(learning_resources.country).to eq("Ireland")
      expect(learning_resources.images[0].alt_tag).to eq("landscape photo of mountain island")
      expect(learning_resources.images[0].url).to eq("https://images.unsplash.com/photo-1502085671122-2d218cd434e6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHwxfHxJcmVsYW5kfGVufDB8fHx8MTY3Mzk4MjcyNA&ixlib=rb-4.0.3&q=80&w=1080")
      expect(learning_resources.video.title).to eq("A Super Quick History of Northern Ireland")
      expect(learning_resources.video.video_id).to eq("IU0tzcgcb-Q")
    end

    it "sad path: if an invalid country is entered it returns a Learning Resource Object with images, but no videos", :vcr do
      country = "KGUYGUEYGWEGijhwegoihwe435"
      learning_resources = LearningResourcesFacade.resources_by_country(country)

      expect(learning_resources.country).to eq(country)
      expect(learning_resources.images).to eq([])
      expect(learning_resources.video.title).to eq("No video found")
      expect(learning_resources.video.video_id).to eq("No video found")
    end

    it "sad path: if a valid country is entered but no pictures or video is found, it returns a Learning Resources Object 
      with an empty images key, and video with title and video_id = 'No video found' ", :vcr do
        country = "Sualawesi"
        learning_resources = LearningResourcesFacade.resources_by_country(country)

        expect(learning_resources.country).to eq(country)
        expect(learning_resources.images).to eq([])
        expect(learning_resources.video.title).to eq("No video found")
        expect(learning_resources.video.video_id).to eq("No video found")
    end
  end 
end 