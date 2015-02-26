class WikiStats
attr_accessor :url, :name

  def initialize(name)
    @name = name
    @url = "http://stats.grok.se/en/latest90/#{name.gsub(" ", "_")}"
  end

  def scrape_stats(name) 
    html = open(self.url)
    data = Nokogiri::HTML(html)
    data.css("p:nth-child(3)").text
  end
end

# WikiStats.new(<woman's name>).scrape_stats.strip.delete("\n").gsub("_", " ")
# Calling the above will give us "Grace Hopper was viewed ##### times in the last 90 days."
# Pulling from a stats site about Wikipedia.
# This should go into our ERB file so that it's pulling in real time.