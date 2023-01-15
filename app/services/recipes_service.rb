class RecipesService

  def self.conn
    Faraday.new(url: "https://api.edamam.com") do |faraday|
      faraday.params["app_key"] = ENV["edamam_recipe_api_key"]
      faraday.params["app_id"] = ENV["edamam_app_id"]
    end
  end

  def self.find_recipes(country)
    response = conn.get("/api/recipes/v2?type=public&q=#{country}")
    parsed_response = parsed_response(response)
  end

  def self.parsed_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end