require './lib/myextractor'
require 'nokogiri'
require 'net/https'

req = Net::HTTP.new('example.com', 443)

req.use_ssl = true

response = req.get("/")
doc = Nokogiri::HTML(response.body)

myextractor = Myextractor.new(req, doc)

puts myextractor.get_element



