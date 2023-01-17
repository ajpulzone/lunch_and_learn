class LearningResourcesFacade

  def self.resources_by_country(country)
    video = VideosFacade.video_by_country(country)
    images = ImagesFacade.images_by_country(country)
    LearningResource.new(country, video, images)
  end
end