class CountriesFacade

  def self.countries 
    results = CountriesService.get_all_countries
    results.map do |result|
      Country.new(result)      
    end
  end

  def self.find_a_country(country)
    result = CountriesService.find_country(country)
    Country.new(result.first)
  end

  def self.random_country
    countries.sample
  end
end