Objective: Spread awareness about women in technology and highlight dearth of easily-accessible, centralized online information (via Wikipedia) about these important women.

Working List -- to GROW:
1. Grace Hopper
2. Sandi Metz
3. Anita Borg
4. Ada Lovelace
5. Katherine Johnson

Project Spec:

1. Create a list of women in technology to include in the project.
2. Populate a database with the following information about each woman in technology:
  - :individuals table: name, brief intro (scraped from Wikipedia, Wikiquotes, other sources?)
  [TODO: Add birthdate to schema.]
  - :quotes table: quote text, source, individual_id
  - :articles table: article_url, individual_id ## TODO: figure out a news source API
  [TODO: Delete tweets from db schema.]

TODO: Create ERB templates and generate pages for each woman.

3. Display in live website:
  - Index of all women included in the project.
  - Page for each woman:
    - Wikipedia bio/summary IF AVAILABLE
    - IF NOT AVAILABLE:
       - Guilt: Display number of days since woman's birthdate that she hasn't had a Wikipedia page.
       TODO: Figure out how to trigger this if the Wikipedia scrape comes up blank; 404 Error seems to be thrown. Write a rescue that does the guilt trip.
       - Suggest that someone start the Wikipedia page; provide link to stub page creator on Wiki.
       - Embed a pre-composed Tweet for the lazy, notifying followers of this missing Wiki presence and suggesting they fix.
    - Recent tweets about this woman (using TweetGrabber class). Refresh upon page refresh.

Easter egg possibility: backwards ticking clock on Grace Hopper page?