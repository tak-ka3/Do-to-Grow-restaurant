require 'uri'
require 'net/http'
require 'json'

puts 'hoge'
api_key = "6dbc19172ff32721"
# 最後にformat=jsonをつけることで、xmlからjson形式変えることができる。
url = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{api_key}&large_area=Z011&order=4&format=json"
uri = URI.parse(url)
response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") do |http| 
  http.open_timeout = 5
  http.read_timeout = 10
  http.get(uri.request_uri)
end
@result = JSON.parse(response.body)["results"]
p @result["results_available"]
@shops = @result["shop"]

p shops.size

shops.each do |shop|
  puts shop["name"]
  puts shop["genre"]["name"]
  puts shop["budget"]["average"]
  puts shop["address"]
  puts shop["catch"]
  puts shop["photo"]["pc"]["m"]
end