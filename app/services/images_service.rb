class ImagesService

  def self.conn
    Faraday.new(url: "https://api.unsplash.com") do |faraday|
      faraday.params["client_id"] = ENV["unsplash_api_key"]
    end
  end

  def self.find_images_by_country(country)
    response = conn.get("/search/photos?page=1&per_page=10&order_by=relevant&query=#{country}")
    parsed_response = parsed_response(response)
  end

  def self.parsed_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end 

