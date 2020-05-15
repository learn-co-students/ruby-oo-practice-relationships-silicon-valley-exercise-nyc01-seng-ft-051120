require_relative '../config/environment.rb'
require 'pry'
require_relative '..app/models/startup.rb'
require_relative '..app/models/venture_capitalist.rb'
require_relative '..app/models/funding_round.rb'
def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

a = Startup.new("Bank", "Chase", "Moneys")
b = Startup.new("Food", "Nick", "Not Moneys")

c = VentureCapitalist.new()
binding.pry
0 #leave this here to ensure binding.pry isn't the last line