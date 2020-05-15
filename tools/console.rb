require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s = Startup.new("Zoom", "Some Dude", "domain1")
s1 = Startup.new("Slack", "Some Other Dude", "domain2")
s2 = Startup.new("Skype", "Some Lady", "domain3")
vc = VentureCapitalist.new("Tom", 1000000)
vc1 = VentureCapitalist.new("John",2000000)
vc3 = VentureCapitalist.new("Harry",1100000000)
fr = FundingRound.new(s, vc3, "Angel", 1100000000)
fr1 = FundingRound.new(s1, vc, "Pre-Seed", 1000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line