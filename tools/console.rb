require_relative '../config/environment.rb'
require 'pry'
require_relative '../app/models/startup.rb'
require_relative '../app/models/venture_capitalist.rb'
require_relative '../app/models/funding_round.rb'
def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("Facebook", "Mark Zuckerberg", "facebook.com")
startup2 = Startup.new("Instagram", "Kevin Systrom", "instagram.com")
startup3 = Startup.new("Airbnb", "Brain Chesky", "airbnb.com")

venture_capitalist1 = VentureCapitalist.new("Hannah", 900_000_000)
venture_capitalist2 = VentureCapitalist.new("Michael", 700_000_000)
venture_capitalist3 = VentureCapitalist.new("Chloe", 1_500_000_000)
venture_capitalist4 = VentureCapitalist.new("David", 2_000_000_000)
venture_capitalist5 = VentureCapitalist.new("Yong", 2_500_000_000)

funding_round1 = FundingRound.new(startup1, venture_capitalist5, "angel", -500)
funding_round2 = FundingRound.new(startup2, venture_capitalist4, "seed", 1000)
funding_round3 = FundingRound.new(startup2, venture_capitalist1, "series-a", 2000)
funding_round4 = FundingRound.new(startup3, venture_capitalist2, "angel", 4000)
funding_round5 = FundingRound.new(startup2, venture_capitalist3, "seed", 5000)
funding_round6 = FundingRound.new(startup2, venture_capitalist3, "angel", 3000)
funding_round7 = FundingRound.new(startup1, venture_capitalist3, "series-a", 7000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line