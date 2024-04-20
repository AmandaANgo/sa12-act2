require 'httparty'
require 'json'

def fetch_and_display_time(area, location)
  url = "http://worldtimeapi.org/api/timezone/#{area}/#{location}"
  response = HTTParty.get(url)
  time_data = JSON.parse(response.body)

  current_time = Time.parse(time_data['datetime'])
  format_time = current_time.strftime("%Y-%m-%d %H:%M:%S")

  puts "The current time in #{area}/#{location} is #{format_time}"
end

fetch_and_display_time('Europe', 'London')