require "rails_helper"

RSpec.describe LearningResource do
  it "it exists" do
    country = "Ireland"
    video = {
                    "id": {
                      "videoId": "IU0tzcgcb-Q"
              },
                    "snippet": {
                      "title": "A Super Quick History of Northern Ireland"
              }
            }
    images = [
                {
                        "alt_tag": "landscape photo of mountain island",
                        "url": "https://images.unsplash.com/photo-1502085671122-2d218cd434e6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHwxfHxJcmVsYW5kfGVufDB8fHx8MTY3Mzk4MjcyNA&ixlib=rb-4.0.3&q=80&w=1080"
                  },
                {
                        "alt_tag": "young and adult sheep standing on mountain",
                        "url": "https://images.unsplash.com/photo-1459789587767-1a947412a440?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHwyfHxJcmVsYW5kfGVufDB8fHx8MTY3Mzk4MjcyNA&ixlib=rb-4.0.3&q=80&w=1080"
                  },
                {
                        "alt_tag": "body of water during daytime",
                        "url": "https://images.unsplash.com/photo-1535479804851-93f60320e644?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHwzfHxJcmVsYW5kfGVufDB8fHx8MTY3Mzk4MjcyNA&ixlib=rb-4.0.3&q=80&w=1080"
                  },
                {
                        "alt_tag": "scenery of a waterfall",
                        "url": "https://images.unsplash.com/photo-1511132972173-58eebd7409d2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHw0fHxJcmVsYW5kfGVufDB8fHx8MTY3Mzk4MjcyNA&ixlib=rb-4.0.3&q=80&w=1080"
                  }
              ]
    learning_resource = LearningResource.new(country, video, images)
    
    expect(learning_resource).to be_an_instance_of(LearningResource)
  end
  
  it "it has readable attributes" do
    country = "Ireland"
    video = {
                    "id": {
                      "videoId": "IU0tzcgcb-Q"
              },
                    "snippet": {
                      "title": "A Super Quick History of Northern Ireland"
              }
            }
    images = [
                {
                        "alt_tag": "landscape photo of mountain island",
                        "url": "https://images.unsplash.com/photo-1502085671122-2d218cd434e6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHwxfHxJcmVsYW5kfGVufDB8fHx8MTY3Mzk4MjcyNA&ixlib=rb-4.0.3&q=80&w=1080"
                  },
                {
                        "alt_tag": "young and adult sheep standing on mountain",
                        "url": "https://images.unsplash.com/photo-1459789587767-1a947412a440?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHwyfHxJcmVsYW5kfGVufDB8fHx8MTY3Mzk4MjcyNA&ixlib=rb-4.0.3&q=80&w=1080"
                  },
                {
                        "alt_tag": "body of water during daytime",
                        "url": "https://images.unsplash.com/photo-1535479804851-93f60320e644?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHwzfHxJcmVsYW5kfGVufDB8fHx8MTY3Mzk4MjcyNA&ixlib=rb-4.0.3&q=80&w=1080"
                  },
                {
                        "alt_tag": "scenery of a waterfall",
                        "url": "https://images.unsplash.com/photo-1511132972173-58eebd7409d2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHw0fHxJcmVsYW5kfGVufDB8fHx8MTY3Mzk4MjcyNA&ixlib=rb-4.0.3&q=80&w=1080"
                  }
              ]

    learning_resource = LearningResource.new(country, video, images)

    expect(learning_resource.country).to be_a(String)
    expect(learning_resource.country).to eq("Ireland")
    expect(learning_resource.images).to be_an(Array)
    expect(learning_resource.images[0]).to have_key(:alt_tag)
    expect(learning_resource.images[0]).to have_key(:url)
  end
end
