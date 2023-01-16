class Recipe
  attr_reader :title, :url, :image_url, :country

  def initialize(result, country)
    @title = result[:recipe][:label]
    @url = result[:recipe][:shareAs]
    @image_url = result[:recipe][:image]
    @country = country
  end
end