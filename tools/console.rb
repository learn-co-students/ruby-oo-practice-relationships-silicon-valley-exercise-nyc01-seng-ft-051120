require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

require 'pry'


require_relative '../app/models/startup'
require_relative '../app/models/venture_capitalist.rb'
require_relative '../app/models/funding_round.rb'
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
pipermusic = Startup.new("Piper Music", "Richard Hendricks", "Music")
piedpiper = Startup.new("Pied Piper", "Richard Henricks", "Compression")
hooli = Startup.new("Hooli", "Gavin Belson", "Tech")

russ = VentureCapitalist.new("Russ Hanneman", 1_000_000_001)
laurie = VentureCapitalist.new("Laurie Bream", 500_000_000)
peter = VentureCapitalist.new("Peter Gregory", 2_000_000_000)

piedpiper.sign_contract(peter, "Angel", 1_000_000)
piedpiper.sign_contract(laurie, "Series A", 500_000)
piedpiper.sign_contract(russ, "Series C", 50_000)
hooli.sign_contract(russ, "Series C", 2_000_000)
hooli.sign_contract(russ, "Series B", 9_000_000_000)

puts piedpiper.name.class == String
puts piedpiper.founder.class == String
puts piedpiper.domain.class == String
puts piedpiper.pivot("Internet", "Pipernet") == piedpiper
puts piedpiper.domain == "Internet"
puts piedpiper.name == "Pipernet"

puts Startup.all.include?(piedpiper)
puts Startup.all.include?(hooli)

puts Startup.find_by_founder("Richard Hendricks") == pipermusic

puts Startup.domains.include?("Music")
puts Startup.domains.include?("Internet")
puts Startup.domains.include?("Tech")

puts russ.name == "Russ Hanneman"







binding.pry
#leave this here to ensure binding.pry isn't the last line