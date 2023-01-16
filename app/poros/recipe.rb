class Recipe
  attr_reader :title, :url, :image_url

  def initialize(country, result)
    binding.pry
    @title = data[:recipe][:label]
    @url = data[:recipe][:shareAs]
    @image_url = data[:recipe][:image]
  end
end