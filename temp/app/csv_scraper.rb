class CSVScraper

  attr_accessor :all

  def initialize
    @all = []
    scrape
  end

  def scrape
    data = File.read("./db/SHEET1.csv").split("\n").each do |woman|
      first = woman.split(",")[1].strip
      last = woman.split(",")[0].strip
      @all << "#{first} #{last}"
    end
  end

end
