require 'byebug'
require 'nokogiri'
require 'json'

lot_file_names = Dir["./data/2015-03-18/*"]
artists_names = []

lot_file_names.each do |file_name|
  doc = File.open(file_name) { |f| Nokogiri::HTML(f) }
  name = doc.xpath('//h2').children.to_s.gsub(/\(.*\)/, "")
  artists_names << name unless artists_names.include?(name)
end

puts artists_names.to_json