require "rails_helper"

RSpec.describe Video do
  it "it exists" do
    data = {items: [{id: {videoId: "CvU-NKzhIVI"}, snippet: {title: "A Super Quick History of Northern Ireland"}}]}
    video = Video.new(data)
    expect(video).to be_an_instance_of(Video)
  end
  
  it "it has readable attributes" do
    data = {items: [{id: {videoId: "CvU-NKzhIVI"}, snippet: {title: "A Super Quick History of Northern Ireland"}}]}
    video = Video.new(data)
  
    expect(video.title).to eq("A Super Quick History of Northern Ireland")
    expect(video.video_id).to eq("CvU-NKzhIVI")
    expect(video.title).to_not eq("Ireland")    
  end
end
