class Video
  attr_reader :title, :video_id

  def initialize(results)
    @title = results[:items][0][:snippet][:title]
    @video_id = results[:items][0][:id][:videoId]
  end
end