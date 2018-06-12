class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    student_hash.each{|c,b| self.send("#{c}=", b)}
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each{|e| self.new(e)}
    
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each{|a,b| self.send("#{a}=", b)}
    self 
  end

  def self.all
    @@all 
  end
end

class Umbrella::Weather
  attr_accessor :temperature, :wind, :sunrise, :sunset, :weather_condition, :rain_perc
  
  
  def self.weather_setter
    
    doc = Nokogiri::HTML(open("https://weather.com/weather/today/l/Chicago+IL+USIL0225:1:US"))
    
    rain = self.new 
    
    rain.temperature = doc.search("div.today_nowcard-temp").text
    rain.weather_condition = doc.search("div.today_nowcard-phrase").text 
    rain.wind = doc.search("div.today_nowcard-sidecar").search("td")[0].text
    rain.sunrise = doc.search("span.wx-dsxdate")[0].text
    rain.sunset = doc.search("span.wx-dsxdate")[1].text
    rain.rain_perc = doc.search("span.precip-val").first.text
  
  end 
