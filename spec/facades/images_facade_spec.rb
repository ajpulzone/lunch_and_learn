require "rails_helper"

RSpec.describe ImagesFacade do
  describe "#images_by_country" do
    it "returns an array of image objects when a valid country is entered", :vcr do
      country = "Ireland"
      images = ImagesFacade.images_by_country(country)

      expect(images.count).to eq(10)
      expect(images).to be_an(Array)
      expect(images[0]).to be_an_instance_of(Image)
      expect(images[0].alt_tag).to eq("landscape photo of mountain island")
      expect(images[0].url).to eq("https://images.unsplash.com/photo-1502085671122-2d218cd434e6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHwxfHxJcmVsYW5kfGVufDB8fHx8MTY3Mzk4MjcyNA&ixlib=rb-4.0.3&q=80&w=1080")
      expect(images[1].alt_tag).to eq("young and adult sheep standing on mountain")
      expect(images[1].url).to eq("https://images.unsplash.com/photo-1459789587767-1a947412a440?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHwyfHxJcmVsYW5kfGVufDB8fHx8MTY3Mzk4MjcyNA&ixlib=rb-4.0.3&q=80&w=1080")
      expect(images[2].alt_tag).to_not eq("landscape photo of mountain island")
      expect(images[2].url).to_not eq("https://images.unsplash.com/photo-1502085671122-2d218cd434e6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHwxfHxJcmVsYW5kfGVufDB8fHx8MTY3Mzg5MjM0Mg&ixlib=rb-4.0.3&q=80&w=1080")
    end
    
    it "sad path: will return empty array if no country is passed in", :vcr do
      country = ""
      images = ImagesFacade.images_by_country(country)

      expect(images.count).to eq(0)
      expect(images).to be_an(Array)
      expect(images).to eq([])      
    end
    
    it "sad path: returns an empty array if no images found", :vcr do
      country = "oweigh   [93857= 2374 p2398y5 `p98yuh9hi39jg"
      images = ImagesFacade.images_by_country(country)

      expect(images.count).to eq(0)
      expect(images).to be_an(Array)
      expect(images).to eq([]) 
    end
  end 
end 