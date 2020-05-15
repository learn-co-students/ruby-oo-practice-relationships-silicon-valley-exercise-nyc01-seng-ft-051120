require 'pry'

class FundingRound

   attr_accessor :type
   attr_reader :startup, :venture_capitalist

   @@all = []

   def initialize(startup, venture_capitalist, type, investment)
      @startup = startup
      @venture_capitalist = venture_capitalist
      @type = type
      @investment = investment.to_f.abs
      @@all << self
   end



end
