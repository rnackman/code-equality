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
      full_name = woman.split(",")[0..1]
      full_name.each do |name|
        name[0].strip!
        name[1].strip!
      end
      @all << "#{full_name[1]} #{full_name[0]}"
    end
  end
end