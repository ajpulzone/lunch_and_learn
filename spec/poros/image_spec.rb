require "rails_helper"

RSpec.describe Image do
  it "it exists" do
    data = {id: "DXQB5D1njMY", alt_description: "landscape photo of mountain island", urls: {regular: "https://images.unsplash.com/photo-1502085671122-2d218cd434e6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHwxfHxJcmVsYW5kfGVufDB8fHx8MTY3Mzg5MjM0Mg&ixlib=rb-4.0.3&q=80&w=1080"}}
    image = Image.new(data)
    expect(image).to be_an_instance_of(Image)
  end
  
  it "it has readable attributes" do
    data = {id: "DXQB5D1njMY", alt_description: "landscape photo of mountain island", urls: {regular: "https://images.unsplash.com/photo-1502085671122-2d218cd434e6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHwxfHxJcmVsYW5kfGVufDB8fHx8MTY3Mzg5MjM0Mg&ixlib=rb-4.0.3&q=80&w=1080"}}
    image = Image.new(data)
  
    expect(image.alt_tag).to eq("landscape photo of mountain island")
    expect(image.url).to eq("https://images.unsplash.com/photo-1502085671122-2d218cd434e6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTg4NjZ8MHwxfHNlYXJjaHwxfHxJcmVsYW5kfGVufDB8fHx8MTY3Mzg5MjM0Mg&ixlib=rb-4.0.3&q=80&w=1080")
    expect(image.alt_tag).to_not eq("Ireland Mountain Home")
  end
end
