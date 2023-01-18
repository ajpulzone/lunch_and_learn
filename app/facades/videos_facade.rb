class VideosFacade

  def self.video_by_country(country)
    results = VideosService.find_video_by_country(country)
    if results[:items].empty? == false
      Video.new(results)
    else 
      error_results = { :items=>[{:id=>{:videoId=>"No video found"}, :snippet=>{:title=>"No video found" }}]}
      Video.new(error_results)
    end  
  end
end