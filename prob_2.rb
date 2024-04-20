require 'net/http'
require 'json'

url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd'
response = Net::HTTP.get(URI(url))
data = JSON.parse(response)

cryptocurrencies = data.map do |coin|
  {
    name: coin['name'],
    price: coin['current_price'],
    market_cap: coin['market_cap']
  }
end

sorted_crypto = cryptocurrencies.sort_by { |coin| -coin[:market_cap] }

puts 'Top 5 Cryptocurrencies by Market Capitalization:'
sorted_crypto.first(5).each do |coin|
  puts "#{coin[:name]} (Price: $#{coin[:price]}, Market Cap: $#{coin[:market_cap]})"
end