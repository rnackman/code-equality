require './config/environment.rb'

amazing_women = CSVScraper.new.all

amazing_women.each do |woman|
  woman.gsub!(/ë/, 'e')
  woman.gsub!(/ö/, 'o')
  woman.gsub!(/ğ/, 'g')
  woman.gsub!(/Ö/, 'O')
  Seed.new(woman)
end
