
require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


investor1 = VentureCapitalist.new("Beth",2000000000)
investor2 = VentureCapitalist.new("Holly",20000000)

startup1 = Startup.new("cool_app","cool.com","Sam G")
startup2 = Startup.new("fun_app","fun.com","John")

funding1 = FundingRound.new(startup1,investor1,"seedmoney", 1000)
funding2 = FundingRound.new(startup1,investor2,"advancedfunding", 7000)
funding3 = FundingRound.new(startup2,investor1,"initialcapitalmoney", 3000)
funding4 = FundingRound.new(startup1,investor1,"evenmorefunding", 10000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line