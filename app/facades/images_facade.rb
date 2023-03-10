class ImagesFacade

  def self.images_by_country(country)
    results = ImagesService.find_images_by_country(country)
    results[:results].map do |result|
      Image.new(result)
    end 
  end
end