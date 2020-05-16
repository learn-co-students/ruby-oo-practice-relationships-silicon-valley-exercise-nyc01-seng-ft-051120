require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
venture_capitalist1 = VentureCapitalist.new("investor1", 10000000)
venture_capitalist2 = VentureCapitalist.new("investor2", 10000000)
venture_capitalist3 = VentureCapitalist.new("investor3", 1000000000)

startup1 = Startup.new("startup1", "founder1", "domain1")
startup2 = Startup.new("startup2", "founder2", "domain1")
startup3 = Startup.new("startup3", "founder3", "domain3")

funding_round1 = FundingRound.new(startup1, venture_capitalist1, "type1", 5000000)
funding_round2 = FundingRound.new(startup2, venture_capitalist1, "type2", 7000000)
funding_round3 = FundingRound.new(startup1, venture_capitalist3, "type3", 9000000)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line
