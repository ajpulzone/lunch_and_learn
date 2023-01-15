class CountriesService

  def self.conn 
    Faraday.new(url: "https://restcountries.com")
  end

  def self.get_all_countries
    response = conn.get("/v3.1/all")
    parsed_response = parsed_response(response)
  end

  def self.parsed_response(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end