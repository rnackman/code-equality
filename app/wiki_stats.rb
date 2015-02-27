class WikiStats
attr_accessor :url, :name

  def initialize(name)
    @name = name
    @url = "http://stats.grok.se/en/latest90/#{name.gsub(" ", "_")}"
  end

  def scrape_stats
    html = open(self.url)
    data = Nokogiri::HTML(html)
    data.css("p:nth-child(3)").text
  end
end