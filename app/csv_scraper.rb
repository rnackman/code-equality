class CSVScraper

  attr_accessor :all

  def initialize
    @all = []
    scrape
  end

  def scrape
    data = File.read("./db/SHEET1.csv").split("\n").shift(6)
    data.each do |woman|
      woman.split(",")[0..1].each do |name|
        name[0].strip!
        name[1].strip!
      end
      @all << "#{full_name[1]} #{full_name[0]}"
    end
  end
end
