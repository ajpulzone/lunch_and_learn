class VideosService

  def self.conn
    Faraday.new(url: "https://youtube.googleapis.com") do |faraday|
      faraday.params["key"] = ENV["google_api_key"]
    end
  end

  def self.find_video_by_country(country)
    response = conn.get("/youtube/v3/search?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw&maxResults=1&q=#{country}")
    parsed_response = parsed_response(response)
  end

  def self.parsed_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end 