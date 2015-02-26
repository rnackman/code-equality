class GraceHopperTime

  def call
    GraceHopperTime.new
  end

  def initialize
    @programmers = ['Grace Hopper', 'Ada Lovelace']
    @tweets = TweetGrabber.new.tap { |e| e.populate('mixed', @programmers) }
    @wikiquotes = WikiScraper.new.tap { |e| e.scrape(@programmers) }
    start
  end

  def start
    i = 1
    loop do
      sleep 1.5
      system "clear"
      i += 1
      if i % 2 == 0
        GraceClock.tick
        @tweets.random
      else
        GraceClock.tock
        @wikiquotes.random(@programmers.sample)
      end
    end
  end
end

# We'll need to rework all of this so that we're calling on the pre-seeded database for our information.