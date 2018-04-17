require 'byebug'
require 'nokogiri'
require 'json'

lot_file_names = Dir["./data/2015-03-18/*"]
lots= []

lot_file_names.each do |file_name|
  doc = File.open(file_name) { |f| Nokogiri::HTML(f) }
  artist_name = doc.xpath('//h2').children.to_s.gsub(/\(.*\)/, "")
  artwork_title = doc.xpath('//h3').children.first.to_s
  lot_cost = doc.xpath('//div').children.last.to_s
  lots << {name: artist_name, works: [{title: artwork_title, price:lot_cost }]}.to_json
end

puts lots
