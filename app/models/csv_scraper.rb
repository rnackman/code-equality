class CSVScraper

  attr_accessor :all

  def initialize
    @all = []
    scrape
  end

  def scrape
    data = File.read("./db/SHEET1.csv")
    data = data.split("\n")
    data.shift(6)
    data.each do |woman|
      self.all << woman.split(",")[0..1].compact
    end
    self.all.each do |full_name|
      full_name[0].strip!
      full_name[1].strip!
    end
  end
end