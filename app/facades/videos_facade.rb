class VideosFacade

  def self.video_by_country(country)
    results = VideosService.find_video_by_country(country)
    Video.new(results)
  end
end